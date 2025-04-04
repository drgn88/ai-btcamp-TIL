# 목차
- [B0](#B0)
- [B1](#B1)
- [B2](#B2)
- [B4](#B4)
- [B5](#B5)
- [B6](#B6)
- [B7](#B7)
- [B8](#B8)
- [B9](#B9)

# B0
## Problem
---
입력 예시와 같이 입력 시 출력 예시와 같이 인쇄가 되어야 한다
[주의] printf 사용시 출력 예시와 완전히 동일하도록 공백, ‘,’ 등의 인쇄에 주의하여야 한다
## Input Example
---
Hong Gil Dong
100
182.9
A
KOR
## Output Example
---
Hong Gil Dong, 100, 182.899994
A, KOR
# B1
## Problem
---
4자리 정수의 각 자리 값을 추출하여 a4, a3, a2, a1에 저장하라
## Output Example
---
1000자리=2, 100자리=3, 10자리=4, 1자리=5
# B2
## Problem
---
변수 p에 저장된 값을 1000원 미만을 절사하는 코드를 구현하라
## Input Example
---
123456
## Output Example
---
123000
# B4
## Problem
---
4자리 16진수 수를 입력 받아 각 자리 값을 인쇄하라
## Input Example
---
AB9D
## Output Example
---
A, B, 9, D
# B5
## Problem
---
공백으로 분리된 정수 3개를 입력 받아 합과 평균을 인쇄하라
## Input Example
---
10 20 30
## Output Example
---
60, 20.000000
# B6
## Problem
---
3~9자리 정수를 입력받아 100자리 값을 0으로 만드는 코드를 구현하라
예를들어 1234가 입력되면 100자리 2를 0으로 만들어서 1034가 되게 하시오
## Input Example
---
3~9자리 정수 입력
## Output Example
---
100자리 값을 0으로 만들어서 출력
# B7
## Problem
---
입력받은 4자리 이상 정수에서 100원 미만을 반올림 하는 코드를 구현하시오
즉, 50원 이상이면 올림처리하고 49원 이하이면 내림처리를 한다
예를들어, 1249원이면 100원 미만이 49원이므로 1200원이 된다. 4350원이면 100원 미만이 50원이므로 4400원이 된다
## Input Example
---
4자리 이상의 정수 입력
1249
## Output Example
---
100원 미만을 반올림 처리한 결과를 출력
1200
# B8
## Problem
---
프로그램을 오류가 발생하지 않도록 함수를 선언하라
## Input Example
---
```c
#include <stdio.h>

// 여기에 함수 선언


void main(void)
{
	weight(50);
}

void weight(int w)
{
	printf("Weight = %d Kg\n", w);
}
```
## Output Example
---
Weight = 50 Kg
# B9
## Problem
---
에러가 없도록 다음 함수들을 선언하라
## Input Example
---
```c
#include <stdio.h>

// 사용할 함수들의 선언

void main(void)
{
	printf("sqr=%d\n", sqr(3));
	printf("area=%d\n", area(3, 5));
	printf("arc=%f\n", compute_circle_arc(4.1f));
}

int sqr(int x)
{
	return x * x;
}

int area(int x, int y)
{
	return x * y;
}

float compute_circle_arc(float radious)
{ 
	float pi = 3.141592f;

	radious = 2 * radious * pi;
	return radious;
}
```
## Output Example
---
sqr=9
area=15
arc=25.761053
