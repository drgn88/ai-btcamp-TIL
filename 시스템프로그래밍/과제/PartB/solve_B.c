/**********************/
//B0: Soltion 1
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	char name[31];
	int age;
	float height;
	char blood_type;
	char nationality[11];

	// �ڵ� �ۼ�
	scanf("%[^\n]s", name);					// [^\n]: ���ͳ����������� ���ڿ��� �޴´�(��������)
	scanf("%d", &age);
	scanf("%f", &height);
	scanf(" %c", &blood_type);
	scanf(" %s", nationality);

	printf("%s, %d, %f\n", name, age, height);
	printf("%c, %s", blood_type, nationality);
}
#endif

/**********************/
//B0: Soltion 2
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	char name[31];
	int age;
	float height;
	char blood_type;
	char nationality[11];

	// �ڵ� �ۼ�
	gets(name);						//gets�� ���͸� ������ ���鹮�ڵ� �����Ѵ�
	scanf("%d", &age);
	scanf("%f", &height);
	scanf(" %c", &blood_type);
	scanf(" %s", nationality);

	printf("%s, %d, %f\n", name, age, height);
	printf("%c, %s", blood_type, nationality);
}
#endif

/**********************/
//B1
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	int a = 2345;
	int a4, a3, a2, a1;

	a4 = a / 1000;
	a3 = (a / 100) % 10;
	a2 = (a % 100) / 10;
	a1 = a % 10;

		printf("1000�ڸ�=%d, 100�ڸ�=%d, 10�ڸ�=%d, 1�ڸ�=%d\n", a4, a3, a2, a1);
}
#endif

/**********************/
//B2
/**********************/
#if 0
#include <stdio.h>

void main(void)
{
	int p = 123456;

	p = (p / 1000) * 1000;

	printf("%d\n", p);
}
#endif

/**********************/
//B4
/**********************/
#if 0
#include<stdio.h>

void main(void)
{
	unsigned int x;
	unsigned int x4, x3, x2, x1;

	scanf("%x", &x);

	// �ڵ� �ۼ�
	x4 = x / (16 * 16 * 16);
	x3 = (x / (16 * 16)) % 16;
	x2 = (x % (16 * 16)) / 16;
	x1 = x % 16;

	printf("%X, %X, %X, %X", x4, x3, x2, x1);

}
#endif
/**********************/
//B5
/**********************/
#if 0
#include<stdio.h>

void main(void)
{
	int a, b, c, sum;
	float avg;

	// �ڵ� �ۼ�
	scanf("%d %d %d", &a, &b, &c);
	sum = a + b + c;
	avg = (float)sum / 3;

	printf("%d, %f\n", sum, avg);
}
#endif
/**********************/
//B6
/**********************/
#if 0
#include <stdio.h>
int main(void)
{
	int A;
	scanf("%d", &A);

	// �ڵ� �ۼ�
	A = A - (((A % 1000) / 100) * 100);

	printf("%d\n", A);
	return 0;
}
#endif

/**********************/
//B7: Solution1. Bias �̿�
/**********************/
#if 0
#include <stdio.h>
int main(void)
{
	int A;
	scanf("%d", &A);

	A += 50;
	A = (A / 100) * 100;

	printf("%d\n", A);
	return 0;
}
#endif

/**********************/
//B7: Solution2. ������ ��
/**********************/
#if 0
#include <stdio.h>
int main(void)
{
	int A;
	scanf("%d", &A);

	if ((A % 100) > 49)
	{
		A += 100;
	}

	A = (A / 100) * 100;

	printf("%d\n", A);
	return 0;
}
#endif

/**********************/
//B8
/**********************/
#if 0
#include <stdio.h>
void weight(int w);

// ���⿡ �Լ� ����


void main(void)
{
	weight(50);
}

void weight(int w)
{
	printf("Weight = %d Kg\n", w);
}
#endif

/**********************/
//B9
/**********************/
#if 0
#include <stdio.h>

// ����� �Լ����� ����
int sqr(int x);
int area(int x, int y);
float compute_circle_arc(float radious);

void main(void)
{
	printf("sqr=%d\n", sqr(3));
	printf("area=%d\n", area(3, 5));
	printf("arc=%f\n", compute_circle_arc(4.1f));
}

int sqr(int x)
{
	return x * x;
}

int area(int x, int y)
{
	return x * y;
}

float compute_circle_arc(float radious)
{
	float pi = 3.141592f;

	radious = 2 * radious * pi;
	return radious;
}
#endif