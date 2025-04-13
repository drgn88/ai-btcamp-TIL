#include "device_driver.h"

static void Sys_Init(void)
{
	Clock_Init();
	LED_Init();
	Uart_Init(115200);
	Key_Poll_Init();
}

#if 1

void Main(void)
{
	Sys_Init();
	Uart_Printf("KEY Input Toggling #1\n");


	// KEY[1:0], GPB[7:6]을 GPIO 입력으로 선언
	Macro_Write_Block((GPIOB->CRL), 0xFF, 0x88, 24);
	Macro_Set_Area(GPIOB->ODR, 0x3, 0x3);

	unsigned int lock1 = 0;
	unsigned int lock2 = 0;

	volatile int key;

	for(;;)
	{
		// KEY0가 눌릴때마다 LED0의 값을 Toggling
		// LED0 - PB8		LED1 - PB9
		key = Key_Get_Pressed();
		if(!lock1 && (Macro_Check_Bit_Set(key, 0)))
		{
			Macro_Invert_Bit(GPIOB->ODR, 8);
			lock1 = 1;
		}
		else if(lock1 && (Macro_Check_Bit_Clear(key, 0)))
		{
			lock1 = 0;
			
		}

		if(!lock2 && (Macro_Check_Bit_Set(key, 1)))
		{
			Macro_Invert_Bit(GPIOB->ODR, 9);
			lock2 = 1;
		}
		else if(lock2 && (Macro_Check_Bit_Clear(key, 1)))
		{
			lock2 = 0;
			
		}


	}
}

#endif