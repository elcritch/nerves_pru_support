# Pru

## BeagleBone Black PRU helper library for [Nerves](http://nerves-project.com)

Basic library that enables easy interaction with the PRU cores present
in the BeagleBone Black.

## Installation

[From Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pru` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pru, "~> 0.1.0"}
  ]
end
```

## Basic Usage

In a Nerves project module
```elixir
require Pru
```

Then within your functions you can call the following to control the
operation of the PRU cores.
```elixir
Pru.init_pins       # Enables pins to be used as inputs and outputs
Pru.pin_in 'P8_11'  # Allows PRUs to access P8_11 as an input
Pru.pin_out 'P8_12' # Allows PRUs to access P8_12 as an output
Pru.halt 1          # Halts PRU core 1
Pru.boot 1          # Boots PRU core 1
# Boot will fail if firmware is not loaded to /lib/firmware/am335x-pru1-fw
Pru.reboot 0        # Reboots PRU core 0
# Boot will fail if firmware is not loaded to /lib/firmware/am335x-pru0-fw
```

## RPmsg (async)

Support for async RPmsg (beta) has been added through the `/dev/rpmsg_pru(31|32)` character devices. It seems to work well but has not been thoroughly tested. 

Example usage of messaging a PRU from the Elixir side (using TI's RPmsg echo example):

```
{:ok, pid} = Pru.Port.start_link(31) # start link 
Pru.Port.register(pid)
Pru.Port.write(pid, ["hello world!"] )
{:pru_rx_msg, 31, "hello world!"} = receive do data -> data after 1_000 -> :nil end ;
```

This requires that RPmsg linux driver & PRU code are both ready and loaded. Currently the linux module can take ~10 seconds to load on my test devices (BBB Green). 

### RPmsg & Msgpax

A custom encoder and/or decoder for messages can be configured. This is useful for communicating with the PRU's using a protocol like MessagePack for easy communication of data types to/from PRU's. 

```
{:ok, pid} = Pru.Port.start_link(31, encoder: fn x -> x |> Msgpax.pack!() |> IO.iodata_to_binary() end, decoder: fn x -> x |> Msgpax.unpack!() end)
Pru.Port.register(pid)
Pru.Port.write(pid, ["setBlink", 1200] )
{:pru_rx_msg, 31, {"ok", "blink", 1200} } = receive do data -> data after 1_000 -> :nil end ;
```

This example uses the excellent [Msgpax](https://github.com/lexmag/msgpax) library. 


## TODO:

- Test RPmsg character device speed / stability
- Improve loading time
- Add `mix pru.new` generators for PRU firmware and makefiles. 


## Docs
Documentation can be found at [https://hexdocs.pm/pru](https://hexdocs.pm/pru).
