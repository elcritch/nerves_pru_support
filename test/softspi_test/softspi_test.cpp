
#include <stdint.h>
#include <stdexcept>
#include <iostream>
#include <string>

uint32_t __R30;
uint32_t __R31;

#define DEBUG_STMT
void debug(std::string msg);

#define MAX_CYCLES 4096

struct PinState {
  bool miso;
  bool mosi;
  bool sck;

  uint32_t other_pin;
  bool other_state;

  uint32_t cycle;

  PinState() {
    miso = false;
    mosi = false;
    sck = false;
    other_pin = 0;
    other_state = false;
  }

  void print() {
    std::cout << "PinState<";
    std::cout << "miso = " << miso << ", ";
    std::cout << "mosi = " << mosi << ", ";
    std::cout << "sck = " << sck << ", ";
    std::cout << "x-pin = " << other_pin << ", ";
    std::cout << "x-state = " << other_state << ", ";
    std::cout << "cycle = " << cycle << ">";
    std::cout << std::endl;
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

  bool get_pin(Pin pin) {
    if (pin == pins.mosi)
      return this->current.mosi;
    else if (pin == pins.miso)
      return this->current.miso;
    else if (pin == pins.sck)
      return this->current.sck;
    else if (pin == current.other_pin) 
      return this->current.other_state;
    else
      throw std::invalid_argument("pin error");
  }

  void incr() {
    this->states[cycle++] = this->current;
    this->current.cycle = cycle;
  }
};


void delay_test_cycles();
void digitalWrite(uint32_t gpio_bitmask, bool state);
bool digitalRead(uint32_t gpio_bitmask);

#define NOOP delay_test_cycles()
#define PRU_SUPPORT_OVERRIDE_GPIO_FUNCS

#include <softspi.hpp>

SimpleCycleTiming<IOPins, Pin> cycle_data;

void delay_test_cycles() {
  cycle_data.incr();
}


void digitalWrite(uint32_t gpio_bitmask, bool state) {
  cycle_data.set_pin(gpio_bitmask, state);
  // cycle_data.incr();
}
bool digitalRead(uint32_t gpio_bitmask) {
  bool res = cycle_data.get_pin(gpio_bitmask);
  // cycle_data.incr();
  return res;
}

void debug(std::string msg) {
  // std::cout << "cycle: " << cycle_data.cycle << std::endl;
  // std::cout << msg << std::endl;
}

void printCycleDataFull() {

  std::cout << "Done..." << std::endl;

  for (int idx = 0; idx < cycle_data.cycle; idx++) {
    cycle_data.states[idx].print();
  }

  std::cout << std::endl;
  std::cout << std::endl;

}

void printCycleData() {
  std::cout << "sck:  " ;
  for (int i=0; i < cycle_data.cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data.states[i].sck ;
  }
  std::cout << std::endl;
  std::cout << "mosi: " ;
  for (int i=0; i < cycle_data.cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data.states[i].mosi ;
  }
  std::cout << std::endl;

  std::cout << "miso: " ;
  for (int i=0; i < cycle_data.cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data.states[i].miso ;
  }
  std::cout << std::endl;


  std::cout << "cs:   " ;
  for (int i=0; i < cycle_data.cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data.states[i].other_state ;
  }
  std::cout << std::endl;

};


int main() {

  IOPins pins = { .miso = 10, .mosi = 11, .sck = 14 };
  ClockTimings timings = ClockTimings::with_sck_cycle_and_pre_delays(10, 0, 0);

  // ClockTimings timings = {
  //   .sck_delay = 10,
  //   .prop_pre  = 2,
  //   .prop_post = 2,
  //   .capt_pre  = 1,
  //   .capt_post = 1
  // };

  // Mode 0
  SoftSPI<uint8_t, Std, Rising, MsbFirst> spi0(pins, timings);

  cycle_data = SimpleCycleTiming<IOPins, Pin>();
  cycle_data.pins = pins;

  std::cout << "\nRunning... mode 0" << std::endl;

  spi0.transfer(7, 0xAA);
  printCycleData();

  // Mode 1
  SoftSPI<uint8_t, Std, Falling, MsbFirst> spi1(pins, timings);

  cycle_data = SimpleCycleTiming<IOPins, Pin>();
  cycle_data.pins = pins;

  std::cout << "\nRunning... mode 1" << std::endl;

  spi1.transfer(8, 0xAA);
  printCycleData();

  return 0;
}

