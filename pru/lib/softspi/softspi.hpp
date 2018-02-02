/*
  The timing diagram is shown to the right. The timing is further described
  below and applies to both the master and the slave device.

  At CPOL=0 the base value of the clock is zero
  For CPHA=0, data is captured on the clock’s rising edge (low→high transition)
  and data is propagated on a falling edge (high→low clock transition).
  For CPHA=1, data is captured on the clock’s falling edge and data is
  propagated on a rising edge.  ->  MODE1 for Arduino SPI lib
  At CPOL=1 the base value of the clock is one (inversion of CPOL=0)
  For CPHA=0, data is captured on clock’s falling edge and data is propagated on
  a rising edge.
  For CPHA=1, data is captured on clock’s rising edge and data is propagated on
  a falling edge.
*/
// template <enum SPIPin, int pin>
// struct GPIO {
//   static int pin;
// };

#ifndef _SOFTWARE_SPI_H
#define _SOFTWARE_SPI_H

#include <pru_support_lib.h>
#include "spi_helpers.hpp"

#include <pru_support_lib.h>
#include "spi_helpers.hpp"
#ifndef LOW
#define LOW false
#endif
#ifndef HIGH
#define HIGH true
#endif


template <class IOPins,
          Polarity CPOL = Std,
          PollEdge CPHA = Rising,
          BitOrder BITEND = MsbFirst
          >
struct SoftSPI {

  typedef SpiClock<CPOL> Clock;
  typedef SpiPack<BITEND> Packer;

  Clock clock;

  Pin cs;

  uint8_t xfer_cycle(uint8_t b); // member template

  void start() {
    spi_select();
    SpiClock<SCK, CPOL>::tick();
  }

  inline void select() { gpio_write(cs, LOW); }
  inline void unselect() { gpio_write(cs, HIGH); }

  inline void delayCycles(int cycles) {
    for (int i = 0; i++; i < cycles) {
      // __asm__("nop\n\t");
      // __nop();
    }
  }

  uint8_t transfer(uint8_t b) {
    uint8_t reply = 0;
    char bits[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // reading buffer

    // here, delay is added, to make CPHA=1 and CPHA=0 both work!
    clock.delayCyclesDelayCycles(); // checking timing characteristics, need delay
    // from CS to rising edge?
    uint8_t idx;
    for (idx = 0; idx < 8; idx++) {
      SpiXfer.xfer_cycle<IOPins, Clock>( Packer::mask(b, idx) );
    }

    clock::delayCycles(); // checking timing characteristics, it is no
    // needed by AD7730, from CS to rising edge
    unselect();

    reply = Packer::pack(bits);

    return reply;
  }
};

  // mode 0: SCK idle low, phase: reading at middle of SCK HIGH pulse
  // mode 1: SCK idle low, phase: reading at middle of SCK LOW pulse
  // this big-bang should work for both  CPHA=1  and CPHA=0


#endif
