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

enum BitOrder {
  MsbFirst,
  LsbFirst,
};

enum Polarity {
  Std,
  Inv,
};

enum PollEdge {
  Rising,
  Falling,
};

typedef uint32_t Pin;

struct IOPins {
  Pin miso;
  Pin mosi;
  Pin sck;
};

#include "spi_helpers.hpp"

#ifndef LOW
#define LOW false
#endif
#ifndef HIGH
#define HIGH true
#endif


#ifndef NOOP
// __nop();
// __asm__("nop\n\t");
#define NOOP __delay_cycles(1)
#endif

template <typename DataWord,
          Polarity CPOL = Std,
          PollEdge CPHA = Rising,
          BitOrder BITEND = MsbFirst,
          class Clock = SpiClockToggler<CPOL>>
struct SoftSPI {

  // typedef ClockClass Clock;
  typedef SpiPack<BITEND> Packer;
  typedef SpiXfer<CPHA> Xfer;

  const IOPins pins;
  const ClockTimings timings;
  Clock clock;

  SoftSPI(IOPins _p, ClockTimings _t) : pins(_p), timings(_t), clock(pins.sck, timings) {}

  inline void select(Pin cs) { digitalWrite(cs, LOW); }
  inline void unselect(Pin cs) { digitalWrite(cs, HIGH); }


  DataWord reply = 0;
  DataWord bits[sizeof(DataWord)];

  uint8_t transfer(Pin cs, DataWord b) {

    // Start xfer cycle
    select(cs);
    clock.tock();

    // Here, delay is added, to make CPHA=1 and CPHA=0 both work!
    clock.delayCycles();

    // Check that your compiler unroll's this properly!
    const uint8_t word_size = 8*sizeof(DataWord);

    uint8_t idx;
    for (idx = 0; idx < word_size; idx++) {
      bits[idx] = Xfer::xfer_cycle( clock, pins, Packer::mask(b, idx) );
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
