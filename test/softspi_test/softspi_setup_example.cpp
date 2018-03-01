
#include <stdint.h>
#include <stdexcept>
#include <iostream>
#include <string>

volatile uint32_t __R30;

// #define DEBUG_STMT
// void debug(std::string msg);

#define MAX_CYCLES 4096

// #define NOOP 
#define PRU_SUPPORT_OVERRIDE_GPIO_FUNCS

void digitalWrite(uint32_t gpio_bitmask, uint32_t state);
bool digitalRead(uint32_t gpio_bitmask);
void digitalToggle(uint32_t gpio_bitmask);

// volatile uint32_t __R30;
volatile uint32_t __R31;
#include <softspi.hpp>

using namespace SoftSPI;

#define LOW  ((uint32_t)0x00000000)
#define HIGH ((uint32_t)0xFFFFFFFF)

void digitalWrite(uint32_t gpio_bitmask, uint32_t state) {
  // 1 cycle read for R30, 1 inst for &, 1 inst for ^, 1 for ^, and 1 for =
  // est. to be 5 cycles (~20 ns)
  __R30 ^= gpio_bitmask & ( __R30 ^ state);
}

bool digitalRead(uint32_t gpio_bitmask) {
  // 1 cycle read for R31, 1 inst for &, 1 inst for gt
  // est. 3 cycles
  return (__R30 & gpio_bitmask) > 0;
}

void digitalToggle(uint32_t gpio_bitmask) {
  // 1 cycle read for R30, 1 inst for ^, 
  // est. to be 2 cycles (~10 ns)
  __R30 ^= gpio_bitmask;
}


// const ClockTimings timings = ClockTimings::with_sck_cycle_and_pre_delays(10, 0, 0);

#include <bitset>

template<uint32_t CYCLES>
struct ClockDelay {
  void operator()() {
  }
};

typedef ClockTimings<10,5,0,5,0, 10, ClockDelay> Timings;
typedef IOPins<10, 11, 14> SPIPins;
// typedef SpiXfer<TxClockFall> Xfer;
//typedef SpiXfer Xfer;

template <DataTxEdge CPHA = TxClockFall>
struct XSpiXfer {

  template <class Clock, class Timings, class IOPins>
  uint8_t xfer_cycle(uint32_t value)
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
};

int main() {

  uint8_t out;

  // Mode 0
  SpiMaster<Polarity::Std, DataTxEdge::TxClockFall, MsbFirst, SpiClock, Timings, XSpiXfer> spi0;

  std::cout << "\nRunning... mode 0" << std::endl;

  uint8_t byte = 0xAA;
  out = spi0.transfer<uint8_t, SPIPins>(7, byte);


  std::cout << "\nDone: cout: " ;

  std::cout<<std::bitset<32>(__R30)<<std::endl;

  return 0;
}

