# 문자열

## 1. string

- string 명령어는 문자열에 대한 서브 커맨드를 제공

## 주요 string 서브커맨드

- length
  - 문자열 길이 반환
- index
  - 특정 인덱스 문자 반환
- range
  - 특정 범위의 부분 문자열 반환
- tolower/toupper
  - 소문자/대문자 반환
- trim/trimleft/trimright
  - 공백 또는 지정 문자 제거
- map
  - 문자 매핑
- replace
  - 부분 문자열 대체
- match
  - 글로벌 패턴 매칭

```tcl
# 에시
set str "Hello, World!"

puts [string length $str]
# str의 문자 길이가 나온다
# C언어와 달리 숨겨진 널문자는 길이로 안침

puts [string index $str 7]
#str 문자열의 8번째 문자 --> W

puts [string range $str 0 4]
# str문자열의 0번 인덱스부터 4번 인덱스: Hello

puts  [string tolower $str]
# 문자열의 모두 소문자로 바꿈: hello, world!

puts  [string trim " abc "]
# 문자열 abc의 앞뒤 공백을 지워줌

puts  [string map {o 0 l 1} $str]
# 문자열에서 o --> 0, ㅣ --> 1로 바꿔줌
# He110 W0r1d!

puts [string replace $str 0 4 "Hi"]
# 기존 문자열의 0번부터 4번을 Hi로 바꿈
# Hi, World!

puts [string match "H*d!" $str]
# H로 시작하고 d!로 끝나는 문자열을 찾음
# 1반환(True)
```

## regexp

- 정규표현식을 사용해 **패턴 매칭** 수행

### 구문

```tcl
regexp option pattern string 매치변수 서브매치1 서브매치2 ...
```

### 주요 옵션

- ```-nocase```: 대소문자 구분없이 매칭

```tcl
#예시

set str "The quick brown fox"

if {[regexp {(\w+)\s+(\w+)} $str -> first second]} {
    puts "First word: $first, Second word: $second"
}

regexp -nocase {fox} $str match
puts $match  # fox

regexp {(\d+)} "Age: 30" -> age
puts $age  # 30
```

```tcl
#결과
First word: The, Second word: quick
wrong # args: should be "puts ?-nonewline? ?channelId? string"
```

## regsub

- 정규 표현식을 사용하여 문자열 내 **패턴을 대체**

### 구문
```tcl
regsub option pattern string 대체문자열 결과저장변수
```

### 주요 옵션
- -```all```: 모든 매치를 대체
- ```-nocase```: 대소문자 구분없이 대체

```tcl
#예시
set str "The quick brown fox jumps over the lazy dog"

regsub {(\w+) (\w+)} $str {\2 \1} result
puts $result  # quick The brown fox jumps over the lazy dog

regsub -all {\w+} $str {[\0]} result
puts $result  # [The] [quick] [brown] [fox] [jumps] [over] [the] [lazy] [dog]

regsub -nocase -all {o} $str "0" result
puts $result  # The quick br0wn f0x jumps 0ver the lazy d0g
```

## 정규 표현식

- ```.```: 임의의 한 문자
- ```^```: 행의 시작
- ```$```: 행의 끝
- ```*```: 앞규칙 0회 이상 반복
- ```\d```: 숫자
- ```\w```: 단어 문자
- ```\s```: 공백 문자