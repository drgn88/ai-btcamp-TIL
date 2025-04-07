/*********************************************/
//E5: Black Jack 함수
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int card[3];

int black_jack(void)
{
	// 코드 구현
	if ((card[0] + card[1] + card[2]) == 21)
		return 1;
	else
		return 0;
}

void main(void)
{
	int i;

	for (i = 0; i < 3; i++)
	{
		scanf("%d", &card[i]);
	}

	printf("%d\n", black_jack());
}
#endif
/*********************************************/
//E6: 단어 글자수 맞추기
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	char x[21];

	scanf(" %s", x);

	// 코드 구현
	int i;
	int check = 0;
	for (i = 0;;i++)
	{
		if (x[i] == 0)
		{
			printf("%d\n", check);
			break;
		}
		else
		{
			check++;
		}
	}

}
#endif
/*********************************************/
//E7: 가까운 정수 반환 함수 설계
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int round(double x)
{
	// 코드 작성
	if (x > 0)
	{
		x += 0.5;
		return (int)x;
	}
	else
	{
		x -= 0.5;
		return (int)x;
	}
}

void main(void)
{
	double d = 3.5;

	scanf("%lf", &d);
	printf("%d\n", round(d));
}
#endif
/*********************************************/
//E8: 만기 적금 계산 함수
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

int money(int total, int rate, int day)
{
	// 코드 작성
	int i = 0;
	int sum = total;
	for (i = 0; i < day; i++)
	{
		sum += rate;
	}

	sum = sum / 100;
	sum = sum * 100;
	return sum;
}

void main(void)
{
	int t, r, d;

	scanf("%d %d %d", &t, &r, &d);
	printf("%d\n", money(t, r, d));
}
#endif
/*********************************************/
//E9: 가위 바위 보 판정하기
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	int a, b;

	scanf("%d %d", &a, &b);
	char c;

	// 코드 작성
	if (a > b)
	{
		if ((a == 2) && (b == 0))
			c = 'b';
		else
			c = 'a';
	}
	else if (b > a)
	{
		if ((b == 2) && (a == 0))
			c = 'a';
		else
			c = 'b';
	}
	else
		c = '=';

	printf("%c\n", c);
}
#endif
/*********************************************/
//F0: 8비트 통신 데이터에 Even Parity 추가하기
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	int data[9];
	int i;

	for (i = 0; i < 8; i++)
	{
		scanf("%d", &data[i]);
	}

	// 코드 구현
	int sum = 0;
	for (i = 0; i < 8; i++)
	{
		sum += data[i];
	}
	if ((sum % 2) == 0)
		data[8] = 0;
	else
		data[8] = 1;

	for (i = 0; i < 9; i++)
	{
		printf("%d ", data[i]);
	}
}
#endif
/*********************************************/
//F0: 8비트 통신 데이터에 Even Parity 추가하기(다른 풀이 --< HW적인 접근)
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	int data[9];
	int i;
	int parity = 0;

	for (i = 0; i < 8; i++)
	{
		scanf("%d", &data[i]);
	}

	// 코드 구현
	for (i = 0; i < 8; i++)
	{
		parity ^= data[i];
	}

	data[8] = parity;

	for (i = 0; i < 9; i++)
	{
		printf("%d ", data[i]);
	}
}
#endif
/*********************************************/
//F1: 알파벳 추리기
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	char in[11];
	char out[11] = { 0 };

	scanf("%s", in);

	// 코드 구현 (필요시 변수 자유롭게 선언하여 사용 가능)
	
	int k = 0;
	int i;
	//대문자
	for (i = 0; i < 10; i++)
	{
		if (((in[i] >= 'A') && (in[i] <= 'Z')) || ((in[i] >= 'a') && (in[i] <= 'z')))
		{
			out[k] = in[i];
			k++;
		}
	}
	printf("%s\n", out);
}
#endif
/*********************************************/
//F2: 배열에서 큰 값 2개 찾기
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	int a[10];
	int i,j;

	for (i = 0; i < 10; i++)
	{
		scanf("%d", &a[i]);
	}

	// 코드 작성
	int temp;
	for (i = 0; i < 10; i++)
	{
		for (j = i + 1; j < 10; j++)
		{
			if (a[i] > a[j])
			{
				temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}
	}

	printf("%d %d\n", a[9], a[8]);
}
#endif
/*********************************************/
//F3: 같은 수는 용납 못해
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>

void main(void)
{
	int num[10];
	int i, j;

	for (i = 0; i < 10; i++)
	{
		scanf("%d", &num[i]);
	}

	// 코드 구현

	for (i = 0; i < 10; i++)
	{
		for (j = i+1; j < 10; j++)
		{
			if (num[i] == num[j])
			{
				printf("NO\n");
				return;
			}
			else
				continue;
		}
	}
	printf("YES\n");
}
#endif
/*********************************************/
//F4: 배열에서 패턴 개수 찾기
/*********************************************/
#if 0
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
int char_num(char arr[]);

void main(void)
{
	char s1[21];
	char s2[6];

	scanf(" %s", s1);
	scanf(" %s", s2);

	// 코드 작성
	int i, j;
	int check = 0;
	int num1, num2;
	num1 = char_num(s1);
	num2 = char_num(s2);
	for (i = 0; i <= (num1 - num2); i++)
	{
		for (j = 0; j <= num2 - 1; j++)
		{
			if ((s1[i + j] != s2[j]))
			{
				break;
			}
			
		}
		if (j == num2)
		{
			check++;
		}
	}

	printf("%d\n", check);

}

int char_num(char arr[])
{
	int i;
	int check = 0;
	for (i = 0;; i++)
	{
		if (arr[i] == 0)
		{
			return check;
		}
		else
		{
			check++;
		}
	}
}
#endif
