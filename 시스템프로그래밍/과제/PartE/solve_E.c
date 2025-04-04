/**********************/
//E0: 성적 계산 함수
/**********************/
#if 0
#include <stdio.h>

char func(int score)
{
	// 코드 작성
	int val;
	if ((score > 100) || (score < 0)) return 'X';

	val = (score - 1) / 10;
	switch (val)
	{
	case 9: return 'A'; break;
	case 8: return 'B'; break;
	case 7: return 'C'; break;
	case 6: return 'D'; break;
	default: return 'F'; break;
	}
}

void main(void)
{
	int score;

	scanf("%d", &score);
	printf("%c\n", func(score));
}
#endif

/**********************/
//E1: 두 수의 거리
/**********************/
#if 0
#include <stdio.h>

int Solve(int A, int B)
{
	//여기서 부터 작성
	int min, max;
	if (A > B)
	{
		min = B;
		max = A;
	}
	else
	{
		min = A;
		max = B;
	}

	return (max - min);
}

int main(void)
{
	int A, B;
	int sol;
	scanf("%d %d", &A, &B);

	sol = Solve(A, B);

	printf("%d\n", sol);

	return 0;
}
#endif

/**********************/
//E2: 시간차 구하기
/**********************/
#if 1
#include <stdio.h>

int Solve(int A, int B)
{
	//여기서 부터 작성
	int min, max;
	if (A > B)
	{
		min = B;
		max = A;
	}
	else
	{
		min = A;
		max = B;
	}

	return (max - min);
}

int main(void)
{
	int A, B;
	int sol;
	scanf("%d %d", &A, &B);

	sol = Solve(A, B);

	printf("%d\n", sol);

	return 0;
}
#endif

/**********************/
//E5: 0 부터 20 까지의 수에서 짝수를 인쇄하는 코드
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// 코드 작성
	int i;
	for (i = 0; i <= 20; i++)
	{
		if ((i % 2) == 0) printf("%d\n", i);
	}
}
#endif

/**********************/
//E6:  0부터 20까지의 수에서 3의 배수를 인쇄하는 코드
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// 코드 작성
	int i;
	for (i = 0; i <= 20; i++)
	{
		if ((i % 3) == 0) printf("%d\n", i);
	}

}

#endif

/**********************/
//E7: *을 입력 받은 수 만큼 인쇄하는 코드
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// 코드 작성
	int n;
	scanf("%d", &n);
	
	int i;
	for (i = 0; i < n; i++)
	{
		printf("*");
	}
}
#endif
/**********************/
//E8: 숫자를 7 부터 입력 받은 개수 만큼 연속 인쇄하는 코드
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// 코드 작성
	int n;
	scanf("%d", &n);
	
	int i;
	for (i = 7; i < (n + 7); i++)
	{
		printf("%d\n", i);
	}
}
#endif
/**********************/
//E9: ‘A’부터 입력 받은 알파벳까지 알파벳을 인쇄
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// 코드 작성
	char c;
	scanf("%c", &c);
	int i;
	for (i = 'A'; i <= c; i++)
	{
		printf("%c\n", i);
	}
}
#endif
