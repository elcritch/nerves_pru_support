

#ifndef _SOFTWARE_SPI_HELPERS_H
#define _SOFTWARE_SPI_HELPERS_H

#include <stdint.h>

#ifndef DEBUG_STMT
#define debug(msg)
#endif

namespace SoftSPI {

template<uint32_t sck_pre,
          uint32_t prop_pre,
          uint32_t prop_post,
          uint32_t capt_pre,
          uint32_t capt_post,
         uint32_t sck_post,
         template<uint32_t d> class DelayImpl>
struct ClockTimings {

  static inline void delayCyclesPre() { DelayImpl<sck_pre>()(); }
  static inline void delayCyclesP0() { DelayImpl<prop_pre>()(); }
  static inline void delayCyclesP1() { DelayImpl<prop_post>()(); }
  static inline void delayCyclesC0() { DelayImpl<capt_pre>()(); }
  static inline void delayCyclesC1() { DelayImpl<capt_post>()(); }
  static inline void delayCyclesPost() { DelayImpl<sck_post>()(); }
};


// ========================================================================== //
// SPI Clock
// ========================================================================== //
template <Polarity CPOL>
struct SpiClock {

  static uint32_t on();
  static uint32_t off();

  template<class IOPins>
  static void tick();

  template<class IOPins>
  static void tock();

};


//  clock inverted
template<>
template<class IOPins>
inline void SpiClock<Inv>::tick() {
  digitalWrite(IOPins::sck(), LOW);
}

template<>
template<class IOPins>
inline void SpiClock<Inv>::tock() {
  digitalWrite(IOPins::sck(), HIGH);
}

template<> uint32_t SpiClock<Inv>::on() { return LOW; }
template<> uint32_t SpiClock<Inv>::off() { return HIGH; }

//  clock standard
template<>
template<class IOPins>
inline void SpiClock<Std>::tick() {
  digitalWrite(IOPins::sck(), HIGH);
}
template<>
template<class IOPins>
inline void SpiClock<Std>::tock() {
  digitalWrite(IOPins::sck(), LOW);
}

template<> uint32_t SpiClock<Std>::on() { return HIGH; }
template<> uint32_t SpiClock<Std>::off() { return LOW; }

// template <Polarity CPOL>
// struct SpiClockToggler {

//   static inline void tick() {
//     digitalToggle(SpiClock<CPOL>::sck);
//   }
//   static inline void tock() {
//     digitalToggle(SpiClock<CPOL>::sck);
//   }

// };

// ========================================================================== //
// SPI BitPack
// ========================================================================== //
template <BitOrder BITEND>
struct SpiPack {
  template<typename DataWord, uint8_t bit_count>
  inline bool mask(DataWord byte, uint8_t idx);
  template<typename DataWord, uint8_t bit_count>
  inline DataWord pack(bool bits[]);
};

template<>
template<typename DataWord, uint8_t bit_count>
inline bool SpiPack<MsbFirst>::mask(DataWord data, uint8_t idx) {
  return !!( (1 << (bit_count - idx - 1)) & data);
}

template<>
template<typename DataWord, uint8_t bit_count>
inline bool SpiPack<LsbFirst>::mask(DataWord data, uint8_t idx) {
  return !!( (1 << idx) & data);
}

template<>
template<typename DataWord, uint8_t bit_count>
inline DataWord SpiPack<MsbFirst>::pack(bool bits[])
{
  uint8_t i;
  DataWord word = 0;
  for (i = 0; i < bit_count; i++) {
    word |= bits[i] << (bit_count - i - 1);
  }
  return word;
}

template<>
template<typename DataWord, uint8_t bit_count>
inline DataWord SpiPack<LsbFirst>::pack(bool bits[])
{
  uint8_t i;
  DataWord word = 0;
  for (i = 0; i < bit_count; i++) {
    word |= bits[i] << i;
  }
  return word;
}
}

#endif // header
