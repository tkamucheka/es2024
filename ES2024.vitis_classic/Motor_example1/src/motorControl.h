/*
 * motorControl.h
 *
 *  Created on: Jul 14, 2017
 *      Author: Arvin Tang
 */

#ifndef SRC_MOTORCONTROL_H_
#define SRC_MOTORCONTROL_H_

#ifdef __cplusplus
extern "C"
{
#endif

  /************ Include Files ************/

#include "xgpio.h"
#include "xparameters.h"
#include "MotorFeedback.h"
#include "PmodDHB1.h"

  /************ Macro Definitions ************/

#define PWM_BASEADDR XPAR_PMOD_DHB1_0_PWM_BASEADDR
#define PWM_PERIOD 0x00029000 // 2ms
#define PWM_DUTY 0x00014800   // 50% duty cycle
#define PWM_M1 0
#define PWM_M2 1

// #define GPIO_0_DEV_ID XPAR_AXI_GPIO_0_DEVICE_ID
#define GPIO_1_DEV_ID XPAR_AXI_GPIO_1_DEVICE_ID

#define M1_CHANNEL 1
#define M2_CHANNEL 2
#define SW_CHANNEL 1
#define LED_CHANNEL 2

#define MOTOR1_FORWARD XGpio_DiscreteWrite(xgpio0, M1_CHANNEL, 0x1)
#define MOTOR1_BACKWARD XGpio_DiscreteWrite(xgpio0, M1_CHANNEL, 0x0)
#define MOTOR2_FORWARD XGpio_DiscreteWrite(xgpio0, M2_CHANNEL, 0x1)
#define MOTOR2_BACKWARD XGpio_DiscreteWrite(xgpio0, M2_CHANNEL, 0x0)

#define MOTORFB_BASEADDR XPAR_PMOD_DHB1_0_MOTOR_FB_BASEADDR
#define MOTORFB_EDGES_PER_REV 4
#define MOTORFB_GEAR_BOX_RATIO 48

#define CLK_FREQ XPAR_CPU_M_AXI_DP_FREQ_HZ

  /************ Global Variables ************/

  XGpio *xgpio0; // Pmod DHB1 GPIO
  XGpio *xgpio1; // Switches and LEDs
  // MotorFeedback *motorFB;

  // XGpio_Config *xgpio_cfg0;
  // XGpio_Config *xgpio_cfg1;

  /************ Function Prototypes ************/

  void initIO();

  void endIO();

  void measureSpeed(MotorFeedback *instancePtr, int motor_speed[]);

  int16_t getDistanceTraveled(MotorFeedback *instancePtr);

#ifdef __cplusplus
}
#endif

#endif /* SRC_MOTORCONTROL_H_ */
