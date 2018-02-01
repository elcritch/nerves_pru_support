

#ifndef __HEADER_PRU_SUPPORT_LIB_H__
#define __HEADER_PRU_SUPPORT_LIB_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <pru_types.h>


#define PAD_ONE   10
#define PAD_TWO   11
#define PAD_THREE 12

#define PRU_SHAREDMEM_ADDR 0x00012000

#define EMIT_PRAGMA(x) _Pragma(#x)
#define STRINGIFY(x) #x
#define TOSTRING(x) STRINGIFY(x)

#ifdef __cplusplus
  #define PRAGMA_NO_INLINE(NAME) EMIT_PRAGMA( FUNC_CANNOT_INLINE )
#else
  #define PRAGMA_NO_INLINE(NAME) EMIT_PRAGMA( FUNC_CANNOT_INLINE(NAME) )
#endif

#define TX_SCRATCHPAD_FUNC(NAME, PAD, STRUCT) \
  PRAGMA_NO_INLINE(tx_scratchpad_##NAME)    \
  void tx_scratchpad_##NAME( STRUCT data ) { __xout(PAD, 14, 0, data); }

#define RX_SCRATCHPAD_FUNC(NAME, PAD, STRUCT) \
  PRAGMA_NO_INLINE(rx_scratchpad_##NAME)    \
  STRUCT rx_scratchpad_##NAME() { STRUCT data; __xin( PAD, 14, 0, data); return data; }


#define __SHARED_MEMORY__(SHARED_STRUCT, NAME) \
  volatile SHARED_STRUCT* NAME = (volatile SHARED_STRUCT *) PRU_SHAREDMEM_ADDR;

/* Toggle GPO pins
   https://github.com/derekmolloy/boneDeviceTree/blob/master/docs/BeagleboneBlackP8HeaderTable.pdf
   https://github.com/derekmolloy/boneDeviceTree/blob/master/docs/BeagleboneBlackP9HeaderTable.pdf
   Use these tables to find the correct pin address
*/

#define P8_11 = 0x834

#define HOST_INT_2			((uint32_t) 1 << 30)
#define HOST_INT_1			((uint32_t) 1 << 31)

#define LOW  ((uint32_t)0x00000000)
#define HIGH ((uint32_t)0xFFFFFFFF)

#define GPIO(NUMBER) (1 << NUMBER)

#ifndef PRU_SUPPORT_OVERRIDE_R30
volatile register uint32_t __R30;
#endif

#ifndef PRU_SUPPORT_OVERRIDE_R31
volatile register uint32_t __R31;
#endif

// seems to be 3-4 cycles (15 - 20 ns then)
inline void digitalWrite(uint32_t gpio_bitmask, bool state) {
  __R30 ^= gpio_bitmask & ( __R30 ^ state);
}

inline bool digitalRead(uint32_t gpio_bitmask) {
  return (__R31 & gpio_bitmask) > 0;
}

#ifdef __cplusplus
}
#endif

#endif
