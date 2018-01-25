defmodule Pru.Port do
  use GenServer

  @moduledoc """
  This is an Elixir interface to Linux PRUs. Each PRU is an
  independent GenServer.
  """

  defmodule State do
    @moduledoc false
    defstruct port: nil, pin: 0, callbacks: []
  end

  # @type pin_direction :: :input | :output

  # Public API
  @doc """
  Start and link a new PRU GenServer. `pin` should be a valid
  PRU pin number on the system should be `:input` or `:output`.
  """
  @spec start_link(integer,  [term]) :: {:ok, pid}
  def start_link(pin, opts \\ []) do
    GenServer.start_link(__MODULE__, [pin], opts)
  end

  @doc """
  Free the resources associated with pin and stop the GenServer.
  """
  @spec release(pid) :: :ok
  def release(pid) do
    GenServer.cast(pid, :release)
  end

  @doc """
  Write the specified value to the PRU. The PRU should be configured
  as an output. Valid values are `0` or `false` for logic low and `1`
  or `true` for logic high. Other non-zero values will result in logic
  high being output.
  """
  @spec write(pid, 0 | 1 | true | false) :: :ok | {:error, term}
  def write(pid, value) when is_integer(value) do
    GenServer.call(pid, {:write, value})
  end

  def write(pid, true), do: write(pid, 1)
  def write(pid, false), do: write(pid, 0)

  @doc """
  Read the current value of the pin.
  """
  @spec read(pid) :: 0 | 1 | {:error, term}
  def read(pid) do
    GenServer.call(pid, :read)
  end

  # gen_server callbacks
  def init([pin]) do
    IO.puts "Pru.Port init - pin: #{inspect pin}"
    executable = :code.priv_dir(:pru) ++ '/pru_msg'

    port =
      Port.open({:spawn_executable, executable}, [
        {:args, ["pru", "#{pin}"]},
        {:packet, 2},
        :use_stdio,
        :binary,
        :exit_status
      ])

    state = %State{port: port, pin: pin, callbacks: []}
    {:ok, state}
  end

  def handle_call(:read, _from, state) do
    response = call_port(state, :read, [])
    {:reply, response, state}
  end

  def handle_call({:write, value}, _from, state) do
    {:ok, response} = call_port(state, :write, value)
    {:reply, response, state}
  end

  def handle_call({:set_int, direction, requestor}, _from, state) do
    {:ok, response} = call_port(state, :set_int, direction)
    new_callbacks = insert_unique(state.callbacks, requestor)
    state = %{state | callbacks: new_callbacks}
    {:reply, response, state}
  end

  def handle_cast(:release, state) do
    {:stop, :normal, state}
  end

  def handle_info({_, {:data, <<?n, message::binary>>}}, state) do
    msg = :erlang.binary_to_term(message)
    handle_port(msg, state)
  end

  def handle_info({_, other}, state) do
    IO.puts "handle_info: other - #{inspect other}, state: #{inspect state}"
    {:noreply, state}
  end

  defp call_port(state, command, arguments) do
    msg = {command, arguments}
    send(state.port, {self(), {:command, :erlang.term_to_binary(msg)}})

    receive do
      {_, {:data, <<?r, response::binary>>}} ->
        {:ok, :erlang.binary_to_term(response)}
    after
      1000 -> :timedout
    end
  end

  defp handle_port({:pru_interrupt, condition}, state) do
    IO.puts "Got interrupt on pin #{state.pin}, #{condition}"
    msg = {:pru_interrupt, state.pin, condition}

    for pid <- state.callbacks do
      send(pid, msg)
    end

    {:noreply, state}
  end

  # defp pin_interrupt_condition?(:rising), do: true
  # defp pin_interrupt_condition?(:falling), do: true
  # defp pin_interrupt_condition?(:both), do: true
  # defp pin_interrupt_condition?(:none), do: true
  # defp pin_interrupt_condition?(_), do: false

  defp insert_unique(list, item) do
    if Enum.member?(list, item) do
      list
    else
      [item | list]
    end
  end
end
