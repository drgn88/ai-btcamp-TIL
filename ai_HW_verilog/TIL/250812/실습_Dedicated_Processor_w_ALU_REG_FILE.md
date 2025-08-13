# Dedicated Processor With Register File & ALU

## Register File📂

- 설계하는 Dedicated Processor의 변수가 많아지면 어떡할까?🧐
- Register가 무한정으로 증가할까?
- Register의 개수가 증가할수록 제어신호 증가
  - 회로가 점점 복잡해짐❗
  - 전력 소모 심해짐❗

## Solution: Register File👍

<img src="./img/스크린샷 2025-08-13 083006.png"><br>

- RISC Processor에는 Register들을 효율적으로 관리하기위해 **Register File**을 포함한다
- 따로 관리하던 Register들을 하나로 모아 관리
- **RAM**으로 관리

## Register File 특징

- R0(0번 Register)는 0으로 고정
- 주소(addr)로 접근
- Reset은 따로 주지 않는다

### Code

```verilog
module register_file (
    input logic clk,
    input logic [2:0] r_addr_1,
    input logic [2:0] r_addr_2,
    input logic [2:0] wr_addr,
    input logic wr_en,
    input logic [7:0] wr_data,

    output logic [7:0] r_data_1,
    output logic [7:0] r_data_2
);

    logic [7:0] mem[0:(2**3-1)];  //2^addr - 1

    always_ff @(posedge clk) begin
        if (wr_en) begin
            mem[wr_addr] <= wr_data;
        end
    end

    assign r_data_1 = (r_addr_1 == 0) ? 0 : mem[r_addr_1];
    assign r_data_2 = (r_addr_2 == 0) ? 0 : mem[r_addr_2];

endmodule
```

# Register File 실습: 0~10 Accumulate Sum Dedicated Processor

## C언어 설계(Or Assembly)

```c
R1 = 0;		//Accumulate Sum
R2 = 0;		//0~10
R3 = 1;		//R2 1씩 증가시키위한 Register

while(R1 <= 10){
	R2 = R2 + R1;
	R1 = R1 + R3;
	OutPort = R2;
}

halt;
```

## Data Path 설계

<img src="./img/스크린샷 2025-08-13 085042.png"><br>

- Register: R1,R2,R3
  - Register File: R1~R3
    - R0: 0으로 Fix
- R1 <= 10
  - Comparator
- 덧셈 연산
  - Adder
- OutPort
  - OutPort Register
- Register Update Value 선택
  - R3 = 1에 의해 MUX 사용

## Control Unit 설계 - ASM Chart

### Control Signal Table📆

| **Instruction**  | **RFSrcMuxSel** | **r_addr_1** | **r_addr_2** | **wr_addr** | **wr_en** | **OutEn** |
| :--------------: | :-------------: | :----------: | :----------: | :---------: | :-------: | :-------: |
|    R1=0<br>S0    |        0        |      0       |      0       |      1      |     1     |     0     |
|    R2=0<br>S1    |        0        |      0       |      0       |      2      |     1     |     0     |
|    R3=1<br>S2    |        1        |      X       |      X       |      3      |     1     |     0     |
|   R1<=10<br>S3   |        X        |      1       |      X       |      X      |     0     |     0     |
|  R2=R2+R1<br>S4  |        0        |      1       |      2       |      2      |     1     |     0     |
|  R1=R1+R3<br>S5  |        0        |      1       |      3       |      1      |     1     |     0     |
| OutPort=R2<br>S6 |        X        |      2       |      X       |      X      |     0     |     1     |
|    halt<br>S7    |        X        |      X       |      X       |      X      |     0     |     0     |

> ASM Chart는 위 표를 그대로 Chart로 옮기면 된다

## Verilog Design

> 해당 디렉토리를 참고하면 된다 [Dedicated Processor With Register File](../../Assignment/250812_과제/과제1_Reg_file/)

