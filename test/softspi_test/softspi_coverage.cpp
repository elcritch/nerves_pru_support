
#include <stdint.h>
#include <stdexcept>
#include <iostream>
#include <string>

volatile uint32_t __R30;
volatile uint32_t __R31;

// #define DEBUG_STMT
// void debug(std::string msg);

#define MAX_CYCLES 4096

struct PinState {
  int miso;
  int mosi;
  int sck;

  uint32_t other_pin;
  int other_state;

  uint32_t cycle;

  PinState() {
    miso = false;
    mosi = false;
    sck = false;
    other_pin = 0;
    other_state = true;
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

  SimpleCycleTiming() : cycle(0), pins({0,0,0}) {}
  SimpleCycleTiming(IOPins _p) : cycle(0), pins(_p) {}

  void set_pin(Pin pin, uint32_t state) {
    if (pin == pins.mosi) {
      this->current.mosi = state;
      this->current.miso = !state;
    }
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
    {
        uint8_t ret = this->current.miso;
        this->current.miso = 2+ret;
        return ret;
    }
    else if (pin == pins.sck)
      return this->current.sck;
    else if (pin == current.other_pin) {
      uint8_t ret =  this->current.other_state;
      this->current.other_state = 2;
      return ret;
    }
    else
      throw std::invalid_argument("pin error: " + std::to_string(pin) + " other_pin: " + std::to_string(current.other_pin) + " sck: " + std::to_string(current.sck));
  }

  void incr() {
    this->states[cycle++] = this->current;
    this->current.cycle = cycle;
  }
};


void delay_test_cycles();
void digitalWrite(uint32_t gpio_bitmask, bool state);
bool digitalRead(uint32_t gpio_bitmask);
void digitalToggle(uint32_t gpio_bitmask);

#define NOOP delay_test_cycles()
#define PRU_SUPPORT_OVERRIDE_GPIO_FUNCS

#include <softspi.hpp>

using namespace SoftSPI;

SimpleCycleTiming<IOPins, Pin> * cycle_data;

void delay_test_cycles() {
  cycle_data->incr();
}

void digitalWrite(uint32_t gpio_bitmask, bool state) {
  cycle_data->set_pin(gpio_bitmask, state);
  // cycle_data.incr();
}
void digitalToggle(uint32_t gpio_bitmask) {
  cycle_data->set_pin(gpio_bitmask, !cycle_data->get_pin(gpio_bitmask));
  // cycle_data.incr();
}
bool digitalRead(uint32_t gpio_bitmask) {
  bool res = cycle_data->get_pin(gpio_bitmask);
  // cycle_data.incr();
  return res;
}

// void debug(std::string msg) {
  // std::cout << "cycle: " << cycle_data.cycle << std::endl;
  // std::cout << msg << std::endl;
// }

void printCycleDataFull() {

  std::cout << "Done..." << std::endl;

  for (int idx = 0; idx < cycle_data->cycle; idx++) {
    cycle_data->states[idx].print();
  }

  std::cout << std::endl;
  std::cout << std::endl;

}

#include <bitset>
void printCycleData(uint8_t out) {
  std::cout << "sck:  " ;
  for (int i=0; i < cycle_data->cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data->states[i].sck ;
  }
  std::cout << std::endl;
  std::cout << "mosi: " ;
  for (int i=0; i < cycle_data->cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data->states[i].mosi ;
  }
  std::cout << std::endl;

  std::cout << "miso: " ;
  for (int i=0; i < cycle_data->cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << (int)cycle_data->states[i].miso ;
  }
  std::cout << std::endl;


  std::cout << "cs:   " ;
  for (int i=0; i < cycle_data->cycle; i++) {
    // std::cout << (i % timings.sck_cycle == 0 ? " " : "");
    std::cout << cycle_data->states[i].other_state ;
  }
  std::cout << std::endl;

  std::cout << "read out: " << (int) out << " binary: ";
  std::cout<<std::bitset<8>(out)<<std::endl;

};

typedef ClockTimings<7,0,5,0,5> Timings;

int main() {

  IOPins pins = { .miso = 10, .mosi = 11, .sck = 14 };
  uint8_t out;

  // Mode 0
  SpiMaster<uint8_t, Polarity::Std, PollEdge::Rising, MsbFirst, SpiClock, Timings> spi0(pins);

  SimpleCycleTiming<IOPins, Pin> _cycle_data0(pins);
  cycle_data = &_cycle_data0;
  // cycle_data.pins = pins;

  std::cout << "\nRunning... mode 0" << std::endl;

  digitalWrite(7, HIGH);
  out = spi0.transfer(7, 0xAA);
  printCycleData(out);

  // Mode 1
  SpiMaster<uint8_t, Polarity::Std, PollEdge::Falling, MsbFirst, SpiClock, Timings> spi1(pins);

  SimpleCycleTiming<IOPins, Pin> _cycle_data1(pins);
  cycle_data = &_cycle_data1;

  std::cout << "\nRunning... mode 1" << std::endl;

  digitalWrite(8, HIGH);
  out = spi1.transfer(8, 0xAA);
  printCycleData(out);

  // Mode 2
  SpiMaster<uint8_t, Polarity::Inv, PollEdge::Rising, MsbFirst, SpiClock, Timings> spi2(pins);

  SimpleCycleTiming<IOPins, Pin> _cycle_data2(pins);
  cycle_data = &_cycle_data2;
  std::cout << "\nRunning... mode 2" << std::endl;

  digitalWrite(7, HIGH);
  out = spi2.transfer(7, 0xAA);
  printCycleData(out);

  // Mode 3
  SpiMaster<uint8_t, Polarity::Inv, PollEdge::Falling, MsbFirst, SpiClock, Timings> spi3(pins);

  SimpleCycleTiming<IOPins, Pin> _cycle_data3(pins);
  cycle_data = &_cycle_data3;

  std::cout << "\nRunning... mode 3" << std::endl;

  digitalWrite(8, HIGH);
  out = spi3.transfer(8, 0xAA);
  printCycleData(out);

  // Mode 0 - MSB
  SpiMaster<uint8_t, Polarity::Std, PollEdge::Rising, MsbFirst, SpiClock, Timings> spi0msb(pins);

  SimpleCycleTiming<IOPins, Pin> _cycle_data0a(pins);
  cycle_data = &_cycle_data0a;

  std::cout << "\nRunning... mode 0 / msb / 0xAF" << std::endl;

  digitalWrite(8, HIGH);
  out = spi0msb.transfer(8, 0xAF);
  printCycleData(out);

  // Mode 0 - LSB
  SpiMaster<uint8_t, Polarity::Std, PollEdge::Rising, LsbFirst, SpiClock, Timings> spi0lsb(pins);

  SimpleCycleTiming<IOPins, Pin> _cycle_data1a(pins);
  cycle_data = &_cycle_data1a;

  std::cout << "\nRunning... mode 0 / lsb / 0xAF" << std::endl;

  digitalWrite(8, HIGH);
  out = spi0lsb.transfer(8, 0xAF);
  printCycleData(out);

  return 0;
}
