/**********************/
//E0: ���� ��� �Լ�
/**********************/
#if 0
#include <stdio.h>

char func(int score)
{
	// �ڵ� �ۼ�
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
//E1: �� ���� �Ÿ�
/**********************/
#if 0
#include <stdio.h>

int Solve(int A, int B)
{
	//���⼭ ���� �ۼ�
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
//E2: �ð��� ���ϱ�
/**********************/
#if 1
#include <stdio.h>

int Solve(int A, int B)
{
	//���⼭ ���� �ۼ�
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
//E5: 0 ���� 20 ������ ������ ¦���� �μ��ϴ� �ڵ�
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// �ڵ� �ۼ�
	int i;
	for (i = 0; i <= 20; i++)
	{
		if ((i % 2) == 0) printf("%d\n", i);
	}
}
#endif

/**********************/
//E6:  0���� 20������ ������ 3�� ����� �μ��ϴ� �ڵ�
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// �ڵ� �ۼ�
	int i;
	for (i = 0; i <= 20; i++)
	{
		if ((i % 3) == 0) printf("%d\n", i);
	}

}

#endif

/**********************/
//E7: *�� �Է� ���� �� ��ŭ �μ��ϴ� �ڵ�
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// �ڵ� �ۼ�
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
//E8: ���ڸ� 7 ���� �Է� ���� ���� ��ŭ ���� �μ��ϴ� �ڵ�
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// �ڵ� �ۼ�
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
//E9: ��A������ �Է� ���� ���ĺ����� ���ĺ��� �μ�
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	// �ڵ� �ۼ�
	char c;
	scanf("%c", &c);
	int i;
	for (i = 'A'; i <= c; i++)
	{
		printf("%c\n", i);
	}
}
#endif
