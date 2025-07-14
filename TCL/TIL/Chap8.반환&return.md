## 목차

# 1. break

- 현재 loop나 switch문을 즉시 종료함

> 예시
```tcl
for {set i 0} {$i < 10} {incr i} {
	if {$i == 5} {
		break
	}
	puts $i
}

puts "Loop ended"
```

> 결과

```tcl
0
1
2
3
4
Loop ended
```

## 주의사항⚠️

- 가장 안쪽의 루프만 종료
- 중첩된 모든 루프를 탈출하는 것이 아님

# 2. continue

- 현재 루프를 종료하고, 다음 반복을 위한 조건 비교로 넘어감

> 예시

```tcl
for {set i 0} {$i < 5} {incr i} {
	if {$i == 2} {
		continue
	}
	puts $i
}
```

> 결과

```tcl
0
1
3
4
```

## 주의사항⚠️

- while문에서 사용 시, 증감식이 수행안 될 수 있음
- 조건을 위한 증감식 수행 전에 continue가 들어있는 경우

# 3. catch

- catch는 명령 실행 중 발생하는 오류를 잡아냄(catch)

```tcl
catch {script} {result} {option}
```

> 예시

```tcl
if {[catch {open "nonexistent.txt" r} fid]} {
	puts "Couldn't poen the file: $fid"
} else {
	puts "File opened successfully"
	close $fid
}
```

# 4. return

- 현재 수행 중인 연산에서 값을 반환하고 실행을 종료함

```tcl
return [value]
```

> 예시

```tcl
proc add {a b} {
	return [expr {$a + $b}]
}
puts [add 3 4]
```

> 결과

```tcl
7
```

## 주의사항⚠️
- 전역에서 사용 시 스크립트 전체 실행을 종료함

# 5. error

- 오류를 발생시키고 스크립트 실행을 중단함

```tcl
error message [info] [code]
```

> 예시

```tcl
proc divide {a b} {
	if {$b == 0} {
		error "Division by zero" "in divide function" DIVIDE_By_ZERO
	}
	return [expr {$a / $b}]
}

if {[catch {divide 10 0} result options]} {
	puts "Error: $result"
	puts "Info: [dict get $options -errorinfo]"
	puts "Code: [dict get $options -errorcode]"
}
```

# 6. 제어흐름 명령어 조합 사용

```tcl
proc process_data {data} {
    foreach item $data {
        if {[catch {process_item $item} result]} {
            puts "Error processing item $item: $result"
            continue
        }
        if {$result eq "STOP"} {
            break
        }
    }
    return "Processing complete"
}
```
# 7. Tip

- catch 남발 --> 디버깅 어려움
- return -code error
  - error와 유사한 효과를 낼 수 있음