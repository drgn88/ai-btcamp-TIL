## 목차

# 수식, math

## 표현식
```tcl
    expr 수식
```
- ```expr``` 을 통해 수식을 판단

## 기본연산자
- ```+```
- ```-```
- ```*```
- ```/```
- ```%```
- ```**``` --> 거듭제곱 연산도 존재

### 예시
```tcl
puts [expr {5 + 3}]
puts [expr {10 - 4}]
puts [expr {4 * 5}]
puts [expr {32 / 5}]
puts [expr {15 % 8}]
puts [expr {8 ** 3}]
```

#### 결과
<img src="./chap4_img/Screenshot from 2025-06-24 08-38-36.png"> <br>

## 비교연산자
- ```==```
- ```!=```
- ```>```
- ```<```
- ```>=```
- ```<=```

### 예시
```tcl
puts [expr {5 == 5}]    
puts [expr {5 != 4}]   
puts [expr {6 > 4}] 
puts [expr {3 < 2}]
```

#### 결과
<img src="./chap4_img/Screenshot from 2025-06-24 08-43-38.png"> <br>

## 논리연산자
- ```&&```
- ```||```
- ```!```

### 예시
```tcl
puts [expr {(5 > 3) && (2 < 4)}]  # 출력: 1 (참)
puts [expr {(5 < 3) || (2 < 4)}]  # 출력: 1 (참)
puts [expr {!(5 < 3)}]            # 출력: 1 (참)
```

#### 결과
<img src="./chap4_img/Screenshot from 2025-06-24 08-47-51.png"><br>

## Bitwise 연산자
- ```&```
- ```|```
- ```^```
- ```~```
- ```<<```
- ```>>```
> left shift하면 bit확장됨

### 예시
```tcl
puts [expr {5 & 3}]     # 출력: 1
puts [expr {5 | 3}]     # 출력: 7
puts [expr {5 ^ 3}]     # 출력: 6
puts [expr {~5}]        # 출력: -6
puts [expr {1 << 3}]    # 출력: 8
puts [expr {8 >> 1}]    # 출력: 4
```

#### 결과
<img src="./chap4_img/Screenshot from 2025-06-24 08-50-57.png"> <br>

## math function
- 절대값: abs(x)
- 제곱근: sqrt(x)
- 지수: exp(x)
- 로그: log(x), log10(x)
- 삼각함수: sin(x), cos(x), tan(x)
- 반올림: round(x)
- 최대/최소: min(x,y), max(x,y)

### 예시
```tcl
puts [expr {abs(-5)}]        # 출력: 5
puts [expr {sqrt(16)}]       # 출력: 4.0
puts [expr {round(3.7)}]     # 출력: 4
puts [expr {max(5, 10)}]     # 출력: 10
```

#### 결과
<img src="./chap4_img/Screenshot from 2025-06-24 08-54-28.png"> <br>

## 변수 사용

### 예시
```tcl
set x 5
set y 3
puts [expr {$x + $y}]  # 출력: 8
```

#### 결과
<img src="./chap4_img/Screenshot from 2025-06-24 08-56-51.png"><br>

## 주의사항 ⚠️
- 부동소수점 정밀도 주의
- 0 나누기 오류 주의
- 수식은 괄호 우선순위

## 우선순위
<img src="./chap4_img/Screenshot from 2025-06-24 08-58-19.png"><br>

> 맘편하게 괄호 사용하자

