EESchema Schematic File Version 2  date Di 05 Mär 2013 15:59:21 CET
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:avr-teletext-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "AVR Teletext Inserter"
Date "5 mar 2013"
Rev "1"
Comp "Hackerspace Bremen e.V."
Comment1 "WORK IN PROGRESS"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA168-P IC1
U 1 1 5135C993
P 3200 2550
F 0 "IC1" H 2350 3850 40  0000 L BNN
F 1 "ATMEGA168-P" H 3550 1200 40  0000 L BNN
F 2 "DIL28" H 3200 2550 30  0000 C CIN
	1    3200 2550
	1    0    0    -1  
$EndComp
$Comp
L CRYSTAL X1
U 1 1 5135C9AA
P 3350 5500
F 0 "X1" H 3350 5650 60  0000 C CNN
F 1 "13.875" H 3350 5350 60  0000 C CNN
	1    3350 5500
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 5135C9F6
P 3700 5200
F 0 "C1" H 3750 5300 50  0000 L CNN
F 1 "22pF" H 3750 5100 50  0000 L CNN
	1    3700 5200
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 5135CA05
P 3700 5800
F 0 "C2" H 3750 5900 50  0000 L CNN
F 1 "22pF" H 3750 5700 50  0000 L CNN
	1    3700 5800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 5135CA15
P 4150 5950
F 0 "#PWR01" H 4150 5950 30  0001 C CNN
F 1 "GND" H 4150 5880 30  0001 C CNN
	1    4150 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 5200 3500 5200
Wire Wire Line
	3000 5800 3500 5800
Wire Wire Line
	3900 5200 3900 5800
Wire Wire Line
	3900 5500 4150 5500
Connection ~ 3900 5500
Connection ~ 3350 5200
Connection ~ 3350 5800
Text Label 3000 5800 2    60   ~ 0
XTAL2
$Comp
L VCC #PWR02
U 1 1 5135CBD9
P 2100 1250
F 0 "#PWR02" H 2100 1350 30  0001 C CNN
F 1 "VCC" H 2100 1350 30  0000 C CNN
	1    2100 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 1400 2200 1400
Wire Wire Line
	2100 1250 2100 1700
Wire Wire Line
	2100 1700 2200 1700
Connection ~ 2100 1400
$Comp
L GND #PWR03
U 1 1 5135CC0A
P 2100 3900
F 0 "#PWR03" H 2100 3900 30  0001 C CNN
F 1 "GND" H 2100 3830 30  0001 C CNN
	1    2100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 3600 2100 3600
Wire Wire Line
	2100 3600 2100 3900
Wire Wire Line
	2200 3700 2100 3700
Connection ~ 2100 3700
Text Label 4250 2850 0    60   ~ 0
RESET
Text Label 4750 5550 2    60   ~ 0
RESET
Wire Wire Line
	4750 5550 5250 5550
$Comp
L C C3
U 1 1 5135CCCD
P 5250 5750
F 0 "C3" H 5300 5850 50  0000 L CNN
F 1 "0.1µF" H 5300 5650 50  0000 L CNN
	1    5250 5750
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5135CCDC
P 5250 5300
F 0 "R1" V 5330 5300 50  0000 C CNN
F 1 "10k" V 5250 5300 50  0000 C CNN
	1    5250 5300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5135CCEB
P 5250 5950
F 0 "#PWR04" H 5250 5950 30  0001 C CNN
F 1 "GND" H 5250 5880 30  0001 C CNN
	1    5250 5950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 5135CCFA
P 5250 5050
F 0 "#PWR05" H 5250 5150 30  0001 C CNN
F 1 "VCC" H 5250 5150 30  0000 C CNN
	1    5250 5050
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5135CD4B
P 8000 2100
F 0 "R2" V 8080 2100 50  0000 C CNN
F 1 "680k/1%" V 8000 2100 50  0000 C CNN
	1    8000 2100
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 5135CD60
P 8000 1850
F 0 "C6" H 8050 1950 50  0000 L CNN
F 1 "0.1µF" H 8050 1750 50  0000 L CNN
	1    8000 1850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 5135CD72
P 8250 2300
F 0 "#PWR06" H 8250 2300 30  0001 C CNN
F 1 "GND" H 8250 2230 30  0001 C CNN
	1    8250 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2100 7750 2100
Wire Wire Line
	7750 2100 7750 1850
Wire Wire Line
	7750 1850 7800 1850
Wire Wire Line
	8200 1850 8250 1850
