# Runtime Tcl commands to interact with - Pmod_DHB1

# Sourcing design address info tcl
set bd_path [get_property DIRECTORY [current_project]]/[current_project].srcs/[current_fileset]/bd
source ${bd_path}/Pmod_DHB1_include.tcl

# jtag axi master interface hardware name, change as per your design.
set jtag_axi_master hw_axi_1
set ec 0

# hw test script
# Delete all previous axis transactions
if { [llength [get_hw_axi_txns -quiet]] } {
	delete_hw_axi_txn [get_hw_axi_txns -quiet]
}


# Test all lite slaves.
set wdata_1 abcd1234

# Test: S_AXI_GPIO
# Create a write transaction at s_axi_gpio_addr address
create_hw_axi_txn w_s_axi_gpio_addr [get_hw_axis $jtag_axi_master] -type write -address $s_axi_gpio_addr -data $wdata_1
# Create a read transaction at s_axi_gpio_addr address
create_hw_axi_txn r_s_axi_gpio_addr [get_hw_axis $jtag_axi_master] -type read -address $s_axi_gpio_addr
# Initiate transactions
run_hw_axi r_s_axi_gpio_addr
run_hw_axi w_s_axi_gpio_addr
run_hw_axi r_s_axi_gpio_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_s_axi_gpio_addr]]
# Compare read data
if { $rdata_tmp == $wdata_1 } {
	puts "Data comparison test pass for - S_AXI_GPIO"
} else {
	puts "Data comparison test fail for - S_AXI_GPIO, expected-$wdata_1 actual-$rdata_tmp"
	inc ec
}

# Test: S_AXI_PWM
# Create a write transaction at s_axi_pwm_addr address
create_hw_axi_txn w_s_axi_pwm_addr [get_hw_axis $jtag_axi_master] -type write -address $s_axi_pwm_addr -data $wdata_1
# Create a read transaction at s_axi_pwm_addr address
create_hw_axi_txn r_s_axi_pwm_addr [get_hw_axis $jtag_axi_master] -type read -address $s_axi_pwm_addr
# Initiate transactions
run_hw_axi r_s_axi_pwm_addr
run_hw_axi w_s_axi_pwm_addr
run_hw_axi r_s_axi_pwm_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_s_axi_pwm_addr]]
# Compare read data
if { $rdata_tmp == $wdata_1 } {
	puts "Data comparison test pass for - S_AXI_PWM"
} else {
	puts "Data comparison test fail for - S_AXI_PWM, expected-$wdata_1 actual-$rdata_tmp"
	inc ec
}

# Test: S_AXI_MOTOR_FB
# Create a write transaction at s_axi_motor_fb_addr address
create_hw_axi_txn w_s_axi_motor_fb_addr [get_hw_axis $jtag_axi_master] -type write -address $s_axi_motor_fb_addr -data $wdata_1
# Create a read transaction at s_axi_motor_fb_addr address
create_hw_axi_txn r_s_axi_motor_fb_addr [get_hw_axis $jtag_axi_master] -type read -address $s_axi_motor_fb_addr
# Initiate transactions
run_hw_axi r_s_axi_motor_fb_addr
run_hw_axi w_s_axi_motor_fb_addr
run_hw_axi r_s_axi_motor_fb_addr
set rdata_tmp [get_property DATA [get_hw_axi_txn r_s_axi_motor_fb_addr]]
# Compare read data
if { $rdata_tmp == $wdata_1 } {
	puts "Data comparison test pass for - S_AXI_MOTOR_FB"
} else {
	puts "Data comparison test fail for - S_AXI_MOTOR_FB, expected-$wdata_1 actual-$rdata_tmp"
	inc ec
}

# Check error flag
if { $ec == 0 } {
	 puts "PTGEN_TEST: PASSED!" 
} else {
	 puts "PTGEN_TEST: FAILED!" 
}

