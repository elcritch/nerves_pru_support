
#include <stdint.h>
#include <stdexcept>
#include <iostream>
#include <string>

uint32_t __R30;
uint32_t __R31;

#define MAX_CYCLES 4096

struct PinState {
  bool miso;
  bool mosi;
  bool sck;

  uint32_t other_pin;
  bool other_state;

  PinState() {
    miso = false;
    mosi = false;
    sck = false;
    other_pin = 0;
    other_state = false;
  }
};

template<class IOPins, typename Pin>
struct SimpleCycleTiming {

  PinState states[MAX_CYCLES];
  IOPins pins;

  uint64_t cycle;
  PinState current;

  SimpleCycleTiming() : pins({0,0,0}) {}
  SimpleCycleTiming(IOPins _p) : pins(_p) {}

  void set_pin(Pin pin, bool state) {
    if (pin == pins.mosi)
      this->current.mosi = state;
    else if (pin == pins.miso)
      this->current.miso = state;
    else if (pin == pins.sck)
      this->current.sck = state;
    else {
      this->current.other_pin = pin;
      this->current.other_state = state;
    }
  }

  void incr() {
    this->states[cycle++] = this->current;
    this->current = PinState();
  }
};


void delay_test_cycles();

#define NOOP delay_test_cycles()

#include <softspi.hpp>

SimpleCycleTiming<IOPins, Pin> cycle_data;

void delay_test_cycles() {
  cycle_data.incr();
}


int main() {

  IOPins pins = { .miso = 10, .mosi = 11, .sck = 14 };
  ClockTimings timings = { .r0 = 20, .p0 = 0, .p1 = 1, .c0 = 3, .c1 = 1};
  SoftSPI<Std, Rising, MsbFirst> spi(pins, timings);

  cycle_data.pins = pins;

  std::cout << "Running..." << std::endl;
  return 0;
};

