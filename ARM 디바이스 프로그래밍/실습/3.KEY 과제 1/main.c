#include "device_driver.h"

static void Sys_Init(void)
{
	Clock_Init();
	LED_Init();
	Uart_Init(115200);
}

/* Key 인식 */


/* Key에 의한 LED Toggling */

#if 1

void Main(void)
{
	Sys_Init();
	Uart_Printf("KEY Input Toggling #1\n");


	// KEY[1:0], GPB[6]을 GPIO 입력으로 선언
	Macro_Write_Block((GPIOB->CRL), 0xF, 0x8, 24);
	Macro_Set_Bit(GPIOB->ODR, 6);
	// GPA[3] Input port Inter Pull up
	Macro_Write_Block((GPIOA->CRL), 0xF, 0x8, 12);
	Macro_Set_Bit(GPIOA->ODR, 3);

	unsigned int check1 = 1;
	unsigned int check2 = 1;

	for(;;)
	{
		// KEY0가 눌릴때마다 LED0의 값을 Toggling
		// LED0 - PB8		LED1 - PB9
		
		if(check1 && !((GPIOA->IDR) & (1 << 3)))
		{
			Macro_Invert_Bit(GPIOB->ODR, 8);
			check1 = 0;
		}
		else if(!check1 && ((GPIOA->IDR) & (1 << 3)))
		{
			check1 = 1;
			
		}

		if(check2 && !((GPIOB->IDR) & (1 << 6)))
		{
			Macro_Invert_Bit(GPIOB->ODR, 9);
			check2 = 0;
		}
		else if(!check2 && ((GPIOB->IDR) & (1 << 6)))
		{
			check2 = 1;
			
		}


	}
}

#endif
