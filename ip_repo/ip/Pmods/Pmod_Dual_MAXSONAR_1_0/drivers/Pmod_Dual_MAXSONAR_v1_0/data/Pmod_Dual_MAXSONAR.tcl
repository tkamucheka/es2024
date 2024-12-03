

proc generate {drv_handle} {
	xdefine_include_file $drv_handle "xparameters.h" "Pmod_Dual_MAXSONAR" "NUM_INSTANCES" "DEVICE_ID"  "C_S_AXI_BASEADDR" "C_S_AXI_HIGHADDR"
}
