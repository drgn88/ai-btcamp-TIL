/**********************/
//C0
/**********************/
#if 0
#include <stdio.h>

float compute_circle_area(float radius);

void main(void)
{
	float r;
	scanf("%f", &r);
	printf("%f\n", compute_circle_area(r));
}

float compute_circle_area(float radius)
{
	float pi = 3.14f;
	return pi * (radius * radius);

	// 코드 작성
}
#endif

/**********************/
//C1
/**********************/
#if 0
#include <stdio.h>

int find_int(float value);

void main(void)
{
	int r;

	float num;
	scanf("%f", &num);

	r = find_int(num);
	printf("%d\n", r);
}

int find_int(float value)
{
	// 코드 작성
	value += 0.5;
	return (int)(value);

}
#endif

/**********************/
//C2
/**********************/
#if 0
#include <stdio.h>

int make_group(int car);

void main(void)
{
	int car;
	scanf("%d", &car);
	printf("%d\n", make_group(car));
}

int make_group(int car)
{
	// 코드 작성
	int check = car % 5;

	switch (check)
	{
	case 0: return 1; break;
	case 1: return 2; break;
	case 2: return 3; break;
	case 3: return 4; break;
	case 4: return 5; break;
	default: printf("ERROR\n"); return 0;
	}
}
#endif

/**********************/
//C3
/**********************/
#if 0
#include <stdio.h>

char Change_Case(char upper)
{
	// 코드 작성	
	return (upper + ('a' - 'A'));
}

void main(void)
{
	char a;

	scanf("%c", &a);
	printf("%c => %c\n", a, Change_Case(a));
}
#endif

/**********************/
//C4: ASCII Code 값을 알때('0' == 0x30)
/**********************/
#if 0
#include <stdio.h>

int Change_Char_to_Int(char num)
{
	// 코드 작성		
	return (num - '0');
}

void main(void)
{
	char a;

	scanf("%c", &a);
	printf("%d\n", Change_Char_to_Int(a));
}
#endif

/**********************/
//C4: ASCII Code 값을 모를 때
/**********************/
#if 0
#include <stdio.h>

int Change_Char_to_Int(char num)
{
	// 코드 작성		
	switch (num)
	{
	case '0': return 0; break;
	case '1': return 1; break;
	case '2': return 2; break;
	case '3': return 3; break;
	case '4': return 4; break;
	case '5': return 5; break;
	case '6': return 6; break;
	case '7': return 7; break;
	case '8': return 8; break;
	case '9': return 9; break;
	default: printf("ERROR\n"); return 100;
	}
}

void main(void)
{
	char a;

	scanf("%c", &a);
	printf("%d\n", Change_Char_to_Int(a));
}
#endif

/**********************/
//C6: 3개의 정수 중 홀수의 개수를 리턴하는 함수 설계(if)
/**********************/
#if 0
#include <stdio.h>

int Solve(int A, int B, int C)
{
	int cnt = 0;
	// 여기서부터 작성
	if ((A % 2) != 0)
	{
		cnt++;
	}
	if ((B % 2) != 0)
	{
		cnt++;
	}
	if ((C % 2) != 0)
	{
		cnt++;
	}
	return cnt;
}

int main(void)
{
	int A, B, C;
	int sol;
	scanf("%d %d %d", &A, &B, &C);

	sol = Solve(A, B, C);

	printf("%d", sol);

	return 0;
}
#endif

/**********************/
//C6: 3개의 정수 중 홀수의 개수를 리턴하는 함수 설계(switch)
/**********************/
#if 0
#include <stdio.h>

int Solve(int A, int B, int C)
{
	// 여기서부터 작성
	int a, b, c;
	a = A % 2;
	b = B % 2;
	c = C % 2;

	int sum = a + b + c;

	switch (sum)
	{
	case 0: return 0; break;
	case 1: return 1; break;
	case 2: return 2; break;
	case 3: return 3; break;
	default: printf("ERROR");
	}

}

int main(void)
{
	int A, B, C;
	int sol;
	scanf("%d %d %d", &A, &B, &C);

	sol = Solve(A, B, C);

	printf("%d", sol);

	return 0;
}
#endif

/**********************/
//C7: 짝수의 개수
/**********************/
#if 0
#include <stdio.h>
int sqr_ten(int num);
int Solve(int A);

int Solve(int A)
{
	//여기서 부터 작성
	int i;
	int cnt = 0;
	for (i = 0; i < 4; i++)
	{
		if (((A / sqr_ten(i)) % 10 % 2) == 0)
		{
			cnt++;
		}
	}
	return cnt;
}

int sqr_ten(int num)
{
	int result = 1;
	int i;

	if (num == 0) return 1;

	for (i = 0; i < num; i++)
	{
		result *= 10;
	}
	return result;
}

int main(void)
{
	int A;
	int sol;
	scanf("%d", &A);

	sol = Solve(A);

	printf("%d", sol);

	return 0;
}
#endif

/**********************/
//C8: 홀짝을 맞춰라 1
/**********************/
#if 0
#include <stdio.h>

int Check_Odd_Even(int num)
{
	// 코드 구현
	return (num % 2) == 0 ? 2 : 1;
}

void main(void)
{
	int num;
	scanf("%d", &num);
	printf("%d\n", Check_Odd_Even(num));
}
#endif

/**********************/
//C9: 홀짝을 맞춰라 2
/**********************/
#if 0
#include <stdio.h>

int Check_Odd_Even(int num)
{
	// 코드 구현
	return (num % 2) == 0 ? 0 : 1;
}

void main(void)
{
	int num;
	scanf("%d", &num);
	printf("%d\n", Check_Odd_Even(num));
}
#endif