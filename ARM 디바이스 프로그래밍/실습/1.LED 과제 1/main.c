 #include "device_driver.h"

/* // #define RCC_APB2ENR   (*(unsigned long*)0x40021018)

// #define GPIOB_CRH      (*(unsigned long*)0x40010800)
// #define GPIOB_ODR      (*(unsigned long*)0x4001080C)

void Main(void)
{
	int volatile i;

	Uart_Init(115200);
	Uart_Printf("LED Toggling Test #1\n");
	RCC -> APB2ENR |= (1<<3); // Port-B ON
	RCC -> APB2ENR |= (1<<2); // Port-A ON

	GPIOA -> CRL = 0x600 << 0;

	for(;;)
	{
		GPIOA -> ODR = 0x0 << 2;
		for(i=0; i<0x40000; i++);
		GPIOA -> ODR = 0x1 << 2;
		for(i=0; i<0x40000; i++);
	}
}
*/


void Main(void)
{
	int volatile i;

	Uart_Init(115200);
	Uart_Printf("LED Toggling Test #1\n");
	RCC -> APB2ENR |= (1<<3); // Port-B ON
	RCC -> APB2ENR |= (1<<2); // Port-A ON

	GPIOA -> CRL = 0x6600 << 0;

	for(;;)
	{
		GPIOA -> ODR = 0x1 << 2;
		for(i=0; i<0x40000; i++);
		GPIOA -> ODR = 0x2 << 2;
		for(i=0; i<0x40000; i++);
	}
}
