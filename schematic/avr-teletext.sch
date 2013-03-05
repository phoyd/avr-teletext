EESchema Schematic File Version 2  date Di 05 Mär 2013 12:27:42 CET
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
L LM1881 U1
U 1 1 5135C984
P 6850 2200
F 0 "U1" H 7050 2700 70  0000 C CNN
F 1 "LM1881" H 7250 1700 70  0000 C CNN
	1    6850 2200
	-1   0    0    1   
$EndComp
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
P 2900 4850
F 0 "X1" H 2900 5000 60  0000 C CNN
F 1 "13.875" H 2900 4700 60  0000 C CNN
	1    2900 4850
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 5135C9F6
P 3250 4550
F 0 "C1" H 3300 4650 50  0000 L CNN
F 1 "22pF" H 3300 4450 50  0000 L CNN
	1    3250 4550
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 5135CA05
P 3250 5150
F 0 "C2" H 3300 5250 50  0000 L CNN
F 1 "22pF" H 3300 5050 50  0000 L CNN
	1    3250 5150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR01
U 1 1 5135CA15
P 3700 5300
F 0 "#PWR01" H 3700 5300 30  0001 C CNN
F 1 "GND" H 3700 5230 30  0001 C CNN
	1    3700 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 4550 3050 4550
Wire Wire Line
	2550 5150 3050 5150
Wire Wire Line
	3450 4550 3450 5150
Wire Wire Line
	3450 4850 3700 4850
Wire Wire Line
	3700 4850 3700 5300
Connection ~ 3450 4850
Text Label 4250 2000 0    60   ~ 0
XTAL1
Text Label 4250 2100 0    60   ~ 0
XTAL2
Connection ~ 2900 4550
Connection ~ 2900 5150
Text Label 2550 4550 0    60   ~ 0
XTAL1
Text Label 2550 5150 0    60   ~ 0
XTAL2
Wire Wire Line
	4250 2000 4100 2000
Wire Wire Line
	4250 2100 4100 2100
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
$Comp
L GND #PWR04
U 1 1 5135CC49
P 6850 3000
F 0 "#PWR04" H 6850 3000 30  0001 C CNN
F 1 "GND" H 6850 2930 30  0001 C CNN
	1    6850 3000
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR05
U 1 1 5135CC58
P 6850 1550
F 0 "#PWR05" H 6850 1650 30  0001 C CNN
F 1 "VCC" H 6850 1650 30  0000 C CNN
	1    6850 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2800 6850 3000
Wire Wire Line
	6850 1650 6850 1550
Text Label 4250 2850 0    60   ~ 0
RESET
Text Label 4350 4900 0    60   ~ 0
RESET
Wire Wire Line
	4350 4900 4850 4900
$Comp
L C C3
U 1 1 5135CCCD
P 4850 5100
F 0 "C3" H 4900 5200 50  0000 L CNN
F 1 "0.1µF" H 4900 5000 50  0000 L CNN
	1    4850 5100
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5135CCDC
P 4850 4650
F 0 "R1" V 4930 4650 50  0000 C CNN
F 1 "10k" V 4850 4650 50  0000 C CNN
	1    4850 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 5135CCEB
P 4850 5300
F 0 "#PWR06" H 4850 5300 30  0001 C CNN
F 1 "GND" H 4850 5230 30  0001 C CNN
	1    4850 5300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR07
U 1 1 5135CCFA
P 4850 4400
F 0 "#PWR07" H 4850 4500 30  0001 C CNN
F 1 "VCC" H 4850 4500 30  0000 C CNN
	1    4850 4400
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
L GND #PWR08
U 1 1 5135CD72
P 8250 2250
F 0 "#PWR08" H 8250 2250 30  0001 C CNN
F 1 "GND" H 8250 2180 30  0001 C CNN
	1    8250 2250
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
	8250 1850 8250 2250
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
P 7750 4800
F 0 "P1" V 7700 4800 40  0000 C CNN
F 1 "Video" V 7800 4800 40  0000 C CNN
	1    7750 4800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5135CED8
P 7400 5150
F 0 "#PWR09" H 7400 5150 30  0001 C CNN
F 1 "GND" H 7400 5080 30  0001 C CNN
	1    7400 5150
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
L GND #PWR010
U 1 1 5135D225
P 7950 3400
F 0 "#PWR010" H 7950 3400 30  0001 C CNN
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
Text Label 5700 4700 0    60   ~ 0
SDA
Text Label 5700 4800 0    60   ~ 0
SCL
$Comp
L VCC #PWR011
U 1 1 5135D41B
P 6000 4500
F 0 "#PWR011" H 6000 4600 30  0001 C CNN
F 1 "VCC" H 6000 4600 30  0000 C CNN
	1    6000 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5135D42A
P 6000 4950
F 0 "#PWR012" H 6000 4950 30  0001 C CNN
F 1 "GND" H 6000 4880 30  0001 C CNN
	1    6000 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4900 6000 4950
Wire Wire Line
	6000 4700 5700 4700
Wire Wire Line
	6000 4800 5700 4800
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
Text Label 7150 4700 0    60   ~ 0
VIDEO
Wire Wire Line
	7400 4700 7150 4700
Wire Wire Line
	7400 4900 7400 5150
Text Label 8200 3600 0    60   ~ 0
VIDEO
$Comp
L CONN_4 P2
U 1 1 5135D40C
P 6350 4750
F 0 "P2" V 6300 4750 50  0000 C CNN
F 1 "Host" V 6400 4750 50  0000 C CNN
	1    6350 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4600 6000 4500
$EndSCHEMATC
