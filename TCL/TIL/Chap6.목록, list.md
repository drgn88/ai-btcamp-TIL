## 목차

# 목록, List

## List
- list는 주어진 인자들을 하나의 리스트로 만듦
```tcl
list a, b, ...
```

### 사용예시

```tcl
set fruits [list apple banana cherry]
puts $fruits  # 출력: apple banana cherry

set mixed [list "Hello World" 42 3.14 {nested list}]
puts $mixed  # 출력: {Hello World} 42 3.14 {nested list}
```

<img src="./chap6_img/Screenshot from 2025-06-27 08-18-41.png"><br> 

### 특징
- 공백이나, 특수문자를 포함한 인자도 하나의 요소로 처리
- 빈 리스트를 만들 수 있음
  - ```set empty_var [list]```

## lappend
- 기존 리스트에 하나 이상의 요소를 추가
  - list
  - append: 추가하다

### 기본 문법
```tcl
lappend list명 val_1. val_2, ...
```

### 예시

```tcl
set fruits {apple banana}
lappend fruits cherry orange
puts $fruits 

set numbers {}
lappend numbers 1 2 3
puts $numbers
```

<img src="./chap6_img/Screenshot from 2025-06-27 08-24-53.png"> <br>

### 특징
- 기존 변수에 값을 추가
- 리스트에 변수가 없으면
  - 새로운 리스트 생성
- 여러 요소를 한번에 추가 가능

### Tip
- 리스트에 요소를 추가할 때, lappend 사용시
  - concat, list보다 효율적
- 루프 내에 리스트를 만들 때 효율적

## concat
- 주어진 요소들을 연결하여 하나의 리스트로 만듦

### 기본 문법
```tcl
concat val_1 val_2 ...
```

### 사용예시
```tcl
set list1 {1 2 3}
set list2 {4 5 6}
set combined [concat $list1 $list2]
puts $combined 

set result [concat "Hello" {World} [list How are you?]]
puts $result
```

<img src="./chap6_img/Screenshot from 2025-06-27 08-36-17.png"><br>

### 특징
- 리스트, 문자열, 숫자 등 다양한 타입의 인자들을 연결가능
- 리스트 인자의 가장 바깥쪽 중괄호를 제거하고 연결
- 결과는 항상 flatten된 리스트

### Tip
- 여러 리스트를 하나로 합칠 때 유용
- ```join```과 달리 구분자를 사용하지 않고 연결

### 명령어 비교
- list
  - 각 인자를 개별 요소로 취급하여 리스트 생성
- lappend
  - 기존 리스트에 요소 추가
- concat
  - 인자들을 연결하여 새로운 리스트 생성
  - flatten

### 복합 사용 예시
```tcl
# 중첩 리스트 생성 및 조작
set fruits [list apple banana]
set vegetables [list carrot potato]
set numbers [list 1 2 3]

set food_list [list $fruits $vegetables]
puts $food_list  # 출력: {apple banana} {carrot potato}

lappend food_list $numbers
puts $food_list  # 출력: {apple banana} {carrot potato} {1 2 3}

set flat_list [concat {prefix} $food_list {suffix}]
puts $flat_list  # 출력: prefix apple banana carrot potato 1 2 3 suffix
```

<img src="./chap6_img/Screenshot from 2025-06-27 08-41-58.png"><br>