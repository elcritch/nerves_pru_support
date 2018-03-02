defmodule Pru.Port do
  use GenServer
  require Logger

  @moduledoc """
  This is an Elixir interface to Linux PRUs. Each PRU is an
  independent GenServer.
  """

  defmodule State do
    @moduledoc false
    defstruct port: nil, channel: 0, encoder: nil, decoder: nil, callbacks: []
  end

  @options [:encoder, :decoder]
  def pid_name(channel), do: String.to_atom("#{__MODULE__}.Ch#{channel}")


  def whereis(channel) do
    Process.whereis(pid_name(channeld))
  end
  # @type channel_direction :: :input | :output

  # Public API
  @doc """
  """
  @spec start_link(integer, [term]) :: {:ok, pid}
  def start_link(channel, opts \\ []) do
    name = pid_name(channel)
    Logger.info "#{__MODULE__}: process name #{pid_name}"
    GenServer.start_link(
      __MODULE__,
      [channel, Keyword.take(opts, @options)],
      Keyword.drop(opts, @options) ++ [name: name]
    )
  end

  @doc """
  Free the resources associated with channel and stop the GenServer.
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
  @spec write(pid, term()) :: :ok | {:error, term}
  def write(pid, value) do
    GenServer.call(pid, {:write, value})
  end

  @doc """
  Read the current value of the channel.
  """
  @spec read(pid) :: 0 | 1 | {:error, term}
  def read(pid) do
    GenServer.call(pid, :read)
  end

  @doc """
  Turn on "interrupts" on the input channel. The channel can be monitored for
  `:rising` transitions, `:falling` transitions, or `:both`. The process
  that calls this method will receive the messages.
  """
  @spec register(pid) :: :ok | {:error, term}
  def register(pid) do
    GenServer.cast(pid, {:register, self()})
  end

  @spec shutdown(pid) :: :ok | {:error, term}
  def register(pid) do
    GenServer.call(pid, {:close, self()})
  end

  # gen_server callbacks
  def init([channel, msgopts]) do
    Logger.info("Pru.Port init - channel: #{inspect(channel)} ")
    executable = :code.priv_dir(:nerves_pru_support) ++ '/pru_msg'

    port =
      Port.open({:spawn_executable, executable}, [
        {:args, ["pru", "#{channel}"]},
        {:packet, 2},
        :use_stdio,
        :binary,
        :exit_status
      ])

    encoder = msgopts[:encoder] || fn x -> x end
    decoder = msgopts[:decoder] || fn x -> x end

    state = %State{port: port, channel: channel, encoder: encoder, decoder: decoder, callbacks: []}
    {:ok, state}
  end

  # def handle_call(:read, _from, state) do
  #   response = call_port(state, :read, [])
  #   {:reply, response, state}
  # end

  def handle_call({:write, value}, _from, state) do
    {:ok, response} = call_port(state, :write, state.encoder.(value))
    {:reply, response, state}
  end

  def handle_call({:close, pid}, _from, %{port: port}) do
    {:stop, :normal, Port.close(port), state}
  end

  def handle_cast(:release, state) do
    {:stop, :normal, state}
  end

  def handle_cast({:register, requestor}, state) do
    new_callbacks = insert_unique(state.callbacks, requestor)
    state = %{state | callbacks: new_callbacks}
    {:noreply, state}
  end

  def handle_info({_, {:data, <<?n, message::binary>>}}, state) do
    msg = :erlang.binary_to_term(message)
    handle_port(msg, state)
  end

  def handle_info({_, other}, state) do
    Logger.error("handle_info: other - #{inspect(other)}, state: #{inspect(state)}")
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

  defp handle_port({:read, value}, state) do
    Logger.debug("Received message from PRU #{state.channel}: #{value}")
    msg = {:pru_rx_msg, state.channel, state.decoder.(value)}

    for pid <- state.callbacks do
      send(pid, msg)
    end

    {:noreply, state}
  end

  defp insert_unique(list, item) do
    if Enum.member?(list, item) do
      list
    else
      [item | list]
    end
  end
end
