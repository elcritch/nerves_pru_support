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


namespace SoftSPI {

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
  const Pin miso;
  const Pin mosi;
  const Pin sck;
};

}

#include "spi_helpers.hpp"

// #ifndef NOOP
// // __nop();
// // __asm__("nop\n\t");
// #define NOOP __delay_cycles(1)
// #endif

#define WordSize ( 8*sizeof(DataWord) )

namespace SoftSPI {


template <typename DataWord,
          Polarity CPOL,
          PollEdge CPHA,
          BitOrder BITEND,
          template <Polarity> class ClockType,
          typename Timings>
struct SpiMaster {

  typedef ClockType<CPOL> Clock;
  typedef SpiPack<BITEND> Packer;
  typedef SpiXfer<CPHA> Xfer;

  const IOPins pins;
  // const ClockTimings timings;
  Clock clock;
  Xfer xfer;
  Packer packer;

  uint64_t __xfers;

  SpiMaster(IOPins _p) : pins(_p), clock(pins.sck), __xfers(0) {}

  inline void select(Pin cs) { digitalWrite(cs, LOW); }
  inline void unselect(Pin cs) { digitalWrite(cs, HIGH); }

  uint8_t transfer(Pin cs, DataWord b) {
    DataWord bits[WordSize];
    this->__xfers++;

    digitalWrite(pins.mosi, LOW);

    // Start xfer cycle
    clock.tock();

    // Here, delay is added, to make CPHA=1 and CPHA=0 both work!
    Timings::delayCycles();
    select(cs);

    // Check that your compiler unroll's this properly!

    uint8_t idx;
    for (idx = 0; idx < WordSize; idx++) {
      DataWord bit = packer.mask(b, idx, WordSize);
      bits[idx] = xfer.template xfer_cycle<Clock, Timings>( clock, pins, bit);
    }

    unselect(cs);

    Timings::delayCycles(); // checking timing characteristics, it is no

    digitalWrite(pins.mosi, HIGH);
    // needed by AD7730, from CS to rising edge

    return packer.template pack<DataWord>(bits,WordSize);
  }
};

  // mode 0: SCK idle low, phase: reading at middle of SCK HIGH pulse
  // mode 1: SCK idle low, phase: reading at middle of SCK LOW pulse
  // this big-bang should work for both  CPHA=1  and CPHA=0

}

#endif