Wire Wire Line
	8250 1850 8250 2300
Connection ~ 8250 2100
Wire Wire Line
	6050 2300 5200 2300
Wire Wire Line
	5200 2300 5200 3200
Wire Wire Line
	5200 3200 4100 3200
Wire Wire Line
	6050 2100 5400 2100
Wire Wire Line
	5400 2100 5400 3300
Wire Wire Line
	5400 3300 4100 3300
$Comp
L CONN_2 P1
U 1 1 5135CEC9
P 3350 6900
F 0 "P1" V 3300 6900 40  0000 C CNN
F 1 "Video" V 3400 6900 40  0000 C CNN
	1    3350 6900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5135CED8
P 3000 7250
F 0 "#PWR07" H 3000 7250 30  0001 C CNN
F 1 "GND" H 3000 7180 30  0001 C CNN
	1    3000 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 3600 8200 3600
$Comp
L LED D1
U 1 1 5135CFA3
P 6650 3600
F 0 "D1" H 6650 3700 50  0000 C CNN
F 1 "LED" H 6650 3500 50  0000 C CNN
	1    6650 3600
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5135CFB2
P 6050 3600
F 0 "R3" V 6130 3600 50  0000 C CNN
F 1 "150" V 6050 3600 50  0000 C CNN
	1    6050 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 3100 5050 3100
Wire Wire Line
	5050 3100 5050 3600
Wire Wire Line
	5050 3600 5800 3600
Wire Wire Line
	6300 3600 6450 3600
$Comp
L C C4
U 1 1 5135D08D
P 7650 2500
F 0 "C4" H 7700 2600 50  0000 L CNN
F 1 "0.1µF" H 7700 2400 50  0000 L CNN
	1    7650 2500
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5135D1C1
P 7650 3050
F 0 "R4" V 7730 3050 50  0000 C CNN
F 1 "620" V 7650 3050 50  0000 C CNN
	1    7650 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 2700 7650 2800
Wire Wire Line
	7650 3300 7650 3600
Connection ~ 7650 3600
$Comp
L GND #PWR08
U 1 1 5135D225
P 7950 3400
F 0 "#PWR08" H 7950 3400 30  0001 C CNN
F 1 "GND" H 7950 3330 30  0001 C CNN
	1    7950 3400
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 5135D2A3
P 7950 3050
F 0 "C5" H 8000 3150 50  0000 L CNN
F 1 "580pF" H 8000 2950 50  0000 L CNN
	1    7950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 2850 7950 2800
Wire Wire Line
	7950 2800 7650 2800
Wire Wire Line
	7950 3250 7950 3400
Text Label 1500 7000 2    60   ~ 0
SDA
Text Label 1500 7100 2    60   ~ 0
SCL
$Comp
L VCC #PWR09
U 1 1 5135D41B
P 1800 6800
F 0 "#PWR09" H 1800 6900 30  0001 C CNN
F 1 "VCC" H 1800 6900 30  0000 C CNN
	1    1800 6800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5135D42A
P 1800 7250
F 0 "#PWR010" H 1800 7250 30  0001 C CNN
F 1 "GND" H 1800 7180 30  0001 C CNN
	1    1800 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 7200 1800 7250
Wire Wire Line
	1800 7000 1500 7000
Wire Wire Line
	1800 7100 1500 7100
Text Label 4250 2650 0    60   ~ 0
SDA
Text Label 4250 2750 0    60   ~ 0
SCL
Wire Wire Line
	4250 2750 4100 2750
Wire Wire Line
	4250 2650 4100 2650
Wire Wire Line
	4250 2850 4100 2850
Text Label 2750 6800 2    60   ~ 0
VIDEO
Wire Wire Line
	3000 6800 2750 6800
Wire Wire Line
	3000 7000 3000 7250
Text Label 8200 3600 0    60   ~ 0
VIDEO
$Comp
L CONN_4 P2
U 1 1 5135D40C
P 2150 7050
F 0 "P2" V 2100 7050 50  0000 C CNN
F 1 "Host" V 2200 7050 50  0000 C CNN
	1    2150 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 6900 1800 6800
$Comp
L AVR-ISP-10 CON1
U 1 1 5135F8A6
P 4900 6850
F 0 "CON1" H 4730 7180 50  0000 C CNN
F 1 "AVR-ISP-10" H 4560 6520 50  0000 L BNN
F 2 "AVR-ISP-10" V 4150 6900 50  0001 C CNN
	1    4900 6850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5135F923
