#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /opt/Xilinx/Projects/scatter_dma/awgn/solution1/.autopilot/db/a.g.bc ${1+"$@"}
