#include <stdint.h>
#include "spi_helpers.hpp"

#ifndef _SOFTWARE_SPI_XFERS_H
#define _SOFTWARE_SPI_XFERS_H

#include <iostream>
#include <bitset>

namespace SoftSPI {

  // ========================================================================== //
  // SPI Xfer
  // ========================================================================== //
  template <DataTxEdge CPHA = TxClockFall>
  struct SpiXfer {

    template <class Clock, class Timings, class IOPins>
    inline uint8_t xfer_cycle(uint32_t bit);
  };

  template <>
  template <class Clock, class Timings, class IOPins>
    uint8_t SpiXfer<TxClockRise>::xfer_cycle(uint32_t value)
  {
    uint8_t read = 0;

    Clock::template tick<IOPins>();

    Timings::delayCyclesP0();

    digitalWrite(IOPins::mosi(), -value);

    // when DataTxEdge == TxClockRise (CPOL=1) data will be captured at falling edge
    Timings::delayCyclesP1(); //  propagation

    Clock::template tock<IOPins>();

    Timings::delayCyclesC0(); // holding low, so there is enough time for data preparation and changing

    read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

    // wait until data is fetched by slave device,  while SCK low, checking DATAsheet for this interval
    Timings::delayCyclesC1();

    return read;
  }

  template <>
  template <class Clock, class Timings, class IOPins>
  uint8_t SpiXfer<TxClockFall>::xfer_cycle(uint32_t value)
  {
    uint8_t read = 0;

    // changing MOSI big while SCK low, propogation
    digitalWrite(IOPins::mosi(), -value);

    // there is a requirement of LOW and HIGH have identical interval!
    Timings::delayCyclesP1();

    Clock::template tick<IOPins>();

    // reading at the middle of SCK pulse
    Timings::delayCyclesC0();

    read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

    // wait until data is fetched by slave device,  while SCK high, checking DATAsheet for this interval
    Timings::delayCyclesC1();

    Clock::template tock<IOPins>();

    Timings::delayCyclesP0(); // holding low, so there is enough time for data preparation and changing

    return read;
  }



  // ========================================================================== //
  // PRU SPI Xfer
  // ========================================================================== //
  template <DataTxEdge CPHA = TxClockFall>
  struct PruSpiXfer {

    template <class Clock, class Timings, class IOPins>
    inline uint8_t xfer_cycle(uint32_t bit);
  };

  template <>
  template <class Clock, class Timings, class IOPins>
    uint8_t PruSpiXfer<TxClockRise>::xfer_cycle(uint32_t value)
  {
    // Clock::template tick<IOPins>();
    // Timings::delayCyclesP0();
    // digitalWrite(IOPins::mosi(), -value);
    digitalWrite(IOPins::mosi() | IOPins::sck(), ((-value) & IOPins::mosi()) | (Clock::on() & IOPins::sck()) );

    // when DataTxEdge == TxClockRise (CPOL=1) data will be captured at falling edge
    Timings::delayCyclesP1(); //  propagation

    Clock::template tock<IOPins>();

    Timings::delayCyclesC0(); // holding low, so there is enough time for data preparation and changing

    uint8_t read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

    // wait until data is fetched by slave device,  while SCK low, checking DATAsheet for this interval
    Timings::delayCyclesC1();

    return read;
  }

  template <>
  template <class Clock, class Timings, class IOPins>
  uint8_t PruSpiXfer<TxClockFall>::xfer_cycle(uint32_t value)
  {
    // Clock::template tock<IOPins>();
    // Timings::delayCyclesP0(); // holding low, so there is enough time for data preparation and changing
    // digitalWrite(IOPins::mosi(), -value);
    digitalWrite(IOPins::mosi() | IOPins::sck(), ((-value) & IOPins::mosi()) | (Clock::off() & IOPins::sck()) );

    // there is a requirement of LOW and HIGH have identical interval!
    Timings::delayCyclesP1();

    Clock::template tick<IOPins>();

    // reading at the middle of SCK pulse
    Timings::delayCyclesC0();

    uint8_t read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

    // wait until data is fetched by slave device,  while SCK high, checking DATAsheet for this interval
    Timings::delayCyclesC1();

    return read;
  }



}

#endif
