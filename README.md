**_M32 Microcontroller:_**
Microcontrollers are integrated systems that help in processing real time signals and data. These are faster in computing and can process simple instructions really fast.
Whereas a microprocessor can process complex instructions efficiently. An mpu typically has multiple cores and threads, whereas an mcu usually has a single core with integrated RAM
and ROM.
This is an implementation of a microcontroller based on my previous project "MIPS_32_processor". 

**_Version 1 (current):_**
- Implementation of a very basic MCU with 32 GPIO pins.
- Contains a single MIPS 32 core.
- Memory mapping based on 5 adress spacing.
  
  +------------------+
  |                  | 0x00000000
  |                  |
  |   Data Memory    |
  |                  |
  |                  | 0x0000003F
  +------------------+
  |                  | 0x00000040
  |     GPIO OUT     |
  |                  | 0x00000047
  +------------------+
  |                  | 0x00000048
  |     GPIO IN      |
  |                  | 0x0000004B
  +------------------+
  |                  | 0x0000004C
  |    GPIO ENABLE   |
  |                  | 
  +------------------+
  |                  |
  |     GPIO DIR     |
  |                  |
  +------------------+
