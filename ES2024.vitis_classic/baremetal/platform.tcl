# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/baremetal/platform.tcl
# 
# OR launch xsct and run below command.
# source /mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic/baremetal/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {baremetal}\
-hw {/mnt/Rogue/Projects/Vivado/ES2024/base_soc_wrapper.xsa}\
-proc {microblaze_0} -os {standalone} -out {/mnt/Rogue/Projects/Vivado/ES2024/ES2024.vitis_classic}

platform write
platform generate -domains 
platform active {baremetal}
platform generate
