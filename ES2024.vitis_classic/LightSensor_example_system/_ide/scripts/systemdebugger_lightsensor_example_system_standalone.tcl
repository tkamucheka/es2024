# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/LightSensor_example_system/_ide/scripts/systemdebugger_lightsensor_example_system_standalone.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/LightSensor_example_system/_ide/scripts/systemdebugger_lightsensor_example_system_standalone.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Arty A7-100T 210319BCC40CA" && level==0 && jtag_device_ctx=="jsn-Arty A7-100T-210319BCC40CA-13631093-0"}
fpga -file /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/LightSensor_example/_ide/bitstream/base_soc_wrapper.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/baremetal/export/baremetal/hw/base_soc_wrapper.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/LightSensor_example/Debug/LightSensor_example.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
