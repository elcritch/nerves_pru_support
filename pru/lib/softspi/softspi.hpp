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

// enum DataTxEdge {
//   TxClockFall,
//   TxClockRise,
// };

enum DataTxEdge {
    TxClockFall,
    TxClockRise,
};

typedef uint32_t Pin;

template<Pin MISO, Pin MOSI, Pin SCK>
struct IOPins {
  static inline Pin miso() { return MISO; };
  static inline Pin mosi() { return MOSI; };
  static inline Pin sck() { return SCK; };
};

}

#define WordSize(X) ( 8*sizeof(X) )

#include "spi_helpers.hpp"
#include "spi_xfer.hpp"

// #ifndef NOOP
// // __nop();
// // __asm__("nop\n\t");
// #define NOOP __delay_cycles(1)
// #endif


namespace SoftSPI {

template <Polarity CPOL,
          DataTxEdge CPHA,
          BitOrder BITEND,
          template <Polarity> class ClockType,
          typename Timings,
          template <DataTxEdge> class _Xfer>
struct SpiMaster {

  typedef ClockType<CPOL> Clock;
  typedef SpiPack<BITEND> Packer;
  typedef _Xfer<CPHA> Xfer;

  // const ClockTimings timings;
  Packer packer;
  Xfer xfer;

  uint64_t __xfers;

  SpiMaster() : __xfers(0) {}

  inline void select(Pin cs) { digitalWrite(cs, LOW); }
  inline void unselect(Pin cs) { digitalWrite(cs, HIGH); }

  template<typename DataWord, class IOPins>
  DataWord transfer(Pin CS, DataWord data) {
    select(CS);
    DataWord result = transfer<DataWord, WordSize(DataWord), IOPins>(data);
    unselect(CS);
    return result;
  }

  template<typename DataWord, uint8_t bit_count, class IOPins>
  DataWord transfer(Pin CS, DataWord data) {
    select(CS);
    DataWord result =transfer<DataWord, bit_count, IOPins>(data);
    unselect(CS);
    return result;
  }

  template<typename DataWord, class IOPins>
  DataWord transfer( DataWord data) {
    return transfer<DataWord, WordSize(DataWord), IOPins>(data);
  }

  template<typename DataWord, uint8_t bit_count, class IOPins>
  DataWord transfer( DataWord data) {

    bool bits[WordSize(DataWord)];
    this->__xfers++;

    digitalWrite(IOPins::mosi(), LOW);

    // Start xfer cycle
    Clock::template tock<IOPins>();

    // Here, delay is added, to make CPHA=1 and CPHA=0 both work!
    Timings::delayCyclesPre();

    // Check that your compiler unroll's this properly!

    uint8_t idx;
    for (idx = 0; idx < bit_count; idx++) {
      DataWord bit = packer.template mask<DataWord, bit_count>(data, idx);
      bits[idx] = xfer.template xfer_cycle<Clock, Timings, IOPins>(bit);
    }

    digitalWrite(IOPins::mosi(), LOW);

    Timings::delayCyclesPost(); // checking timing characteristics, it is no

    // needed by AD7730, from CS to rising edge

    return packer.template pack<DataWord, bit_count>(bits);
  }
};

  // mode 0: SCK idle low, phase: reading at middle of SCK HIGH pulse
  // mode 1: SCK idle low, phase: reading at middle of SCK LOW pulse
  // this big-bang should work for both  CPHA=1  and CPHA=0

}

#endif
