############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
############################################################
open_project awgn
set_top awgn
add_files awgn/solution1/awgn.c
open_solution "solution1"
set_part {xc7a100tcsg324-1} -tool vivado
create_clock -period 100MHz -name default
#source "./awgn/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
