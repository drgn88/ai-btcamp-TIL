/**********************/
//D0: 2, 3, 5�� ��� �Ǵ��ϱ�
/**********************/
#if 0
#include <stdio.h>

int compare(int num)
{
	// �ڵ� ����
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
//D1: 3�� ��� ������ Ȯ���ϴ� �Լ�
/**********************/
#if 0
#include <stdio.h>

int multiple_of_3(int num)
{
	// �ڵ� ����
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
//D2: 3�� ��� �Ǵ� 5�� ��� ã��
/**********************/
#if 0
#include <stdio.h>

int f1(int num)
{
	// �ڵ� ����
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
//D3: 4~10 ���� ���� ã��
/**********************/
#if 0
#include <stdio.h>

int f1(int num)
{
	// �ڵ� ����
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
//D4: �빮�� �Ǵ� �ҹ��� ã��
/**********************/
#if 0
#include <stdio.h>

int f1(char c)
{
	// ���� 
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
//D6: �ҹ��� f ~ z ã��
/**********************/
#if 0
#include <stdio.h>

int func(char c)
{
	// �ڵ� �ۼ�
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
//D7: �빮�� �ҹ��� ����
/**********************/
#if 0
#include <stdio.h>

char func(char c)
{
	// �ڵ� �ۼ�
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
//D8: L, E, W ã��
/**********************/
#if 0
#include <stdio.h>

char func(char c)
{
	// �ڵ� �ۼ�
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
//D9: �Ǽ� ���� ���� ����� ���� �� ���ϱ�
/**********************/
#if 0
#include <stdio.h>

int func(float v)
{
	// �ڵ� �ۼ�	
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