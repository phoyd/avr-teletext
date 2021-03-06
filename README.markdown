avr-teletext
------------

See the Wiki for more information: 
https://github.com/phoyd/avr-teletext/wiki

This is a teletext inserter for AVR microcontroller. It adds teletext to an
existing composite signal. It is controlled on I2C and features two modes.
In passthrough mode whole teletext packets are received on I2C and inserted
into the video signal, allowing the broadcast of an interleaved magazine with
multiple pages. In console mode the I2C port receives individual characters
and emulates a framebuffer by generating a single page repeatedly. The console
supports accelerated scrolling.

The project homepage
https://chili.hackerspace-bremen.de/projects/teletext-inserter

A video of the device operating is here:
https://plus.google.com/117474986382867317779/posts/eKBn5ePYWbc

A breadboard prototype: 
http://www.youtube.com/watch?v=iac1NJZw9VQ

Hardware
--------

A KiCAD Project with the hardware schematic is in the folder schematic.
The folder also contains a PDF for quick review.

General parts list:

 * AVR microcontroller. I used Atmega 168. Using a part with more RAM would
   allow for multiple consoles are other fancy stuff.

 * LM1881 sync splitter. For generating horizontal and vertical sync pulses.
   Hard to find in through hole package. I got it at http://www.rapidonline.com

 * 13.875 MHz crystal. For AVR clock. This is double teletext frequency.
   Extremely hard to find. I got it from http://quarndon.co.uk/

 * A diode to hook up the teletext to the video signal.

 * Various resistors and capacitors. Especially you need some filter caps 
   between ground and vcc or the output signal will be too dirty to work.

I2C addresses
-------------

The AVR implements two I2C addresses: data and control.

    0x00 - Data address

    Bits    Function
    0-6     7 bit characters written here will be placed into the output buffer.
    7       Unused.

    0x01 - Control address

    Bits
    0       Set mode. 0 = console, 1 = passthrough.
    1-7     Unused.

Console mode
------------

In this mode each character received will be written into a character
framebuffer, staring in the top left corner and moving to the right with each 
character. When the end of the line is reached the cursor position moves to the
beginning of the next line. When the bottom of the display is reached the row
pointers into the buffer are shifted by 1 line, and the line at the top of the 
display becomes the line at the bottom. This line is cleared and new characters
go here. Essentially it is a scrolling text console. Newlines are supported.
Setting the cursor position is not supported. The whole buffer is output on a 
loop regardless of whether new data is available.

Passthrough mode
----------------

In this mode each received character is written into the output buffer and then
outputted only once. The buffer is used with a head and tail pointer here. When
a row fills up the head pointer is incremented and when the row is output the 
tail pointer is incremented. If there are no lines to output a filler line is
output instead. This mode is intended to be used to broadcast normal teletext
magazines with multiple interleaved pages.

The Diode
---------

The AVR uses SPI to output the teletext signal. The ISR enables TX in the
horizontal interrupt before pushing out the bits at the right moment and 
disables TX afterwards. This is neccessary, because TX would be high when
idle. The original code dealed with it by producing an inverted signal, 
which would later be inverted/coupled with an 74LS244N.

When the teletext generator is idle or goes low, then the circuit should
be disconnected from video, so that the low state does not drain current
from the video signal. This is achieved using a diode. In fact a LED could 
be used which, together with the right resistor value, would produce the 
right voltage level and even indicate data transmission with a flickering 
light. 

During blanking, video has negative levels agains low, but most diodes have
a much larger forwad bias than that difference.
