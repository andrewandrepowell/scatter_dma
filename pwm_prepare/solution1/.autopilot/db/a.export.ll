; ModuleID = '/opt/Xilinx/Projects/scatter_dma/pwm_prepare/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@pwm_prepare_str = internal unnamed_addr constant [12 x i8] c"pwm_prepare\00"
@p_str5 = private unnamed_addr constant [13 x i8] c"control_axil\00", align 1
@p_str4 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str3 = private unnamed_addr constant [12 x i8] c"output_axis\00", align 1
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str1 = private unnamed_addr constant [11 x i8] c"input_axis\00", align 1
@p_str = private unnamed_addr constant [5 x i8] c"axis\00", align 1

define void @pwm_prepare(i16 signext %input_axis, i16* %output_axis, i32* %shift_val, i32* %sum_val, i1* %enable_flag) nounwind uwtable {
_ifconv:
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %input_axis) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %output_axis) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %shift_val) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %sum_val) nounwind, !map !23
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %enable_flag) nounwind, !map !27
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @pwm_prepare_str) nounwind
  %input_axis_read = call i16 @_ssdm_op_Read.axis.i16(i16 %input_axis) nounwind
  %tmp = sext i16 %input_axis_read to i32
  call void (...)* @_ssdm_op_SpecInterface(i16 %input_axis, [5 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [11 x i8]* @p_str1, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i16* %output_axis, [5 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [12 x i8]* @p_str3, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %shift_val, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %sum_val, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i1* %enable_flag, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  %enable_flag_read = call i1 @_ssdm_op_Read.s_axilite.i1P(i1* %enable_flag) nounwind
  %shift_val_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %shift_val) nounwind
  %tmp_1 = ashr i32 %tmp, %shift_val_read
  %sum_val_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %sum_val) nounwind
  %tmp_2 = add i32 %sum_val_read, %tmp_1
  %tmp_3 = trunc i32 %tmp_2 to i16
  %storemerge = select i1 %enable_flag_read, i16 %tmp_3, i16 0
  call void @_ssdm_op_Write.axis.i16P(i16* %output_axis, i16 %storemerge) nounwind
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define weak void @_ssdm_op_Write.axis.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_Read.s_axilite.i32P(i32*) {
entry:
  %empty = load i32* %0
  ret i32 %empty
}

define weak i1 @_ssdm_op_Read.s_axilite.i1P(i1*) {
entry:
  %empty = load i1* %0
  ret i1 %empty
}

define weak i16 @_ssdm_op_Read.axis.i16(i16) {
entry:
  ret i16 %0
}

declare i16 @_ssdm_op_PartSelect.i16.i32.i32.i32(i32, i32, i32) nounwind readnone

!opencl.kernels = !{!0}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{void (i16, i16*, i32*, i32*, i1*)* @pwm_prepare, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1, i32 1, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t*", metadata !"uint32_t*", metadata !"uint32_t*", metadata !"_Bool*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"in_data", metadata !"out_data", metadata !"shift_val", metadata !"sum_val", metadata !"enable_flag"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{metadata !8}
!8 = metadata !{i32 0, i32 15, metadata !9}
!9 = metadata !{metadata !10}
!10 = metadata !{metadata !"in_data", metadata !11, metadata !"short", i32 0, i32 15}
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0, i32 0, i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{i32 0, i32 15, metadata !15}
!15 = metadata !{metadata !16}
!16 = metadata !{metadata !"out_data", metadata !17, metadata !"short", i32 0, i32 15}
!17 = metadata !{metadata !18}
!18 = metadata !{i32 0, i32 0, i32 1}
!19 = metadata !{metadata !20}
!20 = metadata !{i32 0, i32 31, metadata !21}
!21 = metadata !{metadata !22}
!22 = metadata !{metadata !"shift_val", metadata !17, metadata !"unsigned int", i32 0, i32 31}
!23 = metadata !{metadata !24}
!24 = metadata !{i32 0, i32 31, metadata !25}
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !"sum_val", metadata !17, metadata !"unsigned int", i32 0, i32 31}
!27 = metadata !{metadata !28}
!28 = metadata !{i32 0, i32 0, metadata !29}
!29 = metadata !{metadata !30}
!30 = metadata !{metadata !"enable_flag", metadata !17, metadata !"bool", i32 0, i32 0}
