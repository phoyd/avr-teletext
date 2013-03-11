#include <avr/pgmspace.h>
#include "globals.h"
/*
 0123456789012345678901234567890123456789
*/
const char demo_text[] PROGMEM =
  GREEN FLASHON
  "      Hackerspace Bremen e.V. !\n"
  "\n"
  "           "RED"* "GREEN"* "YELLOW"* "BLUE"* "MAGENTA"* "CYAN"*\n\n"
  "           "FLASHON"p r e s e n t s"FLASHOFF"\n"
  "\n"
  "           "RED"* "GREEN"* "YELLOW"* "BLUE"* "MAGENTA"* "CYAN"*\n\n"
  WHITE
  "Alistair Buxton's AVR Teletext Inserter\n"
  "from "CYAN"https://github.com/ali1234/avr-teletext"WHITE"\n"
  "on a breadboard\n"

  "  The"CYAN"AVR"WHITE"is a modified Harvard\n"
  "architecture 8-bit RISC single chip\n"
  "microcontroller which was developed by\n"
  "Atmel in"GREEN"1996."WHITE"The AVR was one of the\n"
  "first microcontroller families to use\n"
  "on-chip flash memory for program\n"
  "storage, as opposed to one-time\n"
  "programmable ROM, EPROM, or EEPROM used\n"
  "by other microcontrollers at the time.\n"
  "\n"
  "           "RED"* "GREEN"* "YELLOW"* "BLUE"* "MAGENTA"* "CYAN"*\n\n"
  " "YELLOW"Teletext"WHITE"(or \"broadcast teletext\") is\n"
  "a television information retrieval\n"
  "service developed in the United Kingdom\n"
  "in the early"GREEN"1970s."WHITE"It offers a range\n"
  "of text-based information, typically\n"
  "including national, international and\n"
  "sporting news, weather and television\n"
  "schedules. Subtitle information is also\n"
  "transmitted in the teletext signal,\n"
  "typically on page 888, 777 or 333."
  ;
