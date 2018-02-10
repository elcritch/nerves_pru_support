
#include <stdint.h>
#include <stdexcept>
#include <iostream>
#include <string>
#include <stdio.h>
#include <string.h>

#include <bitset>


// #define DEBUG_STMT
// void debug(std::string msg);

#define MAX_CYCLES 4096

// #define NOOP
#define PRU_SUPPORT_OVERRIDE_GPIO_FUNCS

void digitalWrite(uint32_t gpio_bitmask, uint32_t state);
bool digitalRead(uint32_t gpio_bitmask);
void digitalToggle(uint32_t gpio_bitmask);

#include <softspi.hpp>

using namespace SoftSPI;

#define LOW  ((uint32_t)0x00000000)
#define HIGH ((uint32_t)0xFFFFFFFF)


uint32_t r30s[100];
uint32_t r30_idx;

void digitalWrite(uint32_t gpio_bitmask, uint32_t state) {
  // 1 cycle read for R30, 1 inst for &, 1 inst for ^, 1 for ^, and 1 for =
  // est. to be 5 cycles (~20 ns)
  uint32_t _R30 = r30s[r30_idx++];
  r30s[r30_idx] = _R30 ^ (gpio_bitmask & ( _R30 ^ state));

  return;
}

bool digitalRead(uint32_t gpio_bitmask) {
  // 1 cycle read for R31, 1 inst for &, 1 inst for gt
  // est. 3 cycles
  uint32_t _R30 = r30s[r30_idx];
  return !!(_R30 & gpio_bitmask);
}

void digitalToggle(uint32_t gpio_bitmask) {
  // 1 cycle read for R30, 1 inst for ^, 
  // est. to be 2 cycles (~10 ns)
  uint32_t _R30 = r30s[r30_idx++];
  r30s[r30_idx] = _R30 ^ gpio_bitmask ;
  return;
}


// const ClockTimings timings = ClockTimings::with_sck_cycle_and_pre_delays(10, 0, 0);


template<uint32_t CYCLES>
struct ClockDelay {
  void operator()() {
  }
};

typedef ClockTimings<10,5,0,5,0, ClockDelay> Timings;
typedef IOPins<2, 4, 8> SPIPins;
// typedef SpiXfer<TxClockFall> Xfer;
//typedef SpiXfer Xfer;

// template <DataTxEdge CPHA = TxClockFall>
// struct XSpiXfer {

//   template <class Clock, class Timings, class IOPins>
//   uint8_t xfer_cycle(uint32_t value)
//   {
//     uint8_t read = 0;


//     Clock::template tick<IOPins>();

//     Timings::delayCyclesP0();

//     digitalWrite(IOPins::mosi(), -value);

//     // when DataTxEdge == TxClockRise (CPOL=1) data will be captured at falling edge
//     Timings::delayCyclesP1(); //  propagation

//     Clock::template tock<IOPins>();

//     Timings::delayCyclesC0(); // holding low, so there is enough time for data preparation and changing

//     read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

//     // wait until data is fetched by slave device,  while SCK low, checking DATAsheet for this interval
//     Timings::delayCyclesC1();

//     return read;
//   }
// };

int main() {

  uint8_t out;

  // Mode 0
  SpiMaster<Polarity::Std, DataTxEdge::TxClockFall, MsbFirst, SpiClock, Timings, PruSpiXfer> spi0;

  std::cout << "\nRunning... mode 0" << std::endl;

  uint8_t byte = 0xAA;
  out = spi0.transfer<uint8_t, SPIPins>(16, byte);


  std::cout << "\nDone: cout: " ;

  for (int i=0; i < r30_idx; i++)
    std::cout<< i << ": " << std::bitset<32>(r30s[i])<<std::endl;

  memset(&r30s, 0, sizeof(r30s));
  r30_idx = 0;

  // Mode 1
  SpiMaster<Polarity::Std, DataTxEdge::TxClockRise, MsbFirst, SpiClock, Timings, PruSpiXfer> spi1;

  std::cout << "\nRunning... mode 1" << std::endl;

  out = spi1.transfer<uint8_t, SPIPins>(16, byte);

  std::cout << "\nDone: cout: " ;

  for (int i=0; i < r30_idx; i++)
    std::cout<< i << ": " << std::bitset<32>(r30s[i])<<std::endl;

  return out;
}

