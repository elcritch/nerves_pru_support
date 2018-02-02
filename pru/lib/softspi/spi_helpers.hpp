

#ifndef _SOFTWARE_SPI_HELPERS_H
#define _SOFTWARE_SPI_HELPERS_H

#include <stdint.h>

enum BitOrder {
  MsbFirst,
  LsbFirst,
};

enum Polarity {
  Std,
  Inv,
};

enum PollEdge {
  Rising,
  Falling,
};

typedef uint32_t Pin;

template <Pin MISO, Pin MOSI>
struct IOPins {
  static inline Pin miso() { return MISO; }
  static inline Pin mosi() { return MOSI; }
  static inline Pin sck() { return SCK; }
};

// ========================================================================== //
// SPI Clock
// ========================================================================== //
template <Polarity CPOL>
struct SpiClock {
  void tick(Pin sck);
  void tock(Pin sck);
  void delayCycles();
  void delayCyclesP0();
  void delayCyclesP1();
  void delayCyclesC0();
  void delayCyclesC1();
};

//  clock inverted
template<>
void SpiClock<Inv>::tick(Pin sck) {  digitalWrite(sck, LOW); }
template<>
void SpiClock<Inv>::tock(Pin sck) {  digitalWrite(sck, HIGH); }

//  clock standard
template<>
void SpiClock<Std>::tick(Pin sck) {  digitalWrite(sck, HIGH); }
template<>
void SpiClock<Std>::tock(Pin sck) {  digitalWrite(sck, LOW); }


// ========================================================================== //
// SPI BitPack
// ========================================================================== //
template <BitOrder BITEND>
struct SpiPack {
  static uint8_t mask(uint8_t byte, uint8_t idx);
  static uint8_t pack(uint8_t bits[]);
};

template<>
uint8_t SpiPack<MsbFirst>::mask(uint8_t byte, uint8_t idx) {
  uint8_t mask[] = {0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1};
  return mask[idx] & byte;
}

template<>
uint8_t SpiPack<LsbFirst>::mask(uint8_t byte, uint8_t idx) {
  uint8_t mask[] = {0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1};
  return mask[idx] & byte;
}

template<>
uint8_t SpiPack<MsbFirst>::pack(uint8_t bits[])
{
  return (bits[0] << 7 | bits[1] << 6 | bits[2] << 5 | bits[3] << 4 | bits[4] << 3 | \
          bits[5] << 2 | bits[6] << 1 | bits[7]);
}

template<>
uint8_t SpiPack<LsbFirst>::pack(uint8_t bits[])
{
  return (bits[0] | bits[1] << 1 | bits[2] << 2 | bits[3] << 3 | bits[4] << 4 | \
          bits[5] << 5 | bits[6] << 6 | bits[7] << 7);
}

// ========================================================================== //
// SPI Xfer
// ========================================================================== //
template <PollEdge CPHA = Rising>
struct SpiXfer {

  template <class Clock>
  uint8_t xfer_cycle(Clock clock, bool bit);
};

template <>
template <class Clock>
uint8_t SpiXfer<Falling>::xfer_cycle<Clock>(Clock clock, bool bit)
{
  bool read;

  clock.tick();
  clock.delayCyclesP0();

  clock.tock();
  digitalWrite(mosi, !!(b & msk[_bit]));

  // when PollEdge == Falling (CPOL=1) data will be captured at falling edge
  clock.delayCyclesP1(); //  propagation
  clock.tick();

  clock.delayCyclesC0(); // holding low, so there is enough time for data preparation and changing
  read = digitalRead(miso); // reading at the middle of SCK pulse

  // wait until data is fetched by slave device,  while SCK low, checking DATAsheet for this interval
  clock.delayCyclesC1();

  return read;
}

template <>
template <class Clock>
uint8_t SpiXfer<Rising>::xfer_cycle(Clock clock, bool bit)
{
  bool read;
  // changing MOSI big while SCK low, propogation
  digitalWrite(MOSI, bit);

  // there is a requirement of LOW and HIGH have identical interval!
  clock.delayCyclesP1();
  clock.tick();

  // reading at the middle of SCK pulse
  clock.delayCyclesC0();
  read = digitalRead(MISO); // reading at the middle of SCK pulse

  // wait until data is fetched by slave device,  while SCK high, checking DATAsheet for this interval
  clock.delayCyclesC1();

  clock.tock();
  clock.delayCyclesP0(); // holding low, so there is enough time for data preparation and changing

  return read;
}

#endif // header
