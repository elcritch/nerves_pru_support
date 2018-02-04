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

#ifndef LOW
#define LOW false
#endif
#ifndef HIGH
#define HIGH true
#endif

#ifndef GPIO_WRITE
#define spi_gpio_write digitalWrite
#endif

#ifndef NOOP
// __nop();
// __asm__("nop\n\t");
#define NOOP __delay_cycles(1)
#endif

template <Polarity CPOL = Std,
          PollEdge CPHA = Rising,
          BitOrder BITEND = MsbFirst>
struct SoftSPI {

  typedef SpiClock<CPOL> Clock;
  typedef SpiPack<BITEND> Packer;
  typedef SpiXfer<CPHA> Xfer;

  const IOPins pins;
  const ClockTimings timings;
  Clock clock;

  SoftSPI(IOPins _p, ClockTimings _t) : pins(_p), timings(_t), clock(pins.sck, timings) {}

  inline void select(Pin cs) { spi_gpio_write(cs, LOW); }
  inline void unselect(Pin cs) { spi_gpio_write(cs, HIGH); }


  uint8_t transfer(Pin cs, uint8_t b) {
    uint8_t reply = 0;
    uint8_t bits[8] = {0, 0, 0, 0, 0, 0, 0, 0}; // reading buffer

    select(cs);
    clock.tick();

    // here, delay is added, to make CPHA=1 and CPHA=0 both work!
    clock.delayCycles(); // checking timing characteristics, need delay

    uint8_t idx;
    for (idx = 0; idx < 8; idx++) {
      Xfer::xfer_cycle( clock, pins, Packer::mask(b, idx) );
    }

    clock.delayCycles(); // checking timing characteristics, it is no

    // needed by AD7730, from CS to rising edge
    unselect(cs);

    reply = Packer::pack(bits);

    return reply;
  }
};

  // mode 0: SCK idle low, phase: reading at middle of SCK HIGH pulse
  // mode 1: SCK idle low, phase: reading at middle of SCK LOW pulse
  // this big-bang should work for both  CPHA=1  and CPHA=0


#endif
