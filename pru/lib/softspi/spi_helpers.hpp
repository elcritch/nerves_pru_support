

#ifndef _SOFTWARE_SPI_H
#define _SOFTWARE_SPI_H

enum BitOrder {
  MsbFirst,
  LsbFirst,
};

enum Polarity {
  Std,
  Inv,
};

enum Poll {
  Rising,
  Falling,
};

typedef Pin uint32_t;

template <Pin MISO, Pin MOSI>
struct IOPins {
  static inline Pin miso() { return MISO; }
  static inline Pin mosi() { return MOSI; }
};

// ========================================================================== //
// SPI Clock
// ========================================================================== //
template <class IOPins, Polarity CPOL = Polarity::Std>
struct SpiClock {
  const Pin sck = SCK;
  void tick();
  void tock();
  void delayCycles();
  void delayCyclesP0();
  void delayCyclesP1();
  void delayCyclesC0();
  void delayCyclesC1();
};

//  clock inverted
template<> template<Pin sck> uint8_t SpiClock<Pin sck, Polarity::Inv>::tick() { gpio_write(sck, LOW); }
template<> template<Pin sck> uint8_t SpiClock<Pin sck, Polarity::Inv>::tock() { gpio_write(sck, HIGH); }

//  clock standard
template<> template<Pin sck> uint8_t SpiClock<Pin sck, Polarity::Std>::tick() { gpio_write(sck, HIGH); }
template<> template<Pin sck> uint8_t SpiClock<Pin sck, Polarity::Std>::tick() { gpio_write(sck, LOW); }


// ========================================================================== //
// SPI BitPack
// ========================================================================== //
template <BitOrder BITEND>
struct SpiPack {
  static uint8_t mask(uint8_t byte, uint8_t idx);
  static uint8_t pack(uint8_t bits);
};

template<>
uint8_t SpiPack<BitOrder::MsbFirst>::mask(uint8_t byte, uint8_t idx) {
  uint8_t mask = {0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1};
  return mask[idx] & byte;
}

template<>
uint8_t SpiPack<BitOrder::LsbFirst>::mask(uint8_t byte, uint8_t idx) {
  uint8_t mask = {0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1};
  return mask[idx] & byte;
}

template<>
uint8_t SpiPack<BitOrder::MsbFirst>::pack(uint8_t bits)
{
  return (bits[0] << 7 | bits[1] << 6 | bits[2] << 5 | bits[3] << 4 | bits[4] << 3 | \
          bits[5] << 2 | bits[6] << 1 | bits[7]);
}

template<>
uint8_t SpiPack<BitOrder::LsbFirst>::pack(uint8_t bits)
{
  return (bits[0] | bits[1] << 1 | bits[2] << 2 | bits[3] << 3 | bits[4] << 4 | \
          bits[5] << 5 | bits[6] << 6 | bits[7] << 7)
}

// ========================================================================== //
// SPI Xfer
// ========================================================================== //
template <Polarity CPOL == Polarity::Std, Poll CPHA = Poll::Rising>
struct SpiXfer {
  uint8_t xfer_cycle(bool bit);
};

template <>
template <Pin MOSI, Pin MISO, class Clock>
uint8_t SpiXfer<Polarity::Std>::xfer_cycle(Clock class, bool bit)
{
  bool read;

  clock.tick();
  clock.delayCyclesP0();

  clock.tock();
  digitalWrite(mosi, !!(b & msk[_bit]));

  // when Poll == Falling (CPOL=1) data will be captured at falling edge
  clock.delayCyclesP1(); //  propagation
  clock.tick();

  clock.delayCyclesC0(); // holding low, so there is enough time for data preparation and changing
  read = digitalRead(miso); // reading at the middle of SCK pulse

  // wait until data is fetched by slave device,  while SCK low, checking DATAsheet for this interval
  clock.delayCyclesC1();

  return read;
}

template <>
template <Pin MOSI, Pin MISO, class Clock>
uint8_t SpiXfer<Polarity::Inv>::xfer_cycle(Clock class, bool bit)
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
