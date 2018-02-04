
#ifndef __HEADER_PRU_SUPPORT_PINS_H__
#define __HEADER_PRU_SUPPORT_PINS_H__

/** Header Defs from:
 * https://vadl.github.io/beagleboneblack/2016/07/29/setting-up-bbb-gpio
 */

#ifdef BB_BLACK

/* P8 */
#define PRU0_GO_P8_11 0x8000 /* r30, 1 << 15, GPIO1[13], Pin45 */
#define PRU0_GO_P8_12 0x4000 /* r30, 1 << 14, GPIO1[12], Pin44 */

#define PRU0_GI_P8_15 0x4000 /* r31, 1 << 15, GPIO1[15], Pin47 */
#define PRU0_GI_P8_16 0x4000 /* r31, 1 << 14, GPIO1[14], Pin46 */

#define PRU1_GI_P8_20 0x2000 /* r31, 1 << 13, GPIO1[31], Pin63 */
#define PRU1_GI_P8_21 0x1000 /* r31, 1 << 12, GPIO1[30], Pin62 */

#define PRU1_GO_P8_20 0x2000 /* r30, 1 << 13, GPIO1[31], Pin63 */
#define PRU1_GO_P8_21 0x1000 /* r30, 1 << 12, GPIO1[30], Pin62 */

#define PRU1_GI_P8_27 0x100 /* r31, 1 <<  8, GPIO2[22], Pin86 */
#define PRU1_GI_P8_28 0x400 /* r31, 1 << 10, GPIO2[24], Pin88 */
#define PRU1_GI_P8_29 0x200 /* r31, 1 <<  9, GPIO2[23], Pin87 */

#define PRU1_GO_P8_27 0x100 /* r30, 1 <<  8, GPIO2[22], Pin86 */
#define PRU1_GO_P8_28 0x400 /* r30, 1 << 10, GPIO2[24], Pin88 */
#define PRU1_GO_P8_29 0x200 /* r30, 1 <<  9, GPIO2[23], Pin87 */

#define PRU1_GI_P8_39 0x40 /* r31, 1 <<  6, GPIO2[12], Pin76 */
#define PRU1_GI_P8_40 0x80 /* r31, 1 <<  7, GPIO2[13], Pin77 */
#define PRU1_GI_P8_41 0x10 /* r31, 1 <<  4, GPIO2[10], Pin74 */
#define PRU1_GI_P8_42 0x20 /* r31, 1 <<  5, GPIO2[11], Pin75 */
#define PRU1_GI_P8_43 0x04 /* r31, 1 <<  2, GPIO2[08], Pin72 */
#define PRU1_GI_P8_44 0x08 /* r31, 1 <<  3, GPIO2[09], Pin73 */
#define PRU1_GI_P8_45 0x01 /* r31, 1 <<  0, GPIO2[06], Pin70 */
#define PRU1_GI_P8_46 0x02 /* r31, 1 <<  1, GPIO2[07], Pin71 */

#define PRU1_GO_P8_39 0x40 /* r30, 1 <<  6, GPIO2[12], Pin76 */
#define PRU1_GO_P8_40 0x80 /* r30, 1 <<  7, GPIO2[13], Pin77 */
#define PRU1_GO_P8_41 0x10 /* r30, 1 <<  4, GPIO2[10], Pin74 */
#define PRU1_GO_P8_42 0x20 /* r30, 1 <<  5, GPIO2[11], Pin75 */
#define PRU1_GO_P8_43 0x04 /* r30, 1 <<  2, GPIO2[08], Pin72 */
#define PRU1_GO_P8_44 0x08 /* r30, 1 <<  3, GPIO2[09], Pin73 */
#define PRU1_GO_P8_45 0x01 /* r30, 1 <<  0, GPIO2[06], Pin70 */
#define PRU1_GO_P8_46 0x02 /* r30, 1 <<  1, GPIO2[07], Pin71 */

/* P9 */
#define PRU0_GI_P9_24 0x10000 /* r31, 1 << 16, GPIO0[15], Pin97 */
#define PRU0_GI_P9_25 0x00080 /* r31, 1 <<  7, GPIO3[21], Pin107 */
#define PRU1_GI_P9_26 0x10000 /* r31, 1 << 16, GPIO0[14], Pin96 */
#define PRU0_GI_P9_27 0x00020 /* r31, 1 <<  5, GPIO3[19], Pin105 */
#define PRU0_GI_P9_28 0x00008 /* r31, 1 <<  3, GPIO3[17], Pin103 */
#define PRU0_GI_P9_29 0x00002 /* r31, 1 <<  1, GPIO3[15], Pin101 */
#define PRU0_GI_P9_30 0x00004 /* r31, 1 <<  2, GPIO3[16], Pin102 */
#define PRU0_GI_P9_31 0x00001 /* r31, 1 <<  0, GPIO3[14], Pin100 */

#define PRU0_GO_P9_25 0x00080 /* r30, 1 <<  7, GPIO3[21], Pin107 */
#define PRU0_GO_P9_27 0x00020 /* r30, 1 <<  5, GPIO3[19], Pin105 */
#define PRU0_GO_P9_28 0x00008 /* r30, 1 <<  3, GPIO3[17], Pin103 */
#define PRU0_GO_P9_29 0x00002 /* r30, 1 <<  1, GPIO3[15], Pin101 */
#define PRU0_GO_P9_30 0x00004 /* r30, 1 <<  2, GPIO3[16], Pin102 */
#define PRU0_GO_P9_31 0x00001 /* r30, 1 <<  0, GPIO3[14], Pin100 */


#define PRU0_GI_P9_41A 0x10000 /* r31, 1 << 16, GPIO0[20], Pin109 */
#define PRU0_GI_P9_41B 0x10000 /* r31, 1 <<  6, GPIO3[20], Pin109 */
#define PRU0_GI_P9_42B 0x10000 /* r31, 1 <<  4, GPIO3[18], Pin89 */

#define PRU0_GO_P9_41B 0x10000 /* r30, 1 <<  6, GPIO3[20], Pin89 */
#define PRU0_GO_P9_42B 0x10000 /* r30, 1 <<  4, GPIO3[18], Pin89 */

/* Other */
#define PRU0_UART0_TXD_P9_24 0x10000 /* GPIO1[15], Pin97 */
#define PRU1_UART0_RXD_P9_26 0x10000 /* GPIO1[14], Pin96 */

#endif

#endif
