
#ifndef __HEADER_PRU_SUPPORT_PINS_H__
#define __HEADER_PRU_SUPPORT_PINS_H__

/** Header Defs from:
 * https://vadl.github.io/beagleboneblack/2016/07/29/setting-up-bbb-gpio
 *
 * ## GPIO Numbering Scheme
 *
 * The gpio pins of the bbb are grouped into 3 groups of 32: GPIO0, GPIO1,
 * and GPIO2. An individual pin can be refered to using the convention GPIOX_Y
 * where X is its gpio register and Y is its number within that register.
 * However, all references to a particular pin made in software instead uses
 * its absolute pin number! A gpio’s absolute pin number is calculated in the
 * following manner: Z = 32*X + Y where X is again the gpio register and Y is
 * the position within that register.
 *
 * i.e. GPIO2_24 is 32*2+24, making it GPIO_88. If this pin were to be
 * referenced anywhere in software, the user would use the number 88, not 24!
 */

#ifdef BB_BLACK

/* P8 */
#define PRU0_GO_P8_11 0x08000 /* r30, 1 << 15, GPIO1[13], GpioUserland 45 */
#define PRU0_GO_P8_12 0x04000 /* r30, 1 << 14, GPIO1[12], GpioUserland 44 */

#define PRU0_GI_P8_15 0x04000 /* r31, 1 << 15, GPIO1[15], GpioUserland 47 */
#define PRU0_GI_P8_16 0x04000 /* r31, 1 << 14, GPIO1[14], GpioUserland 46 */

#define PRU1_GI_P8_20 0x02000 /* r31, 1 << 13, GPIO1[31], GpioUserland 63 */
#define PRU1_GI_P8_21 0x01000 /* r31, 1 << 12, GPIO1[30], GpioUserland 62 */

#define PRU1_GO_P8_20 0x02000 /* r30, 1 << 13, GPIO1[31], GpioUserland 63 */
#define PRU1_GO_P8_21 0x01000 /* r30, 1 << 12, GPIO1[30], GpioUserland 62 */

#define PRU1_GI_P8_27 0x00100 /* r31, 1 <<  8, GPIO2[22], GpioUserland 86 */
#define PRU1_GI_P8_28 0x00400 /* r31, 1 << 10, GPIO2[24], GpioUserland 88 */
#define PRU1_GI_P8_29 0x00200 /* r31, 1 <<  9, GPIO2[23], GpioUserland 87 */

#define PRU1_GO_P8_27 0x00100 /* r30, 1 <<  8, GPIO2[22], GpioUserland 86 */
#define PRU1_GO_P8_28 0x00400 /* r30, 1 << 10, GPIO2[24], GpioUserland 88 */
#define PRU1_GO_P8_29 0x00200 /* r30, 1 <<  9, GPIO2[23], GpioUserland 87 */

#define PRU1_GI_P8_39 0x00040 /* r31, 1 <<  6, GPIO2[12], GpioUserland 76 */
#define PRU1_GI_P8_40 0x00080 /* r31, 1 <<  7, GPIO2[13], GpioUserland 77 */
#define PRU1_GI_P8_41 0x00010 /* r31, 1 <<  4, GPIO2[10], GpioUserland 74 */
#define PRU1_GI_P8_42 0x00020 /* r31, 1 <<  5, GPIO2[11], GpioUserland 75 */
#define PRU1_GI_P8_43 0x00004 /* r31, 1 <<  2, GPIO2[08], GpioUserland 72 */
#define PRU1_GI_P8_44 0x00008 /* r31, 1 <<  3, GPIO2[09], GpioUserland 73 */
#define PRU1_GI_P8_45 0x00001 /* r31, 1 <<  0, GPIO2[06], GpioUserland 70 */
#define PRU1_GI_P8_46 0x00002 /* r31, 1 <<  1, GPIO2[07], GpioUserland 71 */

#define PRU1_GO_P8_39 0x00040 /* r30, 1 <<  6, GPIO2[12], GpioUserland 76 */
#define PRU1_GO_P8_40 0x00080 /* r30, 1 <<  7, GPIO2[13], GpioUserland 77 */
#define PRU1_GO_P8_41 0x00010 /* r30, 1 <<  4, GPIO2[10], GpioUserland 74 */
#define PRU1_GO_P8_42 0x00020 /* r30, 1 <<  5, GPIO2[11], GpioUserland 75 */
#define PRU1_GO_P8_43 0x00004 /* r30, 1 <<  2, GPIO2[08], GpioUserland 72 */
#define PRU1_GO_P8_44 0x00008 /* r30, 1 <<  3, GPIO2[09], GpioUserland 73 */
#define PRU1_GO_P8_45 0x00001 /* r30, 1 <<  0, GPIO2[06], GpioUserland 70 */
#define PRU1_GO_P8_46 0x00002 /* r30, 1 <<  1, GPIO2[07], GpioUserland 71 */

/* P9 */
#define PRU0_GI_P9_24 0x10000 /* r31, 1 << 16, GPIO0[15], GpioUserland 15 */
#define PRU0_GI_P9_25 0x00080 /* r31, 1 <<  7, GPIO3[21], GpioUserland 117 */
#define PRU1_GI_P9_26 0x10000 /* r31, 1 << 16, GPIO0[14], GpioUserland 14 */
#define PRU0_GI_P9_27 0x00020 /* r31, 1 <<  5, GPIO3[19], GpioUserland 115 */
#define PRU0_GI_P9_28 0x00008 /* r31, 1 <<  3, GPIO3[17], GpioUserland 113 */
#define PRU0_GI_P9_29 0x00002 /* r31, 1 <<  1, GPIO3[15], GpioUserland 111 */
#define PRU0_GI_P9_30 0x00004 /* r31, 1 <<  2, GPIO3[16], GpioUserland 112 */
#define PRU0_GI_P9_31 0x00001 /* r31, 1 <<  0, GPIO3[14], GpioUserland 110 */

#define PRU0_GO_P9_25 0x00080 /* r30, 1 <<  7, GPIO3[21], GpioUserland 117 */
#define PRU0_GO_P9_27 0x00020 /* r30, 1 <<  5, GPIO3[19], GpioUserland 115 */
#define PRU0_GO_P9_28 0x00008 /* r30, 1 <<  3, GPIO3[17], GpioUserland 113 */
#define PRU0_GO_P9_29 0x00002 /* r30, 1 <<  1, GPIO3[15], GpioUserland 111 */
#define PRU0_GO_P9_30 0x00004 /* r30, 1 <<  2, GPIO3[16], GpioUserland 112 */
#define PRU0_GO_P9_31 0x00001 /* r30, 1 <<  0, GPIO3[14], GpioUserland 110 */


#define PRU0_GI_P9_41A 0x10000 /* r31, 1 << 16, GPIO0[20], GpioUserland 20 */
#define PRU0_GI_P9_41B 0x00040 /* r31, 1 <<  6, GPIO3[20], GpioUserland 116 */
#define PRU0_GI_P9_42B 0x00010 /* r31, 1 <<  4, GPIO3[18], GpioUserland 7 */

#define PRU0_GO_P9_41B 0x00040 /* r30, 1 <<  6, GPIO3[20], GpioUserland 7 */
#define PRU0_GO_P9_42B 0x00010 /* r30, 1 <<  4, GPIO3[18], GpioUserland 114 */

/* Other */
// PRU0_UART0_TXD_P9_24 0x10000 /* GPIO1[15], GpioUserland 15 */
// PRU1_UART0_RXD_P9_26 0x10000 /* GPIO1[14], GpioUserland 14 */

#endif

#endif
