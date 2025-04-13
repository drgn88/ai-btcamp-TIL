#include "device_driver.h"
//보기 편하게 입력을 Inverting: 0 --> OFF 1 --> ON
#define KEY_VALUE() (Macro_Extract_Area((~GPIOB->IDR) , 0x3,6))

void Key_Poll_Init(void)
{
	Macro_Set_Bit(RCC->APB2ENR, 3);
	Macro_Write_Block(GPIOB->CRL, 0xff, 0x44, 24);
}
/*
int Key_Get_Pressed(void)
{
	return Macro_Extract_Area((~GPIOB->IDR) , 0x3,6);
}
*/
void Key_Wait_Key_Released(void)
{
	for(;;)
	{
		if(KEY_VALUE() == 0) return;
	}
	

}
#if 0
int Key_Wait_Key_Pressed(void)
{
	unsigned int key_check = 0x3;
	for(;;)
	{
		if(Macro_Extract_Area(GPIOB->IDR, 0x3, 6) != key_check)
		{
			switch (Macro_Extract_Area(GPIOB->IDR, 0x3, 6))
			{
				case 0x2: return 0; break;
				case 0x1: return 1; break;
				default: break;
			}
		}
	}

}
#endif
/********************************************************************/
int Key_Get_Pressed(void)
{
	unsigned int N = 200000;
	volatile int i;
	unsigned int mem;
	#if 1
	// goto문으로 Chattering 구현 - Chattering 안남 간섭도 안남남
RECHECK:
	mem = KEY_VALUE();
	for(i = 0; i < N; i++)
	{
		if(mem != KEY_VALUE())
		{
			goto RECHECK;
		}
	}
	return mem;
	#endif

	#if 0
	// while문으로 Chattering 구현 - 스위치 간섭남 왜
		unsigned int check = 0;
	for(;;)
	{
		mem = KEY_VALUE();
		for(i = 0; i < N; i++)
		{
			if(mem != KEY_VALUE())
			{
			check = 0;
			break;
			}
			check++;
		}
		if(check == N) return mem;
	}
	#endif
}

int Key_Wait_Key_Pressed(void)
{
	
	for(;;)
	{
		unsigned int check = Key_Get_Pressed();
		if(check)
		{
			return check;
		}
	}

}