#include <stdio.h>

extern void addition_sv(int, int);

void c_caller() {
	printf("Calling addition function for c_caller\n");
	addition_sv(4, 5);
}