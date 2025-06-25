## 목차
- [if문](#if문)
  - [문법](#문법)
  - [예시](#예시)
  - [주의사항⚠️](#주의사항️)
- [switch 문](#switch-문)
  - [문법](#문법-1)
  - [예시](#예시-1)
  - [switch option](#switch-option)
    - [사용 예시](#사용-예시)
- [if Vs switch](#if-vs-switch)
- [TIP](#tip)
  - [if문과 expr명령](#if문과-expr명령)
  - [switch문과 fall-through](#switch문과-fall-through)
  - [if Vs switch: 가독성](#if-vs-switch-가독성)

# if문

## 문법
```tcl
if {condition1} {
    
} elseif (condition2) {

} else {condition3} {

}
```

## 예시
```tcl
set x 10
if {$x > 0} {
    puts "x is positive"
} elseif {$x < 0} {
    puts "x is negative"
} else {
    puts "x is Zero"
}
```

## 주의사항⚠️
- 조건문과 괄호 사이에 **space**가 있어야함
- {} 중괄호 사이에도 Space가 있어야함
- elseif와 else는 선택사항
- 조건에 주로 사용하는 식
  - 비교연산자
  - expr명령

# switch 문

## 문법
```tcl
switch [option] 문자열 {
    case1 {code1}
    case2 {code2}
    ...
    default {default code}
}
```

## 예시
```tcl
set fruit "apple"
switch $fruit {
    "apple" {puts "It's an apple"}
    "banana" {puts "It's an banana"}
    "orange" {puts "It's an orange"}
    default {puts "Not fruit"}
}
```

## switch option
- -exact
  - 정확한 문자열 비교
- -glob
  - glob형태로 문자열 조건 비교
  - wildcard(*) 패턴을 매칭함
- -regexp
  - Regular expression 형태로 문자열 조건 비교
  - 문자열 패턴을 찾을 때 유용

### 사용 예시
```tcl
# -glob option
switch -glob $filename {
    *.txt {puts "Text file"}
    *.jpg {puts "JPG file"}
    *.* {puts "File w extension"}
    default {puts "Not file"}
}

# -regexp option
switch -regexp $input {
    {^[0-9]+$} {puts "Number"}
    {^[a-zA-Z]+$} {puts "Word"}
    default {puts "Other"}
}
```

# if Vs switch
- if: 복잡한 조건 혹은 범위 비교 적합
- switch: 단일 변수 혹은 표현식의 여러 가능 값 비교할 때 좋음
  - 코드 가독성이 좋음

# TIP

## if문과 expr명령
- if문에서 복잡한 조건은 ```expr```명령을 통해 평가 가능
  - ```expr```은 수식에서 사용됨(비교 등)
```tcl
    if {[expr {$x > 0 && $y < 10}]} {
    puts "Condition met"
}
```

## switch문과 fall-through
- switch문에서 여러 패턴에 대해 같은 코드를 실행하려면 fall-through 사용

```tcl
switch $day {
    "Monday" -
    "Tuesday" -
    "Wednesday" -
    "Thursday" -
    "Friday" {puts "Weekday"}
    "Saturday" -
    "Sunday" {puts "Weekend"}
    default {puts "Invalid day"}
}
```

## if Vs switch: 가독성
- if-else의 조건이 길어지면
- 가독성을 위해 switch문 고려하기