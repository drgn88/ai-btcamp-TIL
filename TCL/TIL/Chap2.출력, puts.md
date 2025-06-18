## 목차
- [puts 명령](#puts-명령)
	- [puts 명령](#puts-명령-1)
	- [puts 특징](#puts-특징)
	- [사용 예시](#사용-예시)
		- [1. Hello World 출력](#1-hello-world-출력)
		- [2. 변수 값 출력](#2-변수-값-출력)
		- [3. 띄어쓰기 포함된 문자열](#3-띄어쓰기-포함된-문자열)
	- [옵션 및 고급 기능](#옵션-및-고급-기능)
		- [-nonewline](#-nonewline)
		- [채널 지정](#채널-지정)
- [Backslash Sequences()](#backslash-sequences)
	- [용도](#용도)
	- [사용 예시](#사용-예시-1)
		- [결과](#결과)
	- [주의 사항](#주의-사항)
- [Tip](#tip)
	- [1. 디버깅용 출력](#1-디버깅용-출력)
	- [2. 형식화된 출력](#2-형식화된-출력)
	- [3. 에러 메시지: stderr 채널 사용](#3-에러-메시지-stderr-채널-사용)
	- [4. Backslash Sequence 활용: 복잡한 문자열 구성 시 유용](#4-backslash-sequence-활용-복잡한-문자열-구성-시-유용)

# puts 명령

## puts 명령
- TCL에 텍스트를 출력하는 기본 명령어
```tcl
	puts 옵션 문자열
```

## puts 특징
- 콘솔 혹은 파일에 텍스트를 출력
- 개행(\n)이 자동 추가
- 변수 값이나 연산 결과 등 여러 형태의 출력 지원

## 사용 예시

### 1. Hello World 출력
![alt text](./chap2_img/스크린샷%202025-06-18%20085109.png)<br>

### 2. 변수 값 출력
![example2](./chap2_img/스크린샷%202025-06-18%20085435.png)<br>

### 3. 띄어쓰기 포함된 문자열
![example3](./chap2_img/스크린샷%202025-06-18%20085835.png)<br>

## 옵션 및 고급 기능

### -nonewline
- 줄바꿈없이 출력
- puts는 기본적으로 \n(개행)이 포함됨

```tcl
puts -nonewline "Enter your name: "
puts "DRGN"
```

[결과]

![func_1](./chap2_img/스크린샷%202025-06-18%20090238.png)<br>

### 채널 지정
- 출력 대상을 지정할 수 있다
- ex) 특정 텍스트 파일에 출력을 저장할 수 있다

```tcl
	set file [open "output.txt" w]
	puts $file "DRGN"
	close $file
```

[결과]

![source file](./chap2_img/스크린샷%202025-06-18%20090646.png)<br>

![make file](./chap2_img/스크린샷%202025-06-18%20090755.png)<br>
- source 실행 결과 output file이 생성되었다

![output txt](./chap2_img/스크린샷%202025-06-18%20090838.png)<br>
- puts로 넣어준 DRGN이 txt 파일에 입력되었다
- puts는 개행도 포함이므로 2번쨰줄까지 입력된 것을 확인가능

# Backslash Sequences(\)

## 용도
- 특수 문자나 제어문자를 표현하는데 사용
- 주로 큰따롬표로 묶인 문자열 내에서 사용

## 사용 예시

```tcl
	puts "Hello\nWorld"				#줄바꿈
	puts "Tab\tSeparated\tValues"	#탭으로 구분
	puts "Quotes: \"Example\""		#큰따옴표 출력
	puts "Path: C:\\Program_Files"	#백슬래시 출력
	puts "Unicode: \u03B1\u03B2\u03B3" # 그리스문자 알파, 베타, 감마
	puts "Octal: \141\142\143"		#a, b, c(8진수 ASCII)
	puts "HEX: \x61\x62\x63"		#a, b, c(16진수 ASCII)
```

### 결과
![result](./chap2_img/스크린샷%202025-06-18%20123737.png)<br>

## 주의 사항
- 중괄호로 묶인 문자열에서는 \(backslash sequence)를 처리하지 못함
  - 중괄호 안에서는 \를 단순 문자로 판단함
- 변수 치환과 Backslash Sequence를 같이 사용할 때는 주의가 필요하다
```tcl
set name "Chase"
puts "Hello, $name\nWelcome!"  # 변수 치환과 줄바꿈 함께 사용
```

# Tip

## 1. 디버깅용 출력
```tcl
# Example
puts "Debug: value of x is $x"
```
- 변수 값 혹은 프로그램 상태 확인할 때 유용함

## 2. 형식화된 출력
```tcl
# Example
puts [format "Pi: %.2f" 3.14159]
```
![format](./chap2_img/스크린샷%202025-06-18%20124330.png)<br>
- format 명령어와 함께 사용
  - format 명령어는 printf함수와 유사하게 동작

## 3. 에러 메시지: stderr 채널 사용
```tcl
#Example
puts stderr "Error: File not found"
```

- stderr
  - Standart Error Channel
  - OS가 모든 프로그램에 제공하는 표준 채널
  - 진단 및 오류 메시지를 출력하는 역할을 함

## 4. Backslash Sequence 활용: 복잡한 문자열 구성 시 유용
```tcl
#Example
puts "Menu:\n1. Open\n2. Save\n3. Exit"
```

![result](./chap2_img/스크린샷%202025-06-18%20124856.png)<br>

