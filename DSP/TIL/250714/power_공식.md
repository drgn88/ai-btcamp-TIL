# Power Consumption in Circuit

## Power 공식

$$ Power = P_dyn + P_switch + P_leak $$

## Pdyn: **Dynamic Power**⭐

> 회로 설계자가 중요하게 봐야하는 factor이다

### $P_dyn = \alpha * C * V^2 * f$

- $\alpha$
  - Active Factor(Toggling Ratio)
  - 특정 노드가 스위칭하는 빈도
  - Clock Gating
    - 사용하지 않는 블록의 Clock을 차단함
    - 불필요하게 switching하는 것을 방지함
- C
  - Capacitance
  - 설계자는 ```fan out```에 신경써야함
- V
  - 가장 강력한 전력소모를 줄이는 factor
  - 그러나 V가 작으면
    - 노이즈 마진이 감소
    - 속도 감소
    - 모르면 건들지 말자
    - 아님 최후의 수단
- f
  - frequency
  - 동작 주파수
  - 회로에 요구되는 최소 주파수로 맞춰줘야 함

> $\alpha$가 Dynamic Power에서 차지하는 Position이 크다

