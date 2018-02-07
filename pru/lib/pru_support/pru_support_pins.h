
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

typedef uint32_t Pin;

/* #ifdef BB_BLACK | BB_GREEN */

/*

  ======================================================================================================================================
                                                        BeagleBone Black Pinout
  ======================================================================================================================================

  +=================+=================+=================+=================+
  | Pin Symbol      |        !        |        *        |       @         |
  +-----------------+-----------------+-----------------+-----------------+
  | PRU Direct Mode |   output        |   output        |  input / output |
  +=================+=================+=================+=================+


                                                 ~ Power ~
                                                  --|+|--|--------|------
             P9                                 /   |+|  |  Eth0  |       \                     P8
                                                |   |_|  |        |       |
  +==========+=====+=====+=============+        |O__     |________|    __O|        +============+======+=====+=============+
  | DGND     |  1  |  2  | DGND        |        | [|]                 [|] |        | DGND       |   1  |  2  | DGND        |   ... row 1
  | Vdd 3v3  |  3  |  4  | Vdd 3V3     |        | [|]                 [|] |        | MMC1 DAT 6 |   3  |  4  | MMC1 DAT7   |   ... row 2
  | Vdd 5v   |  5  |  6  | Vdd 5v      |        | [|]                 [|] |        | MMC1 DAT2  |   5  |  6  | MMC1 DAT3   |   ... row 3
  | Sys 5v   |  7  |  8  | Sys 5v      |        | [|]                 [|] |        | GPIO 66    |   7  |  8  | GPIO 67     |   ... row 4
  | PWR BTN  |  9  | 10  | Sys Rst     |        | [|]                 [|] |        | GPIO 69    |   9  | 10  | GPIO 68     |   ... row 5
  | UART4 RX | 11  | 12  | GPIO 60     |        | [|]                 [|] |        | GPIO 45    |  11! | 12! | GPIO 44     |   ... row 6
  | UART4 TX | 13  | 14  | PWM1A       |        | [|]                 [|] |        | PWM2B      |  13  | 14  | GPIO 26     |   ... row 7
  | GPIO 48  | 15  | 16  | PWM1B       |        | [|]                 [|] |        | GPIO 47    |  15^ | 16^ | GPIO 46     |   ... row 8
  | SPI0 CS0 | 17  | 18  | SPIO D1     |        | [|]     ........    [|] |        | GPIO 27    |  17  | 18  | GPIO 65     |   ... row 9
  | I2C2 SCL | 19  | 20  |             |        | [|]     .      .    [|] |        | PWM2A      |  19  | 20@ | MMC1 CMD    |   ... row 10
  | SPIO DO  | 21  | 22  | SPIO SCLK   |        | [|]     . TI   .    [|] |        | MMC1 CLK   |  21@ | 22  | MMC1 DAT5   |   ... row 11
  | GPIO 49  | 23  | 24^ | UART1 TX    |        | [|]     .      .    [|] |        | MMC1 DAT4  |  23  | 24  | MMC1 DAT1   |   ... row 12
  | GPIO 117 | 25@ | 26^ | UART1 RX    |        | [|]     ........    [|] |        | MMC1 DAT0  |  25  | 26  | GPIO 61     |   ... row 13
  | GPIO 115 | 27@ | 28@ | SPI1 CSO    |        | [|]                 [|] |        | LCD VSYNC  |  27@ | 28@ | LCD PCLK    |   ... row 14
  | SPI1 DO  | 29@ | 30@ | GPIO 112    |        | [|]                 [|] |        | LCD HSYNC  |  29@ | 30  | LCD ACBias  |   ... row 15
  | SPI1 SCK | 31@ | 32  | Vdd ADC     |        | [|]                 [|] |        | LCD DATA14 |  31  | 32  | LCD DATA15  |   ... row 16
  | AIN4     | 33  | 34  | GndA ADC    |        | [|]                 [|] |        | LCD DATA13 |  33  | 34  | LCD DATA11  |   ... row 17
  | AIN6     | 35  | 36  | AIN5        |        | [|]                 [|] |        | LCD DATA12 |  35  | 36  | LCD DATA10  |   ... row 18
  | AIN2     | 37  | 38  | AIN3        |        | [|]                 [|] |        | LCD DATA8  |  37  | 38  | LCD DATA9   |   ... row 19
  | AIN0     | 39  | 40  | AIN1        |        | [|]                 [|] |        | LCD DATA6  |  39@ | 40@ | LCD DATA7   |   ... row 20
  | GPIO 20  | 41@ | 42@ | PWM0        |        | [|]                 [|] |        | LCD DATA4  |  41@ | 42@ | LCD DATA5   |   ... row 21
  | DGND     | 43  | 44  | DGND        |        | [|]                 [|] |        | LCD DATA2  |  43@ | 44@ | LCD DATA3   |   ... row 22
  | DGND     | 45  | 46  | DGND        |        | [|] -------         [|] |        | LCD DATA0  |  45@ | 46@ | LCD DATA1   |   ... row 23
  +==========+=====+=====+=============+        \     | SD  |             /        +============+======+=====+=============+
                                                  ----|     |------------
                                                      -------

 */

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

/* #endif */

#endif
