defmodule Pru do
  require Logger

  @moduledoc """
  BeagleBone Black/Green PRU Helper Library
  """

  defguard is_valid_pru?(pruid) when pruid >= 0 and pruid <= 1

  @doc """
  Loads the cape-universal and cape-univ-hdmi to maximize
  the number of available pins since HDMI is disabled

  Returns ':ok'

  ## Examples

  iex> Pru.init_pins
  :ok

  """
  def init_pins do
    run("config-pin overlay cape-universal > /dev/null")
    run("config-pin overlay cape-univ-hdmi > /dev/null")
    :ok
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
    :ok
  end

  # Sysfs location from kernel 4.9
  def sysfs_path(0), do: "/sys/class/remoteproc/remoteproc1"
  def sysfs_path(1), do: "/sys/class/remoteproc/remoteproc2"
  def sysfs_path(id), do: raise("Unknown PRU: #{inspect(id)}")

  @doc """
  Boots the specified PRU core.

  Returns ':ok'

  ## Examples

  iex> Pru.boot 0
  :ok

  """
  def boot(pru) when is_valid_pru?(pru) do
    run("echo 'am335x-pru#{pru}-fw' > #{sysfs_path(pru)}/firmware")
    run("echo 'start' > #{sysfs_path(pru)}/state")
    :ok
  end

  def boot(pru), do: raise("Unknown PRU: #{inspect(pru)}")

  @doc """
  Halts the specified PRU core.

  Returns ':ok'

  ## Examples

  iex> Pru.boot 0
  :ok

  """
  def halt(pru) when is_valid_pru?(pru) do
    run("echo 'start' > #{sysfs_path(pru)}/state")
    :ok
  end

  def halt(pru), do: raise("Unknown PRU: #{inspect(pru)}")

  @doc """
  Reboots the specified PRU core.

  Returns ':ok'

  ## Examples

  iex> Pru.reboot 0
  :ok

  """
  def reboot(pru) do
    :ok = halt(pru)
    :ok = boot(pru)
    :ok
  end

  @doc """
  Enables the specified pin for use as a GPIO output for the PRUs.

  Returns ':ok'

  ## Examples

  iex> Pru.pin_out 'P8_11'
  :ok

  """
  def pin_out(pin) do
    run("config-pin #{pin} pruout")
    :ok
  end

  @doc """
  Enables the specified pin for use as a GPIO input for the PRUs.

  Returns ':ok'

  ## Examples

  iex> Pru.pin_in 'P8_11'
  :ok

  """
  def pin_in(pin) do
    run("config-pin #{pin} pruin")
    :ok
  end

  def run(cmd) do
    Logger.info(:os.cmd(cmd |> to_charlist))
    :os.timestamp()
  end
end
