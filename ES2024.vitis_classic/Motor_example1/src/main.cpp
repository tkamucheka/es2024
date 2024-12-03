#include "xparameters.h"
#include "xgpio.h"
#include "artyBotLib.h"
#include "PmodMAXSONAR.h"

#define PMOD_SONAR0_BASEADDR XPAR_PMOD_DUAL_MAXSONAR_0_SONAR0_BASEADDR
#define PMOD_SONAR1_BASEADDR XPAR_PMOD_DUAL_MAXSONAR_0_SONAR1_BASEADDR

#ifdef __MICROBLAZE__
#define CLK_FREQ XPAR_CPU_M_AXI_DP_FREQ_HZ
#else
#define CLK_FREQ 83333333 // FCLK0 frequency not found in xparameters.h
#endif

// GPIO 1: RGB LEDS & DIP SWITCHES
#define LED_CHANNEL 1
#define SW_CHANNEL 2
#define SW0 (1 << 0)
#define SW1 (1 << 1)
#define SW2 (1 << 2)
#define SW3 (1 << 3)

// GPIO: PMOD_LS1
#define LEFT 1
#define RIGHT 2

PmodMAXSONAR leftSonar;
PmodMAXSONAR rightSonar;
XGpio gpio1;
XGpio PMOD_LS1;

int isBlocked();
void drawPolygon(int n, int sideLength);
void drawPolygonWithSonar(int n, int sideLength);

int main()
{
  // Initialize GPIO buttons and LEDs
  XGpio_Initialize(&gpio1, XPAR_GPIO_1_DEVICE_ID);
  XGpio_SetDataDirection(&gpio1, LED_CHANNEL, 0);
  XGpio_SetDataDirection(&gpio1, SW_CHANNEL, 15);

  // Initialize GPIO PMOD LS1
  XGpio_Initialize(&PMOD_LS1, XPAR_AXI_GPIO_PMOD_LS1_DEVICE_ID);
  XGpio_SetDataDirection(&PMOD_LS1, /* PMOD top row */ 1, 0xF);
  XGpio_SetDataDirection(&PMOD_LS1, /* PMOD bottom row */ 2, 0xF);

  // Sonar example
  MAXSONAR_begin(&leftSonar, PMOD_SONAR0_BASEADDR, CLK_FREQ);
  MAXSONAR_begin(&rightSonar, PMOD_SONAR1_BASEADDR, CLK_FREQ);

  // initialize ArtyBot peripherals
  artyBotInit();
   xil_printf("Initialization complete...\r");

  int i = 0;
  int sideLength = 0;
  while (1)
  {
    // Example 1: Basic driving
    if (XGpio_DiscreteRead(&gpio1, SW_CHANNEL) & SW0)
    {
      drawPolygon(4, 40);
    }

    // Example 2: Draw polygons
    if (XGpio_DiscreteRead(&gpio1, SW_CHANNEL) & SW1)
    {
      sideLength = 30;
      for (i = 2; i < 10; ++i)
        drawPolygon(i, sideLength--);
    }

    // Example 3: Draw polygons with active sensors
    if (XGpio_DiscreteRead(&gpio1, SW_CHANNEL) & SW2)
    {
      sideLength = 30;
      for (i = 2; i < 10; ++i)
        drawPolygonWithSonar(i, sideLength--);
    }

    //

    // xil_printf("Examples finished.\r");
  }

  artyBotEnd();

  return 0;
}

int isBlocked()
{
  int LS1_data, line, sonar;

  // Check sonar sensor for obstacle
  int dist1 = MAXSONAR_getDistance(&leftSonar);
  int dist2 = MAXSONAR_getDistance(&rightSonar);
  sonar = (dist1 <= 8) || (dist2 <= 8);

  // Check IR sensors for line on floor
  LS1_data = XGpio_DiscreteRead(&PMOD_LS1, /* bottom row */ 2);
  line = (LS1_data & LEFT) || (LS1_data & RIGHT);

  return sonar || line;
}

void drawPolygon(int n, int sideLength)
{
  for (int i = 0; i < n; ++i)
  {
    driveForward(sideLength);
    turnRight(360 / n);
  }
}

void drawPolygonWithSonar(int n, int sideLength)
{
  for (int i = 0; i < n; ++i)
  {
    for (int j = 0; j < sideLength; ++j)
      if (!isBlocked())
        driveForward(1);
    turnRight(360 / n);
  }
}

