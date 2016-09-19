; ModuleID = '/opt/Xilinx/Projects/scatter_dma/awgn/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@store_val = internal unnamed_addr global i1 true, align 1
@store_g = internal unnamed_addr global float 0.000000e+00, align 4
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@cur = internal unnamed_addr global i16 -21279, align 2
@awgn_str = internal unnamed_addr constant [5 x i8] c"awgn\00"
@p_str5 = private unnamed_addr constant [13 x i8] c"control_axil\00", align 1
@p_str4 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1
@p_str3 = private unnamed_addr constant [12 x i8] c"output_axis\00", align 1
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str1 = private unnamed_addr constant [11 x i8] c"input_axis\00", align 1
@p_str = private unnamed_addr constant [5 x i8] c"axis\00", align 1

declare double @llvm.sqrt.f64(double) nounwind readonly

declare i62 @llvm.part.select.i62(i62, i32, i32) nounwind readnone

declare i32 @llvm.part.select.i32(i32, i32, i32) nounwind readnone

declare i16 @llvm.part.select.i16(i16, i32, i32) nounwind readnone

declare double @llvm.log.f64(double) nounwind readonly

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @awgn(i16 signext %input_axis, i16* %output_axis, i32* %stdd, i1* %enable) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %input_axis) nounwind, !map !20
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %output_axis) nounwind, !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %stdd) nounwind, !map !30
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %enable) nounwind, !map !34
  call void (...)* @_ssdm_op_SpecTopModule([5 x i8]* @awgn_str) nounwind
  %input_axis_read = call i16 @_ssdm_op_Read.axis.i16(i16 %input_axis) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i16 %input_axis, [5 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [11 x i8]* @p_str1, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i16* %output_axis, [5 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [12 x i8]* @p_str3, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32* %stdd, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i1* %enable, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind
  %enable_read = call i1 @_ssdm_op_Read.s_axilite.i1P(i1* %enable) nounwind
  br i1 %enable_read, label %1, label %3

; <label>:1                                       ; preds = %0
  %store_val_load = load i1* @store_val, align 1
  br i1 %store_val_load, label %.preheader.preheader, label %_ifconv

.preheader.preheader:                             ; preds = %1
  %cur_load = load i16* @cur, align 2
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %ret = phi i16 [ %cur_load, %.preheader.preheader ], [ %tmp_8_i, %.preheader ]
  %tmp_i = call i14 @_ssdm_op_PartSelect.i14.i16.i32.i32(i16 %ret, i32 2, i32 15)
  %tmp_25 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ret, i32 3)
  %tmp_26 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ret, i32 5)
  %tmp_27 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ret, i32 2)
  %tmp_28 = trunc i16 %ret to i1
  %tmp2 = xor i1 %tmp_25, %tmp_26
  %tmp_29 = xor i1 %tmp_27, %tmp_28
  %tmp_6_i = call i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16 %ret, i32 1, i32 15)
  %tmp_30 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ret, i32 1)
  %tmp_i_8 = xor i1 %tmp2, %tmp_29
  %ret_1 = call i16 @_ssdm_op_BitConcatenate.i16.i1.i15(i1 %tmp_i_8, i15 %tmp_6_i)
  %tmp_33 = zext i16 %ret to i32
  %tmp_2 = uitofp i32 %tmp_33 to float
  %u1 = fmul float %tmp_2, 0x3EF0000000000000
  %tmp_34 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ret, i32 4)
  %tmp_35 = call i1 @_ssdm_op_BitSelect.i1.i16.i32(i16 %ret, i32 6)
  %tmp3 = xor i1 %tmp_25, %tmp_30
  %tmp4 = xor i1 %tmp_34, %tmp_35
  %tmp_5_i7 = xor i1 %tmp4, %tmp3
  %tmp_8_i = call i16 @_ssdm_op_BitConcatenate.i16.i1.i1.i14(i1 %tmp_5_i7, i1 %tmp_i_8, i14 %tmp_i)
  %tmp_36 = zext i16 %ret_1 to i32
  %tmp_3 = uitofp i32 %tmp_36 to float
  %u2 = fmul float %tmp_3, 0x3EF0000000000000
  %tmp_4 = fmul float %u1, 2.000000e+00
  %u1_1 = fadd float %tmp_4, -1.000000e+00
  %tmp_5 = fmul float %u2, 2.000000e+00
  %u2_1 = fadd float %tmp_5, -1.000000e+00
  %tmp_6 = fmul float %u1_1, %u1_1
  %tmp_7 = fmul float %u2_1, %u2_1
  %w = fadd float %tmp_6, %tmp_7
  %w_to_int = bitcast float %w to i32
  %tmp_8 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %w_to_int, i32 23, i32 30)
  %tmp_37 = trunc i32 %w_to_int to i23
  %notlhs = icmp ne i8 %tmp_8, -1
  %notrhs = icmp eq i23 %tmp_37, 0
  %tmp_21 = or i1 %notrhs, %notlhs
  %tmp_22 = fcmp oge float %w, 1.000000e+00
  %tmp_23 = and i1 %tmp_21, %tmp_22
  br i1 %tmp_23, label %.preheader, label %_ifconv1

