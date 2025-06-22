# AI시스템 반도체 설계
대한상공회의소에서 진행하는 AI시스템반도체설계 부트캠프 공부 내용 기록입니다

# 📖목차
- [AI시스템 반도체 설계](#ai시스템-반도체-설계)
- [📖목차](#목차)
	- [🖋️시스템 프로그래밍](#️시스템-프로그래밍)
		- [C언어 기본](#c언어-기본)
		- [과제](#과제)
	- [🖋️ARM 디바이스 프로그래밍](#️arm-디바이스-프로그래밍)
		- [디바이스 이론](#디바이스-이론)
		- [Assignment](#assignment)
		- [프로젝트](#프로젝트)
	- [🖋️Verilog](#️verilog)
		- [이론](#이론)
		- [Assignment](#assignment-1)
		- [Project](#project)
		- [어려웠던 점](#어려웠던-점)
	- [🖋️System Verilog](#️system-verilog)
		- [이론](#이론-1)
		- [Assignment](#assignment-2)
	- [🖋️Custom Compiler (Synopsys)](#️custom-compiler-synopsys)
		- [이론](#이론-2)
		- [Assignment](#assignment-3)
	- [📘개인공부](#개인공부)
		- [👨‍💻TCL](#tcl)



## 🖋️시스템 프로그래밍
### C언어 기본
- [1. 표준입출력1](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/1.%ED%91%9C%EC%A4%80%EC%9E%85%EC%B6%9C%EB%A0%A51.md)
- [2. 표준입출력2](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/2.%ED%91%9C%EC%A4%80%EC%9E%85%EC%B6%9C%EB%A0%A52.md)
- [3. C 연산자](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/3.%EC%97%B0%EC%82%B0%EC%9E%90.md)
- [4.함수와 헤더파일](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/4.%ED%95%A8%EC%88%98%EC%99%80%20%ED%97%A4%EB%8D%94%ED%8C%8C%EC%9D%BC.md)
- [5.조건문](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/5.%EC%A1%B0%EA%B1%B4%EB%AC%B8(if%2C%20switch-case).md)
- [6.반복문](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/6.%EB%B0%98%EB%B3%B5%EB%AC%B8(for%2C%20while).md)
- [7.배열](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/7.%EB%B0%B0%EC%97%B4.md)
- [8.이차원 배열](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/8.%EC%9D%B4%EC%B0%A8%EC%9B%90%EB%B0%B0%EC%97%B4.md#%EC%9D%B4%EC%B0%A8%EC%9B%90-%EB%B0%B0%EC%97%B4%EC%9D%98-%EA%B5%AC%EC%A1%B0)
- [9.유도형 타입: 구조체와 공용체](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/9.%EC%9C%A0%EB%8F%84%ED%98%95%20%ED%83%80%EC%9E%85.md)

### [과제](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C)
- [1.PartA](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartA)
- [2.PartB](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartB)
- [3.PartC](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartC)
- [4.PartD](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartD/solve_D.c)
- [5.PartE](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartE)
- [6.C_lang_test](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/C_level_test/c_lang_test.c)

## 🖋️ARM 디바이스 프로그래밍
> stm ide를 통한 편리한 사용보다는 반도체 설계자 관점에서 배우기(무에서 유를 내가 직접 만드는 과정)
### 디바이스 이론
- [1. 기본 컴퓨터 구조](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/1.%EA%B8%B0%EB%B3%B8_%EC%BB%B4%ED%93%A8%ED%84%B0%EA%B5%AC%EC%A1%B0.md)
- [2. ⭐⭐⭐ARM 메모리와 Bus decoding](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/2.ARM%20%EB%A9%94%EB%AA%A8%EB%A6%AC%EC%99%80%20Bus%20decoding.md#1-%EB%B0%98%EB%8F%84%EC%B2%B4-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EB%B6%84%EC%84%9D)
- [3. GPIO 출력: 이론](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/3.GPIO%EC%B6%9C%EB%A0%A5_%EC%9D%B4%EB%A1%A0.md)
- [4. GPIO 출력 실습: LED 제어](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/4.GPIO_PORT_LED.md)
- [5. ⭐Type Qualifer(제한자)](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/5.Type_Qualifier.md)
- [6. CMSIS-Register 정의](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/6.CMSIS.md)
- [7. ⭐⭐⭐Bit 연산과 Macro활용](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/7.%EB%B9%84%ED%8A%B8%EC%97%B0%EC%82%B0%EA%B3%BC%20%EB%A7%A4%ED%81%AC%EB%A1%9C%ED%99%9C%EC%9A%A9.md)
- [8. ⭐System Clock](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/8.System%20clk.md)

### [Assignment](https://github.com/drgn88/ai-btcamp-TIL/tree/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EC%8B%A4%EC%8A%B5)
- 1.LED 과제1
- 2.LED 과제2
- 3.kEY 과제 1
- 4.kEY 과제 2
- 5.UART: 숫자 받기 과제1

### 프로젝트
- [ARM m3 Board를 이용한 게임 개발](https://github.com/drgn88/Arm_device_Mini_Prj/tree/main)

## 🖋️Verilog
### 이론
- [1.Verilog & Vivado Overview](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/1.Vivado_Overview.md)
- [2. VSCODE setting & LUT](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/2.%20VSCODE%20setting%20%26%20LUT.md)
- [3.Counter & Clk Divider](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/3.Counter%20%26%20Clk%20Divider.md)
- [4. Verilog 자료형 및 FPGA 이론](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/4.Verilog_%EC%9E%90%EB%A3%8C%ED%98%95%20%EB%B0%8F%20FPGA%20%EC%9D%B4%EB%A1%A0.md)
- [5. ⭐Gate 수준 Modeling/ D F/F / CDC](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/5.Gate%EC%88%98%EC%A4%80%EB%AA%A8%EB%8D%B8%EB%A7%81_DFF_Delay_CDC.md)
- [6. 행위수준 Modeling/ ⭐FSM](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/6.Behavioral_FSM.md)
- [7. 구조적 모델링과 Task, Macro](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/7.%EA%B5%AC%EC%A1%B0%EC%A0%81%20%EB%AA%A8%EB%8D%B8%EB%A7%81%EA%B3%BC%20Task%2C%20Macro.md)
- [8. Combination Logic & Sequential Logic](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/8.%20Combination%20Logic%20%26%20Sequential%20Logic.md)
- [9. UART 이론 및 설계](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/9.%20UART%20%EC%9D%B4%EB%A1%A0%20%EB%B0%8F%20%EC%84%A4%EA%B3%84.md)
- [10. 메모리 이론과 설계(w FPGA BRAM)](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Verilog/10.%20%EB%A9%94%EB%AA%A8%EB%A6%AC%20%EC%9D%B4%EB%A1%A0%EA%B3%BC%20%EC%84%A4%EA%B3%84(w%20FPGA%20BRAM).md)
### Assignment
- [1. 4bit_adder](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/adder_4b)
- [2. 8b_adder_with_FND](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/adder_w_FND.srcs)
- [3. 10000진 카운터](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/counter_10000)
- [4. 분초 타이머와 틱 생성기](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/min_sec_timer_w_tick_gen)
- [5. Non-overlapping 1010 using FSM](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/non_overlapping_1010)
- [6. Blink FND Watch Timer](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/blink_watch_timer)
- [7. Btn Debouncer](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/Debouncer)
- [8. UART TX](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/UART_TX)
- [9. UART TX + RX](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/UART_TX_RX)
- [10. FIFO Using RAM(w BRAM)](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/FIFO_using_ram)
- [11. UART FIFO](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/UART_FIFO)
- [12. UART ASCII Sender](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/Sender_uart)
- [13. SR04 초음파 센서 제어](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/SR04_sonic_sensor)
- [14. DHT11 온습도 센서 제어](https://github.com/drgn88/ai-btcamp-TIL/tree/main/Verilog/Project/DHT11_humid_temp_sensor)

### Project
- [개인 프로젝트: Stop Watch & Watch Using Basys3](https://github.com/drgn88/stop_watch_watch_basys3)
- [팀 프로젝트: UART와 FPGA를 이용한 시계-센서 제어(w Basys 3)](https://github.com/drgn88/uart_sensor_stop_watch)
- [개인 프로젝트: PWM을 이용한 전자레인지 구현(w Basys3)](https://github.com/drgn88/Basys3_microwave_pwm)

### 어려웠던 점

## 🖋️System Verilog
### 이론
- [1.VCS Verdi 기초 및 Blocking Vs Non-Blocking](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/250604.md)
- [2.Delta Delay & System Verilog Basic](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/250605.md)
- [3.SV: 4-type Array & Subroutine(w fork-join)](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/260609.md)
- [4. Class & Randomization](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/260610.md)
- [5. Class Inheritance & Thread 통신 & Coverage](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/250611.md)
- [6. How to Use VCS](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/250612.md)
- [7. Verdi & Gate Level Simulation](https://github.com/drgn88/ai-btcamp-TIL/blob/main/System_Verilog/TIL/250613.md)

### Assignment
- [SV TB Format w Shift_reg](https://github.com/drgn88/ai-btcamp-TIL/tree/main/System_Verilog/%EC%8B%A4%EC%8A%B5/250604)
- [enum & string](https://github.com/drgn88/ai-btcamp-TIL/tree/main/System_Verilog/%EC%8B%A4%EC%8A%B5/250605)
- [⭐4-type Array & Fork-join](https://github.com/drgn88/ai-btcamp-TIL/tree/main/System_Verilog/%EC%8B%A4%EC%8A%B5/250609/ARRAY)
- [Class & Randomization](https://github.com/drgn88/ai-btcamp-TIL/tree/main/System_Verilog/%EC%8B%A4%EC%8A%B5/250610)
- [Extended Class/ DPI-C / Semaphore](https://github.com/drgn88/ai-btcamp-TIL/tree/main/System_Verilog/%EC%8B%A4%EC%8A%B5/250611)
- [VCS & Verdi-Gate level Simulation]

## 🖋️Custom Compiler (Synopsys)
### 이론
- [1. CMOS Design/ Custom Compiler 기본 사용법: Inverter](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Custom_Compiler/TIL/250616.md)
- [2. CMOS Layout & Stick Diagram/ Custom Compiler PrimeSim: Inverter](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Custom_Compiler/TIL/250617.md)
- [3. MOSFET 동작영역 & Beta ratio/ 2NAND Simulation](https://github.com/drgn88/ai-btcamp-TIL/blob/main/Custom_Compiler/TIL/250618.md)
### Assignment


## 📘개인공부

### 👨‍💻TCL
- [Chapter1. 변수와 set 명령어](https://github.com/drgn88/ai-btcamp-TIL/blob/main/TCL/TIL/Chap1.%EB%B3%80%EC%88%98%26set.md)
- [Chapter2. put 명령어와 출력](https://github.com/drgn88/ai-btcamp-TIL/blob/main/TCL/TIL/Chap2.%EC%B6%9C%EB%A0%A5%2C%20puts.md)