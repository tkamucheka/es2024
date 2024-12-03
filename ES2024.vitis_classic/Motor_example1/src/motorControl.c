/**
 * motorControl.c
 *
 *  Created on: Jul 14, 2017
 *      Author: Arvin Tang
 *
 *  This file contains functions for initializing ArtyBot inputs and outputs and
 *  functions to check speeds and positions of the motors
**/

/************ Include Files ************/

#include <stdlib.h>
#include "xil_printf.h"
#include "motorControl.h"

// /************ Global Variables ************/

// XGpio *xgpio0; // Pmod DHB1 GPIO
// XGpio *xgpio1; // Switches and LEDs

// /************ Function Definitions ************/

// #define MOTOR1_FORWARD XGpio_DiscreteWrite(xgpio0, M1_CHANNEL, 0x0)
// #define MOTOR1_BACKWARD XGpio_DiscreteWrite(xgpio0, M1_CHANNEL, 0x1)
// #define MOTOR2_FORWARD XGpio_DiscreteWrite(xgpio0, M2_CHANNEL, 0x1)
// #define MOTOR2_BACKWARD XGpio_DiscreteWrite(xgpio0, M2_CHANNEL, 0x0)

/*
 * void initIO()
 * ------------------------------------------------------------------------
 * Parameters:
 *       none
 *
 * Return:
 *       void
 *
 * Description:
 *       Initialize Arty Board inputs and outputs
 */
void initIO()
{
  // Initialize XGpio structs
  xgpio0 = (XGpio *)calloc(1, sizeof(XGpio));
  xgpio1 = (XGpio *)calloc(1, sizeof(XGpio));
  DHB1_GPIO_Initialize(xgpio0, XPAR_PMOD_DHB1_0_GPIO_BASEADDR);
  XGpio_Initialize(xgpio1, GPIO_1_DEV_ID);

  // xil_printf("init\r");

  // Initialize XGpio_Config structs
  // xgpio_cfg0 = XGpio_LookupConfig(GPIO_0_DEV_ID);
  // xgpio_cfg1 = XGpio_LookupConfig(GPIO_1_DEV_ID);

  // Set directions
  XGpio_SetDataDirection(xgpio0, M1_CHANNEL, 0xC);
  XGpio_SetDataDirection(xgpio0, M2_CHANNEL, 0xC);
  XGpio_SetDataDirection(xgpio1, SW_CHANNEL, 0xF);
  XGpio_SetDataDirection(xgpio1, LED_CHANNEL, 0x0);
}

/*
 * endIO()
 * ------------------------------------------------------------------------
 * Parameters:
 *       none
 *
 * Return:
 *       void
 *
 * Description:
 *       Clean up Arty Board initializations
 */
void endIO()
{
  free(xgpio0);
  free(xgpio1);
}

/*
 * measureSpeed(int motor_speed[])
 * ------------------------------------------------------------------------
 * Parameters:
 *       motor_speed: Array to store motor speeds
 *
 * Return:
 *       void
 *
 * Description:
 *       Measure current angular speeds of the motor1 and motor2 (RPM) and store
 *       them in motor_speed. Clears counts after taking measurements
 */
void measureSpeed(MotorFeedback *instancePtr, int motor_speed[])
{
  int m1[2];
  int m2[2];

  // getEdgeCounts(MOTORFB_BASEADDR, m1, m2);
  MotorFeedback_getEdgeCounts(instancePtr, m1, m2);

  // Compute wheel speeds in RPM
  // The full computation is 0.25 * 60 / 48 * sens * CLK_FREQ / clk
  // 0.25 turn of the magnetic encoder disk per sensor edge,
  // 60 sec/min to convert rev/sec to rev/min,
  // 48 is the gearbox ratio of the motor
  // Constants at beginning of expression have been combined to 0.3125
  motor_speed[0] = 0.3125 * m1[0] * CLK_FREQ / m1[1];
  motor_speed[1] = 0.3125 * m2[0] * CLK_FREQ / m2[1];
  // clearSpeedCounters(MOTORFB_BASEADDR);
  MotorFeedback_clearSpeedCounters(instancePtr);
}

/*
 * int16_t getDistanceTraveled()
 * ------------------------------------------------------------------------
 * Parameters:
 *       none
 *
 * Return:
 *       Mean distance traveled by motor1 and motor2
 *
 * Description:
 *       Return mean distance traveled by motor1 and motor2
 */
int16_t getDistanceTraveled(MotorFeedback *instancePtr)
{
  int16_t motor_pos[2];
  // getMotorPositions(MOTORFB_BASEADDR, motor_pos);
  MotorFeedback_getPositions(instancePtr, motor_pos);
  return (motor_pos[0] + motor_pos[1]) / 2;
}
