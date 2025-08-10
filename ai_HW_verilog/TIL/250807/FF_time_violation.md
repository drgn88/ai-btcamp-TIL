# Review

# 1. Latch

## 1️⃣RS-Latch

<img src="./img/스크린샷 2025-08-08 083628.png"><br>

|   R   |   S   |   Q   |  Q'   |
| :---: | :---: | :---: | :---: |
|   0   |   0   | 유지  | 유지  |
|   0   |   1   |   1   |   0   |
|   1   |   0   |   0   |   1   |
|   1   |   1   |   0   |   0   |

⭐ 11 --> 00
---
- 출력이 0, 1을 반복하며 **발진**
- Problem

## 2️⃣D-Latch

<img src="./img/스크린샷 2025-08-08 084001.png"><br>
- SR Latch의 발진은 해결
- But, **Memory 기능이 없음**❗

## 3️⃣Gated D-Latch

<img src="./img/스크린샷 2025-08-08 084118.png"><br>

| Gate  |   D   |   Q   |  Q'   |
| :---: | :---: | :---: | :---: |
|   0   |   X   | 유지  | 유지  |
|   1   |   0   |   0   |   1   |
|   1   |   1   |   1   |   0   |

# 2. Flip-Flop⭐

> 두 개의 **D-Latch**를 연결한 형태

<img src="./img/스크린샷 2025-08-08 084401.png"><br>

- **Master D-Latch**와 **Slave D-Latch**가 연결된 형태
- Clk의 Edge에 값을 출력함

## Set-up time / Hold time⭐⭐⭐

### Set-up time

- 클럭 엣지 이전에 값이 안정적으로 도착해야하는 시간
- Master Latch에 값이 들어오는 시간❗

### Hold time
- 클럭 에지 이후로 값이 안정적으로 유지돼야하는 시간
- Slave Latch에 값이 들어오는 시간❗

### Meta-Stable 상태⭐

<img src="./img/스크린샷 2025-08-08 090609.png"><br>

- Clk Edge에 값이 변하면서 0과 1이 아닌 애매한 상태
- Problem❗❗❗

⭐Synchronizer
---
<img src="./img/스크린샷 2025-08-08 090842.png"><br>
- Meta Stable 상태를 방지함
- Meta-stable 상태의 신호가 F/F을 거치면서 안정되는 시간을 가짐

# 3. Propagation Delay

## Propagation Delay⭐
- 회로에 입력이 들어가고 **안정된 출력**이 나오기까지의 **Delay**

## Glitch

<img src="./img/스크린샷 2025-08-11 080115.png"><br>

- propagation delay에 의해 게이트에 신호가 도착하기까지 지연 있음
  - Glitch  --> 이상한 값 나옴
- ⭐이를 방지하기 위해 F/F을 둠

### Glitch

<img src="./img/스크린샷 2025-08-11 081855.png"><br>

## Clock 주기 설정

<img src="./img/스크린샷 2025-08-11 081732.png"><br>

- Clock 주기 = Tsetup + Thold_time + Tpropagation_delay

