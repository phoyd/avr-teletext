#include <inttypes.h>
#include <avr/io.h>
#include <util/twi.h>
//#include <avr/wdt.h>
#include <avr/interrupt.h>
//#include <avr/pgmspace.h>
//#include <stdarg.h>
//#include <stdlib.h>
#include <stdio.h>

#include "globals.h"
#define I2C_ADDRESS 0x40

#define SET(x,y) (x|=(1<<y))
#define CLR(x,y) (x&=(~(1<<y)))
#define CHK(x,y) (x&(1<<y)) 
#define TOG(x,y) (x^=(1<<y))

//setup the I2C hardware to ACK the next transmission
//and indicate that we've handled the last one.
#define TWACK (TWCR=(1<<TWINT)|(1<<TWEN)|(1<<TWEA))
//setup the I2C hardware to NACK the next transmission
#define TWNACK (TWCR=(1<<TWINT)|(1<<TWEN))
//reset the I2C hardware (used when the bus is in a illegal state)
#define TWRESET (TWCR=(1<<TWINT)|(1<<TWEN)|(1<<TWSTO)|(1<<TWEA))
	
// See
// http://www.atmel.com/Images/doc8161.pdf
// Table 21-4 for details.
#define TW_ACTION(STA,STO,INT,EA) (((STA)<<TWSTA)|((STO)<<TWSTO)|((INT)<<TWINT)|((EA)<<TWEA))
 
void i2c_setup()
{
  // TWI setup
  // no need to set baud rate for slave mode
  
  // set device address
  TWAR = I2C_ADDRESS <<1;
  TWAMR = 0x0<<1;
  
  // enable I2C, no interrupts.
  TWCR = (1<<TWEN) | (1<<TWEA);
}

static uint8_t dest_register = 0xff;
static uint8_t control = 0;
static uint8_t twdr = 0;
static uint8_t twsr = 0;
static char i2c_mode='I'; // R,W,?

#define W_LEN 64
static uint8_t w_buf[W_LEN];
static int w_ptr=0; 

void i2c_handle()
{ 
	const int _=0; 
	uint8_t state=TW_STATUS; 
	uint8_t data=TWDR; 
	int write_data=0;
	if (CHK(TWCR,TWINT)) // somthing happened
	{
		switch(state)
		{
			case 0xf8: 
				// no relevant state available. TWINT==0; 
				break; 
			case 0x0:
				// Bus error due to an illegal start or stop condition
				i2c_mode='?'; 
				TWCR=(1<<TWSTO) || (1<<TWINT);
				break;
			case 0x68: 
				// Arbitration lost in SLA+R/W as master
				// onw SLA+W hasbeen received..
				// should not happen. Treat as 0x60
			case 0x60:
				// we've Write-To-Slave prepare for receiving
				i2c_mode='W'; 
				TWACK;				
				break;
			case 0x80:
				// a byte was received!
				w_buf[w_ptr++]=data;
				if (w_ptr>=W_LEN) 
				{
					TWNACK; // nack, because write buffer full.
				}
				else 
				{
					TWACK;
				}
				break;
			case 0x88:
				// data received, but not acked.
				// switch to not addressed mode.
				TWACK;
				break; 
			case 0xA0: 
				// stop condition or repeat-start condition.
				i2c_mode='I';
				TWACK;
				break; 
			default:
				// sho57.99msuld not happend at all.
				w_buf[w_ptr++]='?';
				i2c_mode='I';
				TWRESET;
				break;
		}
	}
	// when idle, write buffer
	if ((w_ptr > 0) && (i2c_mode=='I')) 
	{
		int i; 
		if (1){
		console_putchar(':');
		console_putchar(w_ptr + '0');
		console_putchar(':');
		for (i=0;i<w_ptr;i++) 
			console_putchar(w_buf[i]);
		}
		w_ptr=0; 
	}
}
