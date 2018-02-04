
#ifndef __HEADER_PRU_SUPPORT_PINS_H__
#define __HEADER_PRU_SUPPORT_PINS_H__

#define PRU0_GO_P8_11 0x8000 /* r30, 1 << 15, GPIO1[13], Pin45 */
#define PRU0_GO_P8_12 0x4000 /* r30, 1 << 14, GPIO1[12], Pin44 */

#define PRU0_GI_P8_15 0x4000 /* r31, 1 << 15, GPIO1[15], Pin47 */
#define PRU0_GI_P8_16 0x4000 /* r31, 1 << 14, GPIO1[14], Pin46 */

#define PRU1_GI_P8_20 0x2000 /* r31, 1 << 13, GPIO1[31], Pin63 */
#define PRU1_GO_P8_20 0x2000 /* r30, 1 << 13, GPIO1[31], Pin63 */
#define PRU1_GI_P8_21 0x1000 /* r31, 1 << 12, GPIO1[30], Pin62 */
#define PRU1_GO_P8_21 0x1000 /* r30, 1 << 12, GPIO1[30], Pin62 */

#define PRU1_GI_P8_27 0x100 /* r31, 1 <<  8, GPIO1[22], Pin86 */
#define PRU1_GO_P8_27 0x100 /* r30, 1 <<  8, GPIO1[22], Pin86 */
#define PRU1_GI_P8_28 0x400 /* r31, 1 << 10, GPIO1[24], Pin88 */
#define PRU1_GO_P8_28 0x400 /* r30, 1 << 10, GPIO1[24], Pin88 */
#define PRU1_GI_P8_29 0x200 /* r31, 1 <<  9, GPIO1[23], Pin87 */
#define PRU1_GO_P8_29 0x200 /* r30, 1 <<  9, GPIO1[23], Pin87 */

#define PRU1_GI_P8_39 0x40 /* r31, 1 <<  6, GPIO1[12], Pin76 */
#define PRU1_GI_P8_40 0x80 /* r31, 1 <<  7, GPIO1[13], Pin77 */
#define PRU1_GI_P8_41 0x10 /* r31, 1 <<  4, GPIO1[10], Pin74 */
#define PRU1_GI_P8_42 0x20 /* r31, 1 <<  5, GPIO1[11], Pin75 */
#define PRU1_GI_P8_43 0x04 /* r31, 1 <<  2, GPIO1[08], Pin72 */
#define PRU1_GI_P8_44 0x08 /* r31, 1 <<  3, GPIO1[09], Pin73 */
#define PRU1_GI_P8_45 0x01 /* r31, 1 <<  0, GPIO1[06], Pin70 */
#define PRU1_GI_P8_46 0x02 /* r31, 1 <<  1, GPIO1[07], Pin71 */

#define PRU1_GO_P8_39 0x40 /* r30, 1 <<  6, GPIO1[12], Pin76 */
#define PRU1_GO_P8_40 0x80 /* r30, 1 <<  7, GPIO1[13], Pin77 */
#define PRU1_GO_P8_41 0x10 /* r30, 1 <<  4, GPIO1[10], Pin74 */
#define PRU1_GO_P8_42 0x20 /* r30, 1 <<  5, GPIO1[11], Pin75 */
#define PRU1_GO_P8_43 0x04 /* r30, 1 <<  2, GPIO1[08], Pin72 */
#define PRU1_GO_P8_44 0x08 /* r30, 1 <<  3, GPIO1[09], Pin73 */
#define PRU1_GO_P8_45 0x01 /* r30, 1 <<  0, GPIO1[06], Pin70 */
#define PRU1_GO_P8_46 0x02 /* r30, 1 <<  1, GPIO1[07], Pin71 */

#endif
