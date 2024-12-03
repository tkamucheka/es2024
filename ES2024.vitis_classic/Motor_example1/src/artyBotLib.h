/*
 * artyBotLib.h
 *
 *  Created on: Aug 3, 2017
 *      Author: Arvin Tang
 */

#ifndef SRC_ARTYBOTLIB_H_
#define SRC_ARTYBOTLIB_H_

#ifdef __cplusplus
extern "C"
{
#endif

/************ Function Prototypes ************/

void artyBotInit();

void artyBotEnd();

void driveForward(double distance);

void driveBackward(double distance);

void turnLeft(int degrees);

void turnRight(int degrees);

void driveForwardContinuous(double distance);

void driveBackwardContinuous(double distance);

void turnLeftContinuous(int degrees);

void turnRightContinuous(int degrees);

void swingTurnLeft(int degrees);

void swingTurnRight(int degrees);

void delayUntilStop();

#ifdef __cplusplus
}
#endif

#endif /* SRC_ARTYBOTLIB_H_ */
