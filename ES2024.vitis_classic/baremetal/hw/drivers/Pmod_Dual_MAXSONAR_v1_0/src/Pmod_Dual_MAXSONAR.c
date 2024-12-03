

/***************************** Include Files *******************************/
#include "Pmod_Dual_MAXSONAR.h"

/**
 * Initialize the PMOD_DUAL_MAXSONAR instance. This function must be called
 * before any other functions.
 *
 * @param InstancePtr is the PMOD_DUAL_MAXSONAR instance to be worked on.
 * @param BaseAddress is the base address of the device.
 * @param ClockFreq is the clock frequency of the device.
 * @return void
 */
void MAXSONAR_begin(PMOD_DUAL_MAXSONAR *InstancePtr, u32 BaseAddress,
                    u32 ClockFreq) {
  InstancePtr->BaseAddress = BaseAddress;
  InstancePtr->ClockFreq = ClockFreq;
  InstancePtr->IsReady = 1;
}

/**
 * Get the distance from the sensor.
 *
 * @param InstancePtr is the PMOD_DUAL_MAXSONAR instance to be worked on.
 * @param channel is the sensor to get the distance from.
 * @return the distance from the sensor.
 */
u32 MAXSONAR_getDistance(PMOD_DUAL_MAXSONAR *InstancePtr, u32 channel) {
  u32 reg = PMOD_DUAL_MAXSONAR_PWM_0_HIGH_OFFSET +
            ((channel - 1) * MAXSONAR_CHANNEL_2_OFFSET);
  u32 clk_edges = PMOD_DUAL_MAXSONAR_mReadReg(InstancePtr->BaseAddress, reg);
  u32 dist_10x = (u32)(clk_edges * 10000000 / InstancePtr->ClockFreq / 147);

  return (dist_10x + 5) / 10;
}

/************************** Function Definitions ***************************/