_ifconv1:                                         ; preds = %.preheader
  store i16 %tmp_8_i, i16* @cur, align 2
  %tmp_9 = fpext float %w to double
  %tmp_10 = call double @llvm.log.f64(double %tmp_9)
  %tmp_11 = fmul double %tmp_10, -2.000000e+00
  %tmp_12 = fdiv double %tmp_11, %tmp_9
  %tmp_13 = call double @llvm.sqrt.f64(double %tmp_12)
  %w_1 = fptrunc double %tmp_13 to float
  %tmp_14 = fmul float %u1_1, %w_1
  %stdd_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %stdd) nounwind
  %tmp_15 = uitofp i32 %stdd_read to float
  %tmp_16 = fmul float %tmp_14, %tmp_15
  %tmp_17 = fmul float %u2_1, %w_1
  %tmp_18 = fmul float %tmp_17, %tmp_15
  store float %tmp_18, float* @store_g, align 4
  %tmp_38 = sext i16 %input_axis_read to i32
  %tmp_19 = sitofp i32 %tmp_38 to float
  %x_assign = fadd float %tmp_19, %tmp_16
  %p_Val2_6 = bitcast float %x_assign to i32
  %p_Result_s = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %p_Val2_6, i32 31)
  %loc_V = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_Val2_6, i32 23, i32 30) nounwind
  %loc_V_3 = trunc i32 %p_Val2_6 to i23
  %p_Result_1 = call i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1 true, i23 %loc_V_3) nounwind
  %tmp_i_i = zext i24 %p_Result_1 to i62
  %tmp_i_i_i_cast6 = zext i8 %loc_V to i9
  %sh_assign_2 = add i9 -127, %tmp_i_i_i_cast6
  %isNeg_1 = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign_2, i32 8)
  %tmp_1_i_i = sub i8 127, %loc_V
  %tmp_1_i_i_cast = sext i8 %tmp_1_i_i to i9
  %sh_assign_3 = select i1 %isNeg_1, i9 %tmp_1_i_i_cast, i9 %sh_assign_2
  %sh_assign_3_cast = sext i9 %sh_assign_3 to i32
  %sh_assign_3_cast_cast = sext i9 %sh_assign_3 to i24
  %tmp_2_i_i = zext i32 %sh_assign_3_cast to i62
  %tmp_3_i_i = lshr i24 %p_Result_1, %sh_assign_3_cast_cast
  %tmp_5_i_i = shl i62 %tmp_i_i, %tmp_2_i_i
  %tmp_42 = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %tmp_3_i_i, i32 23)
  %tmp_31 = zext i1 %tmp_42 to i16
  %tmp_32 = call i16 @_ssdm_op_PartSelect.i16.i62.i32.i32(i62 %tmp_5_i_i, i32 23, i32 38)
  %p_Val2_9 = select i1 %isNeg_1, i16 %tmp_31, i16 %tmp_32
  %p_Val2_7_i_i = sub i16 0, %p_Val2_9
  %p_Val2_11 = select i1 %p_Result_s, i16 %p_Val2_7_i_i, i16 %p_Val2_9
  br label %2

