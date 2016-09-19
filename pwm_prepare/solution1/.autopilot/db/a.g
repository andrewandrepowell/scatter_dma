#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /opt/Xilinx/Projects/scatter_dma/pwm_prepare/solution1/.autopilot/db/a.g.bc ${1+"$@"}
