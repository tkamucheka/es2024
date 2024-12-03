# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "C_S_AXI_MOTOR_FB_DATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_AXI_MOTOR_FB_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_MOTOR_FB_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_MOTOR_FB_HIGHADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_PWM_DATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_AXI_PWM_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_PWM_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_PWM_HIGHADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_GPIO_DATA_WIDTH" -parent ${Page_0} -widget comboBox
  ipgui::add_param $IPINST -name "C_S_AXI_GPIO_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_GPIO_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_GPIO_HIGHADDR" -parent ${Page_0}


}

proc update_PARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH { PARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_MOTOR_FB_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH { PARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_MOTOR_FB_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_MOTOR_FB_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_MOTOR_FB_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_MOTOR_FB_BASEADDR { PARAM_VALUE.C_S_AXI_MOTOR_FB_BASEADDR } {
	# Procedure called to update C_S_AXI_MOTOR_FB_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MOTOR_FB_BASEADDR { PARAM_VALUE.C_S_AXI_MOTOR_FB_BASEADDR } {
	# Procedure called to validate C_S_AXI_MOTOR_FB_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_MOTOR_FB_HIGHADDR { PARAM_VALUE.C_S_AXI_MOTOR_FB_HIGHADDR } {
	# Procedure called to update C_S_AXI_MOTOR_FB_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MOTOR_FB_HIGHADDR { PARAM_VALUE.C_S_AXI_MOTOR_FB_HIGHADDR } {
	# Procedure called to validate C_S_AXI_MOTOR_FB_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH { PARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_PWM_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH { PARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_PWM_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_PWM_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_PWM_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_PWM_BASEADDR { PARAM_VALUE.C_S_AXI_PWM_BASEADDR } {
	# Procedure called to update C_S_AXI_PWM_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_PWM_BASEADDR { PARAM_VALUE.C_S_AXI_PWM_BASEADDR } {
	# Procedure called to validate C_S_AXI_PWM_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_PWM_HIGHADDR { PARAM_VALUE.C_S_AXI_PWM_HIGHADDR } {
	# Procedure called to update C_S_AXI_PWM_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_PWM_HIGHADDR { PARAM_VALUE.C_S_AXI_PWM_HIGHADDR } {
	# Procedure called to validate C_S_AXI_PWM_HIGHADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH { PARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_GPIO_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH { PARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_GPIO_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_GPIO_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_GPIO_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_GPIO_BASEADDR { PARAM_VALUE.C_S_AXI_GPIO_BASEADDR } {
	# Procedure called to update C_S_AXI_GPIO_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_GPIO_BASEADDR { PARAM_VALUE.C_S_AXI_GPIO_BASEADDR } {
	# Procedure called to validate C_S_AXI_GPIO_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S_AXI_GPIO_HIGHADDR { PARAM_VALUE.C_S_AXI_GPIO_HIGHADDR } {
	# Procedure called to update C_S_AXI_GPIO_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_GPIO_HIGHADDR { PARAM_VALUE.C_S_AXI_GPIO_HIGHADDR } {
	# Procedure called to validate C_S_AXI_GPIO_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH PARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_MOTOR_FB_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH PARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_MOTOR_FB_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH PARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_PWM_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH PARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_PWM_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH PARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_GPIO_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH PARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_GPIO_ADDR_WIDTH}
}

