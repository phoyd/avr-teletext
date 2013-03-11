/*
    Copyright 2012 Alistair Buxton <a.j.buxton@gmail.com>

    This file is part of avr-teletext.

    avr-teletext is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

    avr-teletext is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with avr-teletext.  If not, see <http://www.gnu.org/licenses/>.
*/

#include <inttypes.h>
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>

#include "globals.h"

#define WITH_LM1881

#define nop() __asm__ __volatile__("nop\nnop\nnop\nnop");

void io_setup(void)
{

// +---+-----+-----+-----+-----+-----+-----+-----+-----+
// |   |  0  |  1  |  2  |  3  |  4  |  5  |  6  |  7  |
// +---+-----+-----+-----+-----+-----+-----+-----+-----+
// | B | OUT | OUT | OUT | OUT | IN  | IN  |  Crystal  |
// +---+-----+-----+-----+-----+-----+-----+-----+-----+
// | C | OUT | OUT | OUT | OUT | SDA | SCL | RST |  -  |
// +---+-----+-----+-----+-----+-----+-----+-----+-----+
// | D | RXD | TXD |INT0 |INT1 | T0  | T1  | OUT | OUT |
// +---+-----+-----+-----+-----+-----+-----+-----+-----+

  cli();
  // D[7] = shifter enable
  DDRD = 0x12;
  PORTD = 0;

  // SPI setup
  // baud Fosc/2
  UBRR0H = 0;
  UBRR0L = 0;
  // USART0 MSPIM mode, LSB
  UCSR0C = 0xc4;
  // We don't enable TX yet, because it will go high when idle
  // TX is enabled in the ISR during sending.
  UCSR0B = 0;

  // TWI setup
  // no need to set baud rate for slave mode
  // enable pull-ups
  DDRC = 0x00;
  PORTC = 0x30;
  // match 0x40
  TWAR = 0x40<<1;
  TWAMR = 0x0<<1;
  // enable TWI, no interrupt request
  TWCR = _BV(TWEN) | _BV(TWEA);

  // external INT0 and INT1 enable
  EICRA = 0x0b;
  EIMSK = 0x03;

  sei();

}

volatile uint8_t line_counter;
volatile uint8_t tt_buffer[NBUFFERS][42];
volatile uint8_t buffer_head = 0;
volatile uint8_t buffer_tail = 0;

/* Buffer that we send when we have nothing else to do. */
const uint8_t fill_buffer[42] PROGMEM =
{
  0x49, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15,
  0x15, 0x15,
  0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20,
  0x20, 0x31, 0xb0, 0xb0, 0x20, 0x54, 0x75, 0xe5,
  0x20, 0x31, 0x37, 0x20, 0x4a, 0x61, 0x6e, 0x83,
  0x32, 0x31, 0xba, 0xb5, 0xb0, 0x2f, 0xb3, 0xb6
};

/* hmm */

extern uint8_t first_row;
extern PROGMEM const char demo_text[];

void run_demo(unsigned n)
{

  while(n-->0)
    {

      int text_pos;
      char c;
      text_pos = 0;
      //console_clear();
      while((c = pgm_read_byte(&(demo_text[text_pos]))) != 0)
        {
          console_putchar(c);
          delay_ms(1);
          text_pos++;
        }
      //delay_s(1);
      console_putchar('\n');
      console_putchar('\n');
    }
}

int tt_putchar(char c, FILE *f)
{
  cli();
  console_putchar(c);
  sei();
  return 0;
}

#ifdef DEBUG
static FILE tt_stdout=FDEV_SETUP_STREAM(tt_putchar, NULL, _FDEV_SETUP_WRITE);
#define SETUP_DEBUG stdout=&tt_stdout
#define DEBUG_PRINTF(...) printf(__VA_ARGS__)
#else
#define SETUP_DEBUG
#define DEBUG_PRINTF(...)
#endif

int main(void)
{
  uint8_t dest_register = 0xff;
  uint8_t control = 0;
  uint8_t twdr = 0;
  uint8_t twsr = 0;

  SETUP_DEBUG;

  io_setup();
  console_setup();
  control=0;
  run_demo(0);
  console_clear();

  DEBUG_PRINTF("HALLO TELETEXT");

  for(;;)
    {
      if(TWCR&0x80)
        {
          twdr = TWDR;
          twsr = TWSR;
          TWCR |= 0x80;
          DEBUG_PRINTF("\nTWSR=%x, TWDR=%x, TWAMR=%x:" ,twsr,twdr,TWAMR);
          switch(twsr&0xf8)
            {
            case 0x60:
            case 0x68:
              dest_register = (twdr>>1)&(TWAMR>>1);
              if(control&0x01) passthrough_start();
              break;
            case 0x80:
              switch(dest_register)
                {
                case 0:
                  if(control&0x01)
                    {
                      passthrough_putchar(twdr);
                    }
                  else
                    {
                      console_putchar(twdr&0x7f);
                    }
                  break;
                case 1:
                  control = twdr;
                  if(control&0x01)
                    {
                      passthrough_setup();
                    }
                  else
                    {
                      console_setup();
                    }
                  break;
                default:

                  break;
                }
              break;
            default:
              dest_register = 0xff;
              //error - bail out
              break;
            } // switch
        } // if
    } // for

  // Never reached.
  return(0);
}
