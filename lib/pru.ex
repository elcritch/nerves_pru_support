defmodule Pru do
  @moduledoc """
  BeagleBone Black/Green PRU Helper Library
  """

  # Sysfs location from kernel 4.9
  @sysfs_pru0 "/sys/class/remoteproc/remoteproc1"
  @sysfs_pru1 "/sys/class/remoteproc/remoteproc2"

  @doc """
  Loads the cape-universal and cape-univ-hdmi to maximize
  the number of available pins since HDMI is disabled

  Returns ':ok'

  ## Examples

  iex> Pru.init_pins
  :ok

  """
  def init_pins do
    :os.cmd('config-pin overlay cape-universal > /dev/null')
    :os.cmd('config-pin overlay cape-univ-hdmi > /dev/null')
    {:ok}
  end

  @doc """
  Loads the rpmsg_pru kernel module to enable RPMsg communication.
  Enables /dev/rpmsg_pru3(0/1) depending on which PRU has the
  correct calls to probe the module.

  Returns ':ok'

  ## Examples

  iex> Pru.init_rpmsg
  :ok

  """
  def init_rpmsg do
    :os.cmd('modprobe rpmsg_pru')
    {:ok}
  end

  @doc """
  Boots the specified PRU core.

  Returns ':ok'

  ## Examples

  iex> Pru.boot 0
  :ok

  """
  def boot(pru) do
    case pru do
      0 ->
        run("echo 'am335x-pru0-fw' > #{sysfs_pru0}/firmware")
        run("echo 'start' > #{sysfs_pru0}/state")
        {:ok}

      1 ->
        run("echo 'am335x-pru1-fw' > #{sysfs_pru1}/firmware")
        run("echo 'start' > #{sysfs_pru1}/state")
        {:ok}

      _ ->
        {:error}
    end
  end

  @doc """
  Halts the specified PRU core.

  Returns ':ok'

  ## Examples

  iex> Pru.boot 0
  :ok

  """
  def halt(pru) do
    case pru do
      0 ->
        run("echo 'start' > #{sysfs_pru0}/state")
        {:ok}

      1 ->
        run("echo 'start' > #{sysfs_pru1}/state")
        {:ok}

      _ ->
        {:error}
    end
  end

  @doc """
  Reboots the specified PRU core.

  Returns ':ok'

  ## Examples

  iex> Pru.reboot 0
  :ok

  """
  def reboot(pru) do
    halt(pru)
    boot(pru)
    {:ok}
  end

  @doc """
  Enables the specified pin for use as a GPIO output for the PRUs.

  Returns ':ok'

  ## Examples

  iex> Pru.pin_out 'P8_11'
  :ok

  """
  def pin_out(pin) do
    :os.cmd('config-pin #{pin} pruout')
    {:ok}
  end

  @doc """
  Enables the specified pin for use as a GPIO input for the PRUs.

  Returns ':ok'

  ## Examples

  iex> Pru.pin_in 'P8_11'
  :ok

  """
  def pin_in(pin) do
    :os.cmd('config-pin #{pin} pruin')
    {:ok}
  end

  def run(cmd) do
    IO.puts(:os.cmd(cmd |> to_charlist))
    :os.timestamp()
  end
end
