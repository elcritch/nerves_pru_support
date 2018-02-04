

#ifndef __HEADER_PRU_SUPPORT_LIB_H__
#define __HEADER_PRU_SUPPORT_LIB_H__

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>
#include <stdbool.h>
#include <pru_types.h>

/*
 * - [AM335x PRU Read Latencies](http://processors.wiki.ti.com/index.php/AM335x_PRU_Read_Latencies)
 * - [Ti AM33XX PRUSSv2](https://elinux.org/Ti_AM33XX_PRUSSv2)
 *
 *
 * Summary: Read Latencies for AM335x PRU-ICSS
 *
 * - PRU write instructions are fire-and-forget, and execute in ~1 cycle
 * - PRU read instructions execute in ~2 cycles
 *    + Additional read latencies occur by traversing through interconnect layers
 *    + Rule of thumb, MMRs that are "closer" to the PRU will have lower access latencies.
 *    + These latencies account for 2 cycle instruction and interconnect introduced latency.
 *    + Note memory accesses outside of the PRU subsystem are not deterministic.
 *
 * |==================|========================|
 * |      MMRs        |     Read Latency       |
 * |                  | (PRU cycles @ 200MHz)  |
 * |==================|========================|
 * | PRU CTRL         |          4             |
 * | PRU CFG 	        |          3             |
 * | PRU INTC         |          3             |
 * | PRU DRAM         |          3             |
 * | PRU Shared DRAM  |          3             |
 * | PRU ECAP         |          4             |
 * | PRU UART         |         14             |
 * | PRU IEP          |         12             |
 * | PRU R31 (GPI)    |          1             |
 * |==================|========================|
 *
 * PRU INTC => timing for reading interrupts
 *
 */

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

#ifndef PRU_SUPPORT_OVERRIDE_GPIO_FUNCS
inline void digitalWrite(uint32_t gpio_bitmask, uint32_t state) {
  // 1 cycle read for R30, 1 inst for &, 1 inst for ^, 1 for ^, and 1 for =
  // est. to be 5 cycles (~20 ns)
  __R30 ^= gpio_bitmask & ( __R30 ^ state);
}

inline bool digitalRead(uint32_t gpio_bitmask) {
  // 1 cycle read for R31, 1 inst for &, 1 inst for gt
  // est. 3 cycles
  return (__R31 & gpio_bitmask) > 0;
}
#endif

#ifdef __cplusplus
}
#endif

#endif
