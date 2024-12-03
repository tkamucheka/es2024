/*
 * Pmod DHB1 C++ Example Application
 */

// xilinx headers
#include "xil_printf.h"
#include "xil_types.h"

// sensors
#include "xparameters.h"
#include "xgpio.h"
#include "PmodDHB1.h"
#include "PWM.h"

// Pmod DHB1
#define PMOD_DHB1_CLOCK_FREQ_HZ XPAR_MICROBLAZE_CORE_CLOCK_FREQ_HZ

#define M1_CHANNEL 1
#define M2_CHANNEL 2

#define PWM_PERIOD 0x00029000 // 2ms
#define PWM_DUTY 0x00014800   // 50% duty cycle
#define PWM_M1 0
#define PWM_M2 1

XGpio DHB1_GPIO;
PmodDHB1 motor;

void delay_ms(int ms);
void DHB1_GPIO_init(XGpio *InstancePtr,
                    u32 GPIO_BASEADDR)
{
  InstancePtr->BaseAddress = GPIO_BASEADDR;
  InstancePtr->InterruptPresent = 0;
  InstancePtr->IsDual = 1;
  InstancePtr->IsReady = XIL_COMPONENT_IS_READY;
}

int main()
{
  // Initialize GPIO interface
  DHB1_GPIO_init(&DHB1_GPIO,
                 XPAR_PMOD_DHB1_0_GPIO_BASEADDR);

  XGpio_SetDataDirection(&DHB1_GPIO, M1_CHANNEL, 0xC);
  XGpio_SetDataDirection(&DHB1_GPIO, M2_CHANNEL, 0xC);
  xil_printf("check 1\r");

  // Initialize motor instance
  DHB1_begin(&motor,
             XPAR_PMOD_DHB1_0_GPIO_BASEADDR,
             XPAR_PMOD_DHB1_0_PWM_BASEADDR,
             PMOD_DHB1_CLOCK_FREQ_HZ,
             PWM_PERIOD * 3);
  xil_printf("check 2\r");

  // Motor Driver PWM
  u32 PWM_ctrl_reg;
  u32 PWM_status_reg;
  u32 PWM_period_reg;
  u32 PWM_duty_reg;

  PWM_Set_Duty(XPAR_PMOD_DHB1_0_PWM_BASEADDR, PWM_PERIOD * 2, 0);
  PWM_Set_Duty(XPAR_PMOD_DHB1_0_PWM_BASEADDR, PWM_PERIOD * 2, 1);

  // Driver foward for approx 15 seconds
  DHB1_motorEnable(&motor);
  xil_printf("check 3\r");

  u32 m1, m2, count = 0;
  while (1)
  {
    // PWM data
    PWM_ctrl_reg = PWM_mReadReg(
        XPAR_PMOD_DHB1_0_PWM_BASEADDR,
        PWM_CTRL_REG_OFFSET);
    PWM_status_reg = PWM_mReadReg(
        XPAR_PMOD_DHB1_0_PWM_BASEADDR,
        PWM_CTRL_REG_OFFSET);
    PWM_period_reg = PWM_Get_Period(XPAR_PMOD_DHB1_0_PWM_BASEADDR);
    PWM_duty_reg = PWM_Get_Duty(XPAR_PMOD_DHB1_0_PWM_BASEADDR, 0);

    xil_printf("PWM Control: 0x%08x\r", PWM_ctrl_reg);
    xil_printf("PWM Status: 0x%08x\r", PWM_status_reg);
    xil_printf("PWM Period: 0x%08x\r", PWM_period_reg);
    xil_printf("PWM Duty: 0x%08x\r", PWM_duty_reg);

    // Motor data
    m1 = XGpio_DiscreteRead(&DHB1_GPIO, M1_CHANNEL);
    m2 = XGpio_DiscreteRead(&DHB1_GPIO, M2_CHANNEL);
    xil_printf("0x%08x, 0x%08x\r", m1, m2);
    delay_ms(3000);
    count++;

    if (count >= 5)
      break;
  }

  // Stop motor
  DHB1_motorDisable(&motor);

  return 0;
}

void delay_ms(int ms)
{
  for (int i = 0; i < 1500 * ms; i++)
    asm("nop");
}

