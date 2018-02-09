

#ifndef _SOFTWARE_SPI_HELPERS_H
#define _SOFTWARE_SPI_HELPERS_H

#include <stdint.h>

#ifndef DEBUG_STMT
#define debug(msg)
#endif

namespace SoftSPI {

template<uint32_t sck_cycle,
          uint32_t prop_pre,
          uint32_t prop_post,
          uint32_t capt_pre,
          uint32_t capt_post,
         template<uint32_t d> class DelayImpl>
struct ClockTimings {

  static inline void delayCycles() { DelayImpl<sck_cycle>()(); }
  static inline void delayCyclesP0() { DelayImpl<prop_pre>()(); }
  static inline void delayCyclesP1() { DelayImpl<prop_post>()(); }
  static inline void delayCyclesC0() { DelayImpl<capt_pre>()(); }
  static inline void delayCyclesC1() { DelayImpl<capt_post>()(); }
};


// ========================================================================== //
// SPI Clock
// ========================================================================== //
template <Polarity CPOL>
struct SpiClock {

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
  inline bool mask(uint8_t byte, uint8_t idx, const uint32_t word_size);
  template<typename DataWord>
  inline DataWord pack(bool bits[]);
};

template<>
inline bool SpiPack<MsbFirst>::mask(uint8_t byte, uint8_t idx, const uint32_t word_size) {
  return !!( (16*word_size >> idx) & byte);
}

template<>
inline bool SpiPack<LsbFirst>::mask(uint8_t byte, uint8_t idx, const uint32_t word_size) {
  return !!( (1 << idx) & byte);
}

template<>
template<typename DataWord>
inline DataWord SpiPack<MsbFirst>::pack(bool bits[])
{
  uint8_t i;
  DataWord word = 0;
  for (i = 0; i < WordSize(DataWord); i++) {
    word |= bits[i] << (WordSize(DataWord) - i - 1);
  }
  return word;
}

template<>
template<typename DataWord>
inline DataWord SpiPack<LsbFirst>::pack(bool bits[])
{
  uint8_t i;
  DataWord word = 0;
  for (i = 0; i < WordSize(DataWord); i++) {
    word |= bits[i] << i;
  }
  return word;
}

// ========================================================================== //
// SPI Xfer
// ========================================================================== //
template <PollEdge CPHA = Rising>
struct SpiXfer {

  template <class Clock, class Timings, class IOPins>
  inline uint8_t xfer_cycle(uint32_t bit);
};

template <>
template <class Clock, class Timings, class IOPins>
  uint8_t SpiXfer<Falling>::xfer_cycle(uint32_t value)
{
  uint8_t read = 0;

  Clock::template tick<IOPins>();

  Timings::delayCyclesP0();

  digitalWrite(IOPins::mosi(), -value);

  // when PollEdge == Falling (CPOL=1) data will be captured at falling edge
  Timings::delayCyclesP1(); //  propagation

  Clock::template tock<IOPins>();

  Timings::delayCyclesC0(); // holding low, so there is enough time for data preparation and changing

  read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

  // wait until data is fetched by slave device,  while SCK low, checking DATAsheet for this interval
  Timings::delayCyclesC1();

  return read;
}

template <>
template <class Clock, class Timings, class IOPins>
uint8_t SpiXfer<Rising>::xfer_cycle(uint32_t value)
{
  uint8_t read = 0;

  // changing MOSI big while SCK low, propogation
  digitalWrite(IOPins::mosi(), -value);

  // there is a requirement of LOW and HIGH have identical interval!
  Timings::delayCyclesP1();

  Clock::template tick<IOPins>();

  // reading at the middle of SCK pulse
  Timings::delayCyclesC0();

  read = digitalRead(IOPins::miso()); // reading at the middle of SCK pulse

  // wait until data is fetched by slave device,  while SCK high, checking DATAsheet for this interval
  Timings::delayCyclesC1();

  Clock::template tock<IOPins>();
  
  Timings::delayCyclesP0(); // holding low, so there is enough time for data preparation and changing

  return read;
}

}

#endif // header
