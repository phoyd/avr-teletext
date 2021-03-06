DEVICE=atmega328
ifeq ($(DEVICE),atmega168)
 DUDENAME=m168
else ifeq ($(DEVICE),atmega328)
 DUDENAME=m328p
else 
 $(error "invalid device specified: $(DEVICE)")
endif

NAME = teletext.$(DEVICE)
OBJECTS = main.o isrs.o console.o passthrough.o utils.o demotext.o i2c.o
CC = avr-gcc
AS = avr-as
CFLAGS = -Os -mmcu=$(DEVICE) $(EXTRA_CFLAGS) -DF_CPU=13875000UL -s
ASFLAGS = $(CFLAGS)
AVRDUDE = avrdude -c usbasp -p $(DUDENAME)

all: $(NAME).bin

%.bin: %.elf
	avr-objcopy -j .text -j .data -O binary $< $@

%.hex: %.elf
	avr-objcopy -j .text -j .data -O ihex -R .eeprom $< $@

$(NAME).elf: $(OBJECTS)
	$(CC) $(CFLAGS) -o $(NAME).elf $(OBJECTS)


upload: $(NAME).bin
	$(AVRDUDE) -U flash:w:$(NAME).bin

clean:
	rm -f *.bin *.elf *.o

reset:
	$(AVRDUDE) -n
