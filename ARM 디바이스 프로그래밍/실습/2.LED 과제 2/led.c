#include "device_driver.h"

void LED_Init(void)
{
	/* 다음 코드는 수정하지 마시오 */
	Macro_Set_Bit(RCC->APB2ENR, 3);

	Macro_Write_Block((GPIOB->CRH), 0xFF, 0x66, 0);
	Macro_Write_Block((GPIOB->ODR), 0x3, 0x3, 8);
}

void LED_Display(unsigned int num)
{
	unsigned int HW_num = (num & (0x3));
	switch (HW_num)
	{
		case 0x0: Macro_Write_Block((GPIOB->ODR), 0x3, 0x3, 8); break;
		case 0x1: Macro_Write_Block((GPIOB->ODR), 0x3, 0x2, 8); break;
		case 0x2: Macro_Write_Block((GPIOB->ODR), 0x3, 0x1, 8); break;
		case 0x3: Macro_Write_Block((GPIOB->ODR), 0x3, 0x0, 8); break;
	}

}

void LED_All_On(void)
{

	Macro_Write_Block((GPIOB->ODR), 0x3, 0x0, 8);

}

void LED_All_Off(void)
{
	Macro_Write_Block((GPIOB->ODR), 0x3, 0x3, 8);

}
