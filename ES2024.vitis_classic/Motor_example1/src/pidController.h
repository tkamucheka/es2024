/*
 * pidController.h
 *
 *  Created on: Jul 13, 2017
 *      Author: Arvin Tang
 */

#ifndef SRC_PIDCONTROLLER_H_
#define SRC_PIDCONTROLLER_H_

#ifdef __cplusplus
extern "C"
{
#endif

/************ Function Prototypes ************/

void getPosCorrection(int pos_diff, double duty_cycle[]);

void getSpeedCorrection(int speed_sp, int speed[], double duty_cycle[]);

void resetErrors();

#ifdef __cplusplus
}
#endif

#endif /* SRC_PIDCONTROLLER_H_ */
