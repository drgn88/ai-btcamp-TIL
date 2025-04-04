/**********************/
//D0: 2, 3, 5의 배수 판단하기
/**********************/
#if 0
#include <stdio.h>

int compare(int num)
{
	// 코드 구현
	if ((num % 2) == 0) return 2;
	if ((num % 3) == 0) return 3;
	if ((num % 5) == 0) return 5;
	return 0;
}

void main(void)
{
	int num;
	scanf("%d", &num);
	printf("%d\n", compare(num));
}
#endif

/**********************/
//D1: 3의 배수 값인지 확인하는 함수
/**********************/
#if 0
#include <stdio.h>

int multiple_of_3(int num)
{
	// 코드 구현
	return ((num % 3) == 0) ? 1 : 0;
}

void main(void)
{
	int num;
	scanf("%d", &num);
	printf("%d\n", multiple_of_3(num));
}
#endif

/**********************/
//D2: 3의 배수 또는 5의 배수 찾기
/**********************/
#if 0
#include <stdio.h>

int f1(int num)
{
	// 코드 구현
	return (((num % 3) == 0) || ((num % 5) == 0)) ? 1 : 0;
}

void main(void)
{
	int num;
	scanf("%d", &num);
	printf("%d\n", f1(num));
}
#endif

/**********************/
//D3: 4~10 사이 숫자 찾기
/**********************/
#if 0
#include <stdio.h>

int f1(int num)
{
	// 코드 구현
	if ((num > 4) && (num < 10))
	{
		return 1;
	}
	else return 0;
}

void main(void)
{
	int num;
	scanf("%d", &num);
	printf("%d\n", f1(num));
}
#endif
/**********************/
//D4: 대문자 또는 소문자 찾기
/**********************/
#if 0
#include <stdio.h>

int f1(char c)
{
	// 구현 
	if (((c >= 'A') && (c <= 'Z')) || ((c >= 'a') && (c <= 'z')))
		return 1;
	else
		return 0;
}

void main(void)
{
	char c;
	scanf("%c", &c);
	printf("%d\n", f1(c));
}
#endif
/**********************/
//D6: 소문자 f ~ z 찾기
/**********************/
#if 0
#include <stdio.h>

int func(char c)
{
	// 코드 작성
	if ((c >= 'f') && (c <= 'z'))
		return 1;
	else
		return 0;
}

void main(void)
{
	char c;

	scanf("%c", &c);
	printf("%d\n", func(c));
}
#endif
/**********************/
//D7: 대문자 소문자 변경
/**********************/
#if 0
#include <stdio.h>

char func(char c)
{
	// 코드 작성
	if ((c >= 'A') && (c <= 'Z'))
		return (c + ('a' - 'A'));
	else if ((c >= 'a') && (c <= 'z'))
		return (c - ('a' - 'A'));
	else
		return '0';
}

void main(void)
{
	char c;

	scanf("%c", &c);
	printf("%c\n", func(c));
}
#endif

/**********************/
//D8: L, E, W 찾기
/**********************/
#if 0
#include <stdio.h>

char func(char c)
{
	// 코드 작성
	switch (c)
	{
	case 'L': return '*'; break;
	case 'E': return '*'; break;
	case 'W': return '*'; break;
	default: return c;
	}
}

void main(void)
{
	char c;

	scanf("%c", &c);
	printf("%c\n", func(c));
}
#endif
/**********************/
//D9: 실수 값에 제일 가까운 정수 값 구하기
/**********************/
#if 0
#include <stdio.h>

int func(float v)
{
	// 코드 작성	
	if (v > 0)
	{
		return (int)(v + 0.5);
	}
	else
		return (int)(v - 0.5);
}

void main(void)
{
	float a;

	scanf("%f", &a);
	printf("%d\n", func(a));
}
#endif