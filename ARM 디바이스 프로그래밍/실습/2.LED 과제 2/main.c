#include "device_driver.h"

void Main(void)
{
	volatile int i;

	/* 이 부분은 수정하지 말 것 */
	Macro_Set_Bit(RCC->APB2ENR, 3);

	/* 매크로를 이용하여 초기에 LED 모두 OFF */
	
	Macro_Write_Block((GPIOB->CRH),0xFF,0x66,0);
	Macro_Set_Area((GPIOB->ODR),0x3,8);


	for(;;)
	{
		Macro_Invert_Area((GPIOB->ODR), 0x3, 8);

		for(i = 0; i < 0x80000; i++);

		Macro_Invert_Area((GPIOB->ODR), 0x3, 8);

		for(i = 0; i < 0x80000; i++);
	}
}
