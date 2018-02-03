
#include <stdint.h>
uint32_t __R30;
uint32_t __R31;

uint64_t __cycle;

void delay_test_cycles() {
  ++__cycle;
}

#define NOOP delay_test_cycles()

#include <softspi.hpp>

int main() {

  IOPins pins = { .miso = 10, .mosi = 11, .sck = 14 };
  ClockTimings timings = { .r0 = 20, .p0 = 0, .p1 = 1, .c0 = 3, .c1 = 1};
  SoftSPI<Std, Rising, MsbFirst> spi(pins, timings);


  return 0;
};

