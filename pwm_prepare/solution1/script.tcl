############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pwm_prepare
set_top pwm_prepare
add_files pwm_prepare/solution1/.tcls/pwm_prepare.cpp
open_solution "solution1"
set_part {xc7a100tcsg324-1} -tool vivado
create_clock -period 100MHz -name default
#source "./pwm_prepare/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
