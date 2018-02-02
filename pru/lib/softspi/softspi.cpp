#include "softspi.hpp"

#ifdef __PRU_TEST__

int test_spi() {

  IOPins pins = { .miso = 10, .mosi = 11, .sck = 14 };
  ClockTimings timings = { .r0 = 20, .p0 = 0, .p1 = 1, .c0 = 3, .c1 = 1};
  SoftSPI<Std, Rising, MsbFirst> spi(pins, timings);


  return 0;
};


#endif