_ifconv:                                          ; preds = %1
  %tmp_1 = sext i16 %input_axis_read to i32
  %tmp_s = sitofp i32 %tmp_1 to float
  %store_g_load = load float* @store_g, align 4
  %x_assign_2 = fadd float %tmp_s, %store_g_load
  %p_Val2_s = bitcast float %x_assign_2 to i32
  %p_Result_2 = call i1 @_ssdm_op_BitSelect.i1.i32.i32(i32 %p_Val2_s, i32 31)
  %loc_V_4 = call i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32 %p_Val2_s, i32 23, i32 30) nounwind
  %loc_V_5 = trunc i32 %p_Val2_s to i23
  %p_Result_3 = call i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1 true, i23 %loc_V_5) nounwind
  %tmp_i_i1 = zext i24 %p_Result_3 to i62
  %tmp_i_i_i1_cast5 = zext i8 %loc_V_4 to i9
  %sh_assign = add i9 -127, %tmp_i_i_i1_cast5
  %isNeg = call i1 @_ssdm_op_BitSelect.i1.i9.i32(i9 %sh_assign, i32 8)
  %tmp_1_i_i1 = sub i8 127, %loc_V_4
  %tmp_1_i_i1_cast = sext i8 %tmp_1_i_i1 to i9
  %sh_assign_1 = select i1 %isNeg, i9 %tmp_1_i_i1_cast, i9 %sh_assign
  %sh_assign_1_cast = sext i9 %sh_assign_1 to i32
  %sh_assign_1_cast_cast = sext i9 %sh_assign_1 to i24
  %tmp_2_i_i1 = zext i32 %sh_assign_1_cast to i62
  %tmp_3_i_i1 = lshr i24 %p_Result_3, %sh_assign_1_cast_cast
  %tmp_5_i_i1 = shl i62 %tmp_i_i1, %tmp_2_i_i1
  %tmp = call i1 @_ssdm_op_BitSelect.i1.i24.i32(i24 %tmp_3_i_i1, i32 23)
  %tmp_20 = zext i1 %tmp to i16
  %tmp_24 = call i16 @_ssdm_op_PartSelect.i16.i62.i32.i32(i62 %tmp_5_i_i1, i32 23, i32 38)
  %p_Val2_3 = select i1 %isNeg, i16 %tmp_20, i16 %tmp_24
  %p_Val2_7_i_i1 = sub i16 0, %p_Val2_3
  %p_Val2_5 = select i1 %p_Result_2, i16 %p_Val2_7_i_i1, i16 %p_Val2_3
  br label %2

; <label>:2                                       ; preds = %_ifconv, %_ifconv1
  %storemerge1 = phi i16 [ %p_Val2_11, %_ifconv1 ], [ %p_Val2_5, %_ifconv ]
  %storemerge = phi i1 [ false, %_ifconv1 ], [ true, %_ifconv ]
  call void @_ssdm_op_Write.axis.i16P(i16* %output_axis, i16 %storemerge1) nounwind
  store i1 %storemerge, i1* @store_val, align 1
  br label %4

; <label>:3                                       ; preds = %0
  call void @_ssdm_op_Write.axis.i16P(i16* %output_axis, i16 %input_axis_read) nounwind
  br label %4

; <label>:4                                       ; preds = %3, %2
  ret void
}

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

define weak i8 @_ssdm_op_PartSelect.i8.i32.i32.i32(i32, i32, i32) nounwind readnone {
entry:
  %empty = call i32 @llvm.part.select.i32(i32 %0, i32 %1, i32 %2)
  %empty_9 = trunc i32 %empty to i8
  ret i8 %empty_9
}

declare i23 @_ssdm_op_PartSelect.i23.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i16 @_ssdm_op_PartSelect.i16.i62.i32.i32(i62, i32, i32) nounwind readnone {
entry:
  %empty = call i62 @llvm.part.select.i62(i62 %0, i32 %1, i32 %2)
  %empty_10 = trunc i62 %empty to i16
  ret i16 %empty_10
}

define weak i15 @_ssdm_op_PartSelect.i15.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_11 = trunc i16 %empty to i15
  ret i15 %empty_11
}

define weak i14 @_ssdm_op_PartSelect.i14.i16.i32.i32(i16, i32, i32) nounwind readnone {
entry:
  %empty = call i16 @llvm.part.select.i16(i16 %0, i32 %1, i32 %2)
  %empty_12 = trunc i16 %empty to i14
  ret i14 %empty_12
}

declare i1 @_ssdm_op_PartSelect.i1.i16.i32.i32(i16, i32, i32) nounwind readnone

