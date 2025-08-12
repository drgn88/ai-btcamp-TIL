# Dedciated Processor
> 범용 목적이 아닌 특정 목적만 수행하는 Processor

## 설계 Flow

1. C언어로 먼저 설계해보기
	- C언어 line by line == CPU의 동작 하나
2. Data path 구조 설계
3. C언어의 순서를 ASM Chart로 만듦
	- 이를 Control Unit으로 만듦
4. Data Path + Control Unit

# Assignment

> 0~10까지 누적 덧셈하는 Dedicated Processor

## 1️⃣C언어로 설계
```c
#include <stdio.h>

int main()
{
	int a;
	int acc_sum;
	int output;
	
	a = 0;
	acc_sum = 0;
	output = 0;

	while (a <= 10) {
		acc_sum = acc_sum + a;
		output = acc_sum;
		a = a + 1;
	}

	printf("acc_sum = %d\n", output);

	halt;
}
```

- 이제 이 C코드를 ```line by line```으로 HW 설계

## 2️⃣Data Path 설계

- 변수: Register
  - a, acc_sum --> 2개의 Register
- a <= 10
  - 비교기
- x+y
  - 가산기

Data Path Block Diagram
---
<img src="./img/스크린샷 2025-08-11 193254.png"><br>


## 3️⃣Control Unit 설계

### ASM Chart

<img src="./img/스크린샷 2025-08-11 193344.png" width=70%><br>

### S0
```c
	int a;
	int acc_sum;
	int output;
	
	a = 0;
	acc_sum = 0;
	output = 0;
```
- 초기값 정의
- A_Mux_Sel
  - 0일 때 0 입력으로 들어감
- A_En
  - Enable하여 초기값 0 할당
  - ```A_Reg_Out = 0```
- Acc_Mux_Sel
  - 0일 때 0 입력으로 들어감
- Acc_En
  - Enable하여 초기값 0 할당
  - ```Acc_Reg_Out = 0```
- Out_Buf_En
  - 아직 출력 내보내는 타이밍 아님 --> 0

### S1

```c
	while (a <= 10)
```
- A_Mux_Sel
  - A_En을 0으로 만들어서 상관없음
- A_En
  - Register 기존 값 유지
    - a의 값이 중간에 바뀌면 안됨
    - a <= 10 정상 비교 불가
  - A_En Disable
- Acc_Mux_Sel
  - Acc_En Disable 상태이므로 상관없음
- Acc_En
  - Disable
  - 기존 값 유지
- Out_Buf_En
  - 아직 출력 내보내는 타이밍 아님 --> 0

#### a <= 10

참)
- S2로 넘어가 누적합 진행

거짓)
- S5로 넘어가 halt 상태 진입

### S2
```c
	acc_sum = acc_sum + a;
```

- A_Mux_Sel
  - A_En Disable 상태이므로 상관없음
- A_En
  - Disable
  - 누적합 연산은 현재 값과 진행
  - 값이 바뀌면 안됨
- Acc_Mux_Sel
  - 누적합의 결과를 변수에 반영
  - sel == 1
- Acc_En
  - 누적합의 결과를 반영함
  - Enable
- Out_Buf_En
  - 아직 출력 내보내는 타이밍 아님 --> 0

### S3
```c
	output = acc_sum;
```

- A_Mux_Sel
  - A_En Disable 상태이므로 상관없음
- A_En
  - Disable
  - 출력이 나가는 동안 값이 바뀌면 안됨
- Acc_Mux_Sel
  - Acc_En Disable
- Acc_En
  - 출력이 나가는 동안 값이 바뀌면 안됨
- Out_Buf_En
  - 출력 내보내는 타이밍 --> 1

### S4
```c
	a = a + 1;
```

- A_Mux_Sel
  - Update된 a 값 반영
- A_En
  - Enable
  - Update된 a의 값을 반영해야함
- Acc_Mux_Sel
  - Acc_En Disable
- Acc_En
  - Disable
  - 기존 값 유지해야함
- Out_Buf_En
  - 아직 출력 내보내는 타이밍 아님 --> 0

### S5
```c
	halt;
```
- A_Mux_Sel
  - En Disable
- A_En
  - Disable
  - 연산 중단
- Acc_Mux_Sel
  - Acc_En Disable
- Acc_En
  - Disable
  - 연산 중단
- Out_Buf_En
  - 연산 중단
  
# 헷갈렸던 부분❓

## 언제 Register Enable을 하는가

- C언어에서 Left Value에 값을 할당받는 것을 Register Enable을 한다
```c
  a = b + c;
```
- a의 값이 업데이트되니 이 때 Reg A를 Enable한다