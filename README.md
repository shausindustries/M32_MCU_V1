**_M32 Microcontroller:_**
Microcontrollers are integrated systems that help in processing real time signals and data. These are faster in computing and can process simple instructions really fast.
Whereas a microprocessor can process complex instructions efficiently. An mpu typically has multiple cores and threads, whereas an mcu usually has a single core with integrated RAM
and ROM.
This is an implementation of a microcontroller based on my previous project "MIPS_32_processor". 

**_Version 1:_**
- Implementation of a very basic MCU with 32 GPIO pins.
- Contains a single MIPS 32 core.
- Memory mapping based on 5 address spacing.

**_Features:_**
* 32 bidirectional GPIO pins.
* Enable and direction registers to set pins as output or input
* 16kB RAM, 4 32-bit GPIO registers and 32 32-bit general purpose registers.
* GPIO_EN: Enables or disables a GPIO pin.
  GPIO_DIR: Sets GPIO pins as input (0) or output (1).
  GPIO_IN: Stores the GPIO input data.
  GPIO_OUT: Stores the GPIO output data.

**_Limitations:_**
* No UART, SPI or I2C protocol.
* No counters.
* NO ADCs or DACs.

**_Version 1.5 (current):_**
- Implementation of a single 32 bit counter/timer.
- Timer_Prescale: 32 bit register that contains the prescaler value.
  Timer_Comp: 32 bit register that contains the comparator value.
  Timer_Config: 32 bit register containg enable.

**_Improvements:_**
- Add more timers to correspond with the config register.
