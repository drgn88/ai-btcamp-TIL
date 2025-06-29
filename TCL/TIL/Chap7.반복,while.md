## 목차

# 반복문, while

## for
- 정해진 횟수만큼 코드 블록을 반복 실행

### 기본 문법
```tcl
for {시작코드} {조건} {증감} {
    #반복실행할 코드
}
```
> 증감으로는 incr, decr을 사용

### 예시
```tcl
for {set i 0} {$i < 5} {incr i}{
    puts "Iteration $i"
}
```
<img src="./chap7_img/Screenshot from 2025-06-30 08-07-12.png"> <br>

```c
    for(i = 0; i < 5; i++) {
        printf("Itertaion\n");
    }
```
- 위의 C언어 동작과 동일하다

### 주의사항
- 초기화, 증감, 조건은 중괄호 안에 작성
- 조건이 false가 되면 루프 종료
- 무한 반복의 경우
  - 강제 종료 전까지 계속 실행

## foreach
- list의 각 요소에 대해 코드 블록을 반복 실행
- tcl에서 **가장 많이 사용**하는 반복문❗❗

### 기본 문법
```tcl
    foreach 변수_리스트{
        #반복 실행할 코드
    }
```

### 예시
```tcl
    set fruit_list {apple banana orange}
    foreach fruit $fruit_list{
        puts "I like $fruit"
    }
```

<img src="./chap7_img/Screenshot from 2025-06-30 08-12-38.png"><br>

### 고급 사용
```tcl
 set data {John 25 Mary 30 Tom 22}
 foreach {name age} $data [
    puts "$name is $age years old"
 ]
```

```tcl
set data1_list {a b c}
set data2_list {1 2 3}
foreach data1 $data1_list data2 $data2_list {
    puts "$data1 $data2"
}
```


### 주의사항
- 리스트의 요소 수가 변수의 수로 나눠 떨어지지 않으면 마지막 반복에서 일부 변수가 빈 문자열로 설정될 수 있음

## while
- 주어진 조건이 참인동안 코드블록 반복 실행

### 기본 구문
```tcl
while {조건}{
    #반복 실행할 코드
}
```

### 사용 예시
```tcl
set count 0
while {$count < 5} {
    puts "Count: $count"
    incr count
}
```
<img src="./chap7_img/Screenshot from 2025-06-30 08-20-20.png"><br>

### 주의 사항
- 무한 루프를 피하기 위해 루프 내 조건을 변경하는 코드 필요

## Loop 제어 명령어

- break: 현재 반복문 종료
- continue: 현재 반복문 종료 후, 조건으로 이동

## 어떤 루프를 선택해야할까?
- for: 정해진 횟수만큼 반복
- foreach: 리스트나 배열의 모든 요소를 처리할 때
- while: 조건이 참인동안 반복해야할 때

## Tip
- 성능이 중요한 경우 foreach 사용하기
  - TCL에서 foreach가 일반적으로 가장 빠른 루프 구조
- 반복문은 시간복잡도를 늘림
  - 되도록 다중루프문은 피하기
- 큰 리스트 처리시 메모리 사용 주의
  - 필요시 리스트를 청크 단위로 나누어 처리
- 루프 내에서 리스트 수정시 주의
  - 특히, foreach 루프 안에서 현재 처리 중인 리스트 수정 시 문제 발생 가능성