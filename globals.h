#ifndef AVR_TT_GLOBALS_H
#define AVR_TT_GLOBALS_H
/*
 * Global register variables.
 */
#define NBUFFERS 22

#ifdef __ASSEMBLER__

//#  define oline_counter  r3

#else  /* !ASSEMBLER */

#include <stdint.h>

//register uint8_t line_counter asm("r3");


void passthrough_setup();
void passthrough_start();
void passthrough_putchar(uint8_t c);

#define BLACK "\x80"
#define RED "\x01"
#define GREEN "\x02"
#define YELLOW "\x83"
#define BLUE "\x04"
#define MAGENTA "\x85"
#define CYAN "\x86"
#define WHITE "\x07"
#define FLASHON "\x08"
#define FLASHOFF "\x09"
#define ENDBOX "\x0A"
#define STARTBOX "\x0B"
#define NORMAL "\x0C"
#define DOUBLEH "\x0D"
#define DOUBLEW "\x0E"
#define DOUBLEWH "\x0F"

uint8_t parity(uint8_t c);
uint8_t hex(uint8_t n);
void delay_ms(uint8_t ms);
void delay_s(uint8_t s);

void console_setup();
void move_rows();
void console_clear();
void console_putchar(char c);
void console_putchar_and_hex(char c);

void i2c_setup();
void i2c_handle();

#ifdef DEBUG
#define DEBUG_PRINTF(...) printf(__VA_ARGS__)
#else
#define DEBUG_PRINTF(...)
#endif

#endif /* ASSEMBLER */

#endif
