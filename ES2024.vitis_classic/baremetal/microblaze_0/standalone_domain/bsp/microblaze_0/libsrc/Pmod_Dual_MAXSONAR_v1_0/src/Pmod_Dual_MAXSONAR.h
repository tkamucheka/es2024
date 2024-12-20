
#ifndef PMOD_DUAL_MAXSONAR_H
#define PMOD_DUAL_MAXSONAR_H

/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define PMOD_DUAL_MAXSONAR_PWM_0_LOW_OFFSET 0
#define PMOD_DUAL_MAXSONAR_PWM_0_HIGH_OFFSET 4
#define PMOD_DUAL_MAXSONAR_PWM_0_PERIOD_OFFSET 8

#define PMOD_DUAL_MAXSONAR_PWM_1_LOW_OFFSET 16
#define PMOD_DUAL_MAXSONAR_PWM_1_HIGH_OFFSET 20
#define PMOD_DUAL_MAXSONAR_PWM_1_PERIOD_OFFSET 24

#define MAXSONAR_CHANNEL_1_OFFSET 0
#define MAXSONAR_CHANNEL_2_OFFSET 16

#define MAXSONAR_1 1
#define MAXSONAR_2 2

/**************************** Type Definitions *****************************/

typedef struct {
  u32 BaseAddress;
  u32 ClockFreq;
  u32 IsReady;
} PMOD_DUAL_MAXSONAR;

/***************** Macros (Inline Functions) Definitions *******************/
/**
 *
 * Write a value to a PMOD_DUAL_MAXSONAR register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the PMOD_DUAL_MAXSONARdevice.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void PMOD_DUAL_MAXSONAR_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define PMOD_DUAL_MAXSONAR_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a PMOD_DUAL_MAXSONAR register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the PMOD_DUAL_MAXSONAR device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 PMOD_DUAL_MAXSONAR_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define PMOD_DUAL_MAXSONAR_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/

/**
 * Initialize the PMOD_DUAL_MAXSONAR instance. This function must be called
 * before any other functions.
 *
 * @param InstancePtr is the PMOD_DUAL_MAXSONAR instance to be worked on.
 * @param BaseAddress is the base address of the device.
 * @param ClockFreq is the clock frequency of the device.
 * @return void
 */
void MAXSONAR_begin(PMOD_DUAL_MAXSONAR *InstancePtr, u32 BaseAddress, u32 ClockFreq);

/**
 * Get the distance from the sensor.
 *
 * @param InstancePtr is the PMOD_DUAL_MAXSONAR instance to be worked on.
 * @param channel is the sensor to get the distance from.
 * @return the distance from the sensor.
 */
u32 MAXSONAR_getDistance(PMOD_DUAL_MAXSONAR *InstancePtr, u32 channel);

/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the PMOD_DUAL_MAXSONAR instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus PMOD_DUAL_MAXSONAR_Reg_SelfTest(void * baseaddr_p);

#endif // PMOD_DUAL_MAXSONAR_H
