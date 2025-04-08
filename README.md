# AI시스템 반도체 설계
대한상공회의소에서 진행하는 AI시스템반도체설계 부트캠프 공부 내용 기록입니다

# 📖목차
[시스템 프로그래밍](#시스템프로그래밍)<br>
[AI HW accelerater 설계](#AI-HW-accelerater-설계)


## [시스템 프로그래밍](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D)
### C언어 기본
- [1. 표준입출력1](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/1.%ED%91%9C%EC%A4%80%EC%9E%85%EC%B6%9C%EB%A0%A51.md)
- [2. 표준입출력2](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/2.%ED%91%9C%EC%A4%80%EC%9E%85%EC%B6%9C%EB%A0%A52.md)
- [3. C 연산자](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/3.%EC%97%B0%EC%82%B0%EC%9E%90.md)
- [4.함수와 헤더파일](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/4.%ED%95%A8%EC%88%98%EC%99%80%20%ED%97%A4%EB%8D%94%ED%8C%8C%EC%9D%BC.md)
- [5.조건문](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/5.%EC%A1%B0%EA%B1%B4%EB%AC%B8(if%2C%20switch-case).md)
- [6.반복문](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/6.%EB%B0%98%EB%B3%B5%EB%AC%B8(for%2C%20while).md)
- [7.배열](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/7.%EB%B0%B0%EC%97%B4.md)
- [8.이차원 배열](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/8.%EC%9D%B4%EC%B0%A8%EC%9B%90%EB%B0%B0%EC%97%B4.md#%EC%9D%B4%EC%B0%A8%EC%9B%90-%EB%B0%B0%EC%97%B4%EC%9D%98-%EA%B5%AC%EC%A1%B0)
- [9.유도형 타입: 구조체와 공용체](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/9.%EC%9C%A0%EB%8F%84%ED%98%95%20%ED%83%80%EC%9E%85.md)

### [과제](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C)
- [1.PartA](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartA)
- [2.PartB](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartB)
- [3.PartC](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartC)
- [4.PartD](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartD/solve_D.c)
- [5.PartE](https://github.com/drgn88/ai-btcamp-TIL/tree/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/PartE)
- [6.C_lang_test](https://github.com/drgn88/ai-btcamp-TIL/blob/main/%EC%8B%9C%EC%8A%A4%ED%85%9C%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/%EA%B3%BC%EC%A0%9C/C_level_test/c_lang_test.c)

## ARM 디바이스 프로그래밍
> stm ide를 통한 편리한 사용보다는 반도체 설계자 관점에서 배우기(무에서 유를 내가 직접 만드는 과정)
- [1. 기본 컴퓨터 구조](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/1.%EA%B8%B0%EB%B3%B8_%EC%BB%B4%ED%93%A8%ED%84%B0%EA%B5%AC%EC%A1%B0.md)
- [2. ⭐⭐⭐ARM 메모리와 Bus decoding](https://github.com/drgn88/ai-btcamp-TIL/blob/main/ARM%20%EB%94%94%EB%B0%94%EC%9D%B4%EC%8A%A4%20%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D/2.ARM%20%EB%A9%94%EB%AA%A8%EB%A6%AC%EC%99%80%20Bus%20decoding.md#1-%EB%B0%98%EB%8F%84%EC%B2%B4-%EB%A9%94%EB%AA%A8%EB%A6%AC-%EB%B6%84%EC%84%9D)