define weak i1 @_ssdm_op_BitSelect.i1.i9.i32(i9, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i9
  %empty_13 = shl i9 1, %empty
  %empty_14 = and i9 %0, %empty_13
  %empty_15 = icmp ne i9 %empty_14, 0
  ret i1 %empty_15
}

define weak i1 @_ssdm_op_BitSelect.i1.i32.i32(i32, i32) nounwind readnone {
entry:
  %empty = shl i32 1, %1
  %empty_16 = and i32 %0, %empty
  %empty_17 = icmp ne i32 %empty_16, 0
  ret i1 %empty_17
}

define weak i1 @_ssdm_op_BitSelect.i1.i24.i32(i24, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i24
  %empty_18 = shl i24 1, %empty
  %empty_19 = and i24 %0, %empty_18
  %empty_20 = icmp ne i24 %empty_19, 0
  ret i1 %empty_20
}

define weak i1 @_ssdm_op_BitSelect.i1.i16.i32(i16, i32) nounwind readnone {
entry:
  %empty = trunc i32 %1 to i16
  %empty_21 = shl i16 1, %empty
  %empty_22 = and i16 %0, %empty_21
  %empty_23 = icmp ne i16 %empty_22, 0
  ret i1 %empty_23
}

define weak i24 @_ssdm_op_BitConcatenate.i24.i1.i23(i1, i23) nounwind readnone {
entry:
  %empty = zext i1 %0 to i24
  %empty_24 = zext i23 %1 to i24
  %empty_25 = shl i24 %empty, 23
  %empty_26 = or i24 %empty_25, %empty_24
  ret i24 %empty_26
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i1.i15(i1, i15) nounwind readnone {
entry:
  %empty = zext i1 %0 to i16
  %empty_27 = zext i15 %1 to i16
  %empty_28 = shl i16 %empty, 15
  %empty_29 = or i16 %empty_28, %empty_27
  ret i16 %empty_29
}

define weak i16 @_ssdm_op_BitConcatenate.i16.i1.i1.i14(i1, i1, i14) nounwind readnone {
entry:
  %empty = zext i1 %1 to i15
  %empty_30 = zext i14 %2 to i15
  %empty_31 = shl i15 %empty, 14
  %empty_32 = or i15 %empty_31, %empty_30
  %empty_33 = zext i1 %0 to i16
  %empty_34 = zext i15 %empty_32 to i16
  %empty_35 = shl i16 %empty_33, 15
  %empty_36 = or i16 %empty_35, %empty_34
  ret i16 %empty_36
}

declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!13}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space"}
!2 = metadata !{metadata !"kernel_arg_access_qual"}
!3 = metadata !{metadata !"kernel_arg_type"}
!4 = metadata !{metadata !"kernel_arg_type_qual"}
!5 = metadata !{metadata !"kernel_arg_name"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{void (i16, i16*, i32*, i1*)* @awgn, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1, i32 1}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t*", metadata !"uint32_t*", metadata !"_Bool*"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"input_data", metadata !"output_data", metadata !"stdd", metadata !"enable"}
!13 = metadata !{metadata !14, [1 x i32]* @llvm_global_ctors_0}
!14 = metadata !{metadata !15}
!15 = metadata !{i32 0, i32 31, metadata !16}
!16 = metadata !{metadata !17}
!17 = metadata !{metadata !"llvm.global_ctors.0", metadata !18, metadata !"", i32 0, i32 31}
!18 = metadata !{metadata !19}
!19 = metadata !{i32 0, i32 0, i32 1}
!20 = metadata !{metadata !21}
!21 = metadata !{i32 0, i32 15, metadata !22}
!22 = metadata !{metadata !23}
!23 = metadata !{metadata !"input_data", metadata !24, metadata !"short", i32 0, i32 15}
!24 = metadata !{metadata !25}
!25 = metadata !{i32 0, i32 0, i32 0}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 15, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"output_data", metadata !18, metadata !"short", i32 0, i32 15}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 31, metadata !32}
!32 = metadata !{metadata !33}
!33 = metadata !{metadata !"stdd", metadata !18, metadata !"unsigned int", i32 0, i32 31}
!34 = metadata !{metadata !35}
!35 = metadata !{i32 0, i32 0, metadata !36}
!36 = metadata !{metadata !37}
!37 = metadata !{metadata !"enable", metadata !18, metadata !"_Bool", i32 0, i32 0}
