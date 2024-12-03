

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Pmod_DHB1" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_GPIO_BASEADDR" "C_S_AXI_GPIO_HIGHADDR" "C_S_AXI_PWM_BASEADDR" "C_S_AXI_PWM_HIGHADDR" "C_S_AXI_MOTOR_FB_BASEADDR" "C_S_AXI_MOTOR_FB_HIGHADDR"
}
