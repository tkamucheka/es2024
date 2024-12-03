#include "xil_printf.h"
#include "xil_types.h"
#include "xparameters.h"
#include "PmodMAXSONAR.h"

#define PMOD_SONAR0_BASEADDR XPAR_PMOD_DUAL_MAXSONAR_0_SONAR0_BASEADDR
#define PMOD_SONAR1_BASEADDR XPAR_PMOD_DUAL_MAXSONAR_0_SONAR1_BASEADDR

#ifdef __MICROBLAZE__
#define CLK_FREQ XPAR_CPU_M_AXI_DP_FREQ_HZ
#else
#define CLK_FREQ 83333333 // FCLK0 frequency not found in xparameters.h
#endif

PmodMAXSONAR leftSonar;
PmodMAXSONAR rightSonar;

void delay_ms(int ms)
{
	for (int i = 0; i < 1500 * ms; i++)
	{
		asm("nop");
	}
}

int main()
{
	// Sonar example
	MAXSONAR_begin(&leftSonar, PMOD_SONAR0_BASEADDR, CLK_FREQ);
	MAXSONAR_begin(&rightSonar, PMOD_SONAR1_BASEADDR, CLK_FREQ);

	u32 dist1, dist2;
	while (1)
	{
		dist1 = MAXSONAR_getDistance(&leftSonar);
		dist2 = MAXSONAR_getDistance(&rightSonar);

		xil_printf("left = %3d, right = %3d\r", dist1, dist2);
		delay_ms(1000);
	}

	return 0;
}

