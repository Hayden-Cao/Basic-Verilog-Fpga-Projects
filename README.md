# Basic-Verilog-Fpga-Projects

All projects were implemented on a Nexys A7-100T FPGA development board using the Vivado IDE.  

**Calculator:**  

  Developed a calculator that can do addition, subtraction, and multiplication. Addition and subtraction use signed numbers while multiplication uses unsigned numbers. The addition is implemented through the use of half adders and the numbers are displayed on the onboard 7-Segment displays.

**Traffic Light Controller:** 

  The traffic light controller uses 2 RGB leds that alternate between green, red, and yellow. In a 5 second time frame, the left led will be green for four seconds and yellow for 0.8 seconds, and red for the remaining 0.2 seconds. The right LED will be red for all 5 seconds. After this 5 second timeframe is over the LEDs swap roles and the right led will swap between green, yellow, and red while the left led is always red. This process will loop infinitely.

**Combination Lock:**  

  Created a 4-digit digital combination lock that takes inputs from the onboard buttons on the Nexys A7. The rightmost switch, SW[0], on the board will indicate if the lock is in programming mode or password entry mode. If the switch is high and the center button is pressed the user can make 4 inputs on the up, down, right, and left buttons to set a password. After clicking the center button once and setting the switch to low the user can input the password. If the password is wrong a RGB led will turn red after 4 inputs. If the password is correct the RGB led will turn green after all inputs are made. A finite state machine is used to control the setting of the lock password and controls the process of the user inputting the password.

**Vending Machine with UART:**  

  Implemented a vending machine where the user can select a "drink" using the 3 rightmost switches on the Nexys A7 board. After clicking the center button or entering 'S' through a serial terminal like Putty, an item cost is displayed on the terminal and onboard 7-segment displays. Then the user can pay in quarters or dimes by inputting 'Q' or 'D' into the serial terminal or by clicking the left and right buttons on the FPGA board. The remaining money that needs to be paid is updated after every input and shows on the terminal and 7-segment displays. After the amount paid is met there is a 5 second delay where the change is delivered and then the user can select another drink. A finite state machine was implemented to control the vending machine process.
