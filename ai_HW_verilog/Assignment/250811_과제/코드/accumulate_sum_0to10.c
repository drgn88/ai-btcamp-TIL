#include <stdio.h>

int main()
{
	int a;
	int acc_sum;
	int output;
	
	a = 0;
	acc_sum = 0;
	output = 0;

	while (a <= 10) {
		acc_sum = acc_sum + a;
		output = acc_sum;
		a = a + 1;
	}

	printf("acc_sum = %d\n", output);

	return 0;
}