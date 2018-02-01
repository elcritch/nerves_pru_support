/*******************************************
* Author: Qingfeng Xia  @ iesensor.com
* BSD 3 claused Licensed  2013
* Modified: Jaremy Creechley, Pronghorn Technolgies, 2018
*********************************************/


#ifndef _SOFTWARE_SPI_H
#define _SOFTWARE_SPI_H

#include <stdint.h>

#define _MISO  40
#define _MOSI  41
#define _SCK   42
#define _SS  ADC_SPI_CS_PIN
#define _CPOL 0
#define _CPHA 1

#define SPI_MSBFIRST 1

uint8_t spi_transfer(uint8_t b) ;
void spi_setup();

//for example 8cycles as one SPI period, for Arduino mega2560 16MHz, SPI 2MHz,  tested passed for AD7730!
//for DUE 84MHz,  need longer nop cycles to keep waveform!  -> multiply each delay by 6 
#define DELAY_CYCLES  2     //more precise than micro second delay,  1/4 of SPI bus frequency , depends on MCU master clock, 
#define DELAY_CYCLES_P0  1  //propogation pre
#define DELAY_CYCLES_P1  3  //propogation post
#define DELAY_CYCLES_C0 1   //capture pre (SCK edge -> capture) usually smaller delay
#define DELAY_CYCLES_C1 3   //capture post ( capture -> SCK edge)  usually bigger delay 

  /*
  The timing diagram is shown to the right. The timing is further described below and applies to both the master and the slave device.

      At CPOL=0 the base value of the clock is zero
          For CPHA=0, data is captured on the clock's rising edge (low→high transition) and data is propagated on a falling edge (high→low clock transition).
          For CPHA=1, data is captured on the clock's falling edge and data is propagated on a rising edge.  ->  MODE1 for Arduino SPI lib
      At CPOL=1 the base value of the clock is one (inversion of CPOL=0)
          For CPHA=0, data is captured on clock's falling edge and data is propagated on a rising edge.
          For CPHA=1, data is captured on clock's rising edge and data is propagated on a falling edge.
  */

#endif // header