P 5300 7250
F 0 "#PWR011" H 5300 7250 30  0001 C CNN
F 1 "GND" H 5300 7180 30  0001 C CNN
	1    5300 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6750 5300 6750
Wire Wire Line
	5300 6750 5300 7250
Wire Wire Line
	4950 6850 5300 6850
Connection ~ 5300 6850
Wire Wire Line
	4950 6950 5300 6950
Connection ~ 5300 6950
Wire Wire Line
	4950 7050 5300 7050
Connection ~ 5300 7050
$Comp
L VCC #PWR012
U 1 1 5135FA16
P 5300 6450
F 0 "#PWR012" H 5300 6550 30  0001 C CNN
F 1 "VCC" H 5300 6550 30  0000 C CNN
	1    5300 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6650 5300 6650
Wire Wire Line
	5300 6650 5300 6450
Text Label 4200 6650 2    60   ~ 0
MOSI
Text Label 4200 6850 2    60   ~ 0
RESET
Text Label 4200 6950 2    60   ~ 0
SCK
Text Label 4200 7050 2    60   ~ 0
MISO
Wire Wire Line
	4700 7050 4200 7050
Wire Wire Line
	4700 6950 4200 6950
Wire Wire Line
	4700 6850 4200 6850
Wire Wire Line
	4700 6650 4200 6650
Text Label 4250 1700 0    60   ~ 0
MOSI
Text Label 4250 1800 0    60   ~ 0
MISO
Text Label 4250 1900 0    60   ~ 0
SCK
Wire Wire Line
	4100 1900 4250 1900
Wire Wire Line
	4100 1800 4250 1800
Wire Wire Line
	4100 1700 4250 1700
NoConn ~ 4100 1400
NoConn ~ 4100 1500
NoConn ~ 4100 1600
NoConn ~ 4100 2250
NoConn ~ 4100 2350
NoConn ~ 4100 2450
NoConn ~ 4100 2550
NoConn ~ 4100 3000
NoConn ~ 4100 3400
NoConn ~ 4100 3500
NoConn ~ 4100 3600
NoConn ~ 4100 3700
NoConn ~ 2200 2000
NoConn ~ 6050 1900
NoConn ~ 6050 2500
Wire Wire Line
	4150 5500 4150 5950
NoConn ~ 4700 6750
$Comp
L LM1881 U1
U 1 1 5135C984
P 6850 2200
F 0 "U1" H 7050 2700 70  0000 C CNN
F 1 "LM1881" H 7250 1700 70  0000 C CNN
	1    6850 2200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 513603AD
P 6850 1500
F 0 "#PWR013" H 6850 1500 30  0001 C CNN
F 1 "GND" H 6850 1430 30  0001 C CNN
	1    6850 1500
	-1   0    0    1   
$EndComp
Wire Wire Line
	6850 1600 6850 1500
$Comp
L VCC #PWR014
U 1 1 51360401
P 6850 2900
F 0 "#PWR014" H 6850 3000 30  0001 C CNN
F 1 "VCC" H 6850 3000 30  0000 C CNN
	1    6850 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	6850 2900 6850 2800
Text Label 3000 5200 2    60   ~ 0
XTAL1
$Comp
L PWR_FLAG #FLG015
U 1 1 5136066C
P 1650 5400
F 0 "#FLG015" H 1650 5495 30  0001 C CNN
F 1 "PWR_FLAG" H 1650 5580 30  0000 C CNN
	1    1650 5400
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG016
U 1 1 5136067B
P 2000 5400
F 0 "#FLG016" H 2000 5495 30  0001 C CNN
F 1 "PWR_FLAG" H 2000 5580 30  0000 C CNN
	1    2000 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5136068A
P 1650 5650
F 0 "#PWR017" H 1650 5650 30  0001 C CNN
F 1 "GND" H 1650 5580 30  0001 C CNN
	1    1650 5650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR018
U 1 1 51360699
P 2000 5650
F 0 "#PWR018" H 2000 5750 30  0001 C CNN
F 1 "VCC" H 2000 5750 30  0000 C CNN
	1    2000 5650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 5650 1650 5400
Wire Wire Line
	2000 5650 2000 5400
Text Label 4250 2000 0    60   ~ 0
XTAL1
Text Label 4250 2100 0    60   ~ 0
XTAL2
Wire Wire Line
	4250 2000 4100 2000
Wire Wire Line
	4250 2100 4100 2100
$EndSCHEMATC
