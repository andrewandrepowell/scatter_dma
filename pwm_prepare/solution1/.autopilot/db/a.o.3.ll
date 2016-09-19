; ModuleID = '/opt/Xilinx/Projects/scatter_dma/pwm_prepare/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@pwm_prepare_str = internal unnamed_addr constant [12 x i8] c"pwm_prepare\00" ; [#uses=1 type=[12 x i8]*]
@p_str5 = private unnamed_addr constant [13 x i8] c"control_axil\00", align 1 ; [#uses=4 type=[13 x i8]*]
@p_str4 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=4 type=[10 x i8]*]
@p_str3 = private unnamed_addr constant [12 x i8] c"output_axis\00", align 1 ; [#uses=1 type=[12 x i8]*]
@p_str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=18 type=[1 x i8]*]
@p_str1 = private unnamed_addr constant [11 x i8] c"input_axis\00", align 1 ; [#uses=1 type=[11 x i8]*]
@p_str = private unnamed_addr constant [5 x i8] c"axis\00", align 1 ; [#uses=2 type=[5 x i8]*]

; [#uses=0]
define void @pwm_prepare(i16 signext %input_axis, i16* %output_axis, i32* %shift_val, i32* %sum_val, i1* %enable_flag) nounwind uwtable {
_ifconv:
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %input_axis) nounwind, !map !7
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %output_axis) nounwind, !map !13
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %shift_val) nounwind, !map !19
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %sum_val) nounwind, !map !23
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %enable_flag) nounwind, !map !27
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @pwm_prepare_str) nounwind
  %input_axis_read = call i16 @_ssdm_op_Read.axis.i16(i16 %input_axis) nounwind ; [#uses=1 type=i16]
  call void @llvm.dbg.value(metadata !{i16 %input_axis_read}, i64 0, metadata !31), !dbg !46 ; [debug line = 3:27] [debug variable = in_data]
  call void @llvm.dbg.value(metadata !{i16 %input_axis}, i64 0, metadata !31), !dbg !46 ; [debug line = 3:27] [debug variable = in_data]
  call void @llvm.dbg.value(metadata !{i16* %output_axis}, i64 0, metadata !47), !dbg !48 ; [debug line = 3:45] [debug variable = out_data]
  call void @llvm.dbg.value(metadata !{i32* %shift_val}, i64 0, metadata !49), !dbg !50 ; [debug line = 3:65] [debug variable = shift_val]
  call void @llvm.dbg.value(metadata !{i32* %sum_val}, i64 0, metadata !51), !dbg !52 ; [debug line = 3:86] [debug variable = sum_val]
  call void @llvm.dbg.value(metadata !{i1* %enable_flag}, i64 0, metadata !53), !dbg !54 ; [debug line = 3:101] [debug variable = enable_flag]
  %tmp = sext i16 %input_axis_read to i32, !dbg !55 ; [#uses=1 type=i32] [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecInterface(i16 %input_axis, [5 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [11 x i8]* @p_str1, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !55 ; [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecInterface(i16* %output_axis, [5 x i8]* @p_str, i32 0, i32 0, i32 0, i32 0, [12 x i8]* @p_str3, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !57 ; [debug line = 6:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %shift_val, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !58 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %sum_val, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !59 ; [debug line = 8:1]
  call void (...)* @_ssdm_op_SpecInterface(i1* %enable_flag, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !60 ; [debug line = 9:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @p_str5, [1 x i8]* @p_str2, [1 x i8]* @p_str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str2) nounwind, !dbg !61 ; [debug line = 10:1]
  %enable_flag_read = call i1 @_ssdm_op_Read.s_axilite.i1P(i1* %enable_flag) nounwind, !dbg !62 ; [#uses=1 type=i1] [debug line = 12:2]
  %shift_val_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %shift_val) nounwind, !dbg !63 ; [#uses=1 type=i32] [debug line = 14:3]
  %tmp_1 = ashr i32 %tmp, %shift_val_read, !dbg !63 ; [#uses=1 type=i32] [debug line = 14:3]
  %sum_val_read = call i32 @_ssdm_op_Read.s_axilite.i32P(i32* %sum_val) nounwind, !dbg !63 ; [#uses=1 type=i32] [debug line = 14:3]
  %tmp_2 = add i32 %sum_val_read, %tmp_1, !dbg !63 ; [#uses=1 type=i32] [debug line = 14:3]
  %tmp_3 = trunc i32 %tmp_2 to i16, !dbg !63      ; [#uses=1 type=i16] [debug line = 14:3]
  %storemerge = select i1 %enable_flag_read, i16 %tmp_3, i16 0 ; [#uses=1 type=i16]
  call void @_ssdm_op_Write.axis.i16P(i16* %output_axis, i16 %storemerge) nounwind, !dbg !63 ; [debug line = 14:3]
  ret void, !dbg !65                              ; [debug line = 20:1]
}

; [#uses=6]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
define weak void @_ssdm_op_Write.axis.i16P(i16*, i16) {
entry:
  store i16 %1, i16* %0
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=6]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=5]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i32 @_ssdm_op_Read.s_axilite.i32P(i32*) {
entry:
  %empty = load i32* %0                           ; [#uses=1 type=i32]
  ret i32 %empty
}

; [#uses=1]
define weak i1 @_ssdm_op_Read.s_axilite.i1P(i1*) {
entry:
  %empty = load i1* %0                            ; [#uses=1 type=i1]
  ret i1 %empty
}

; [#uses=1]
define weak i16 @_ssdm_op_Read.axis.i16(i16) {
entry:
  ret i16 %0
}

; [#uses=0]
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
!31 = metadata !{i32 786689, metadata !32, metadata !"in_data", metadata !33, i32 16777219, metadata !36, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!32 = metadata !{i32 786478, i32 0, metadata !33, metadata !"pwm_prepare", metadata !"pwm_prepare", metadata !"_Z11pwm_preparesPsPjS0_Pb", metadata !33, i32 3, metadata !34, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, i16*, i32*, i32*, i1*)* @pwm_prepare, null, null, metadata !44, i32 4} ; [ DW_TAG_subprogram ]
!33 = metadata !{i32 786473, metadata !"pwm_prepare/solution1/.tcls/pwm_prepare.cpp", metadata !"/opt/Xilinx/Projects/scatter_dma", null} ; [ DW_TAG_file_type ]
!34 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !35, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!35 = metadata !{null, metadata !36, metadata !38, metadata !39, metadata !39, metadata !42}
!36 = metadata !{i32 786454, null, metadata !"int16_t", metadata !33, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !37} ; [ DW_TAG_typedef ]
!37 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!38 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !36} ; [ DW_TAG_pointer_type ]
!39 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !40} ; [ DW_TAG_pointer_type ]
!40 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !33, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_typedef ]
!41 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!42 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ]
!43 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!44 = metadata !{metadata !45}
!45 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!46 = metadata !{i32 3, i32 27, metadata !32, null}
!47 = metadata !{i32 786689, metadata !32, metadata !"out_data", metadata !33, i32 33554435, metadata !38, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!48 = metadata !{i32 3, i32 45, metadata !32, null}
!49 = metadata !{i32 786689, metadata !32, metadata !"shift_val", metadata !33, i32 50331651, metadata !39, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!50 = metadata !{i32 3, i32 65, metadata !32, null}
!51 = metadata !{i32 786689, metadata !32, metadata !"sum_val", metadata !33, i32 67108867, metadata !39, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!52 = metadata !{i32 3, i32 86, metadata !32, null}
!53 = metadata !{i32 786689, metadata !32, metadata !"enable_flag", metadata !33, i32 83886083, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!54 = metadata !{i32 3, i32 101, metadata !32, null}
!55 = metadata !{i32 5, i32 1, metadata !56, null}
!56 = metadata !{i32 786443, metadata !32, i32 4, i32 1, metadata !33, i32 0} ; [ DW_TAG_lexical_block ]
!57 = metadata !{i32 6, i32 1, metadata !56, null}
!58 = metadata !{i32 7, i32 1, metadata !56, null}
!59 = metadata !{i32 8, i32 1, metadata !56, null}
!60 = metadata !{i32 9, i32 1, metadata !56, null}
!61 = metadata !{i32 10, i32 1, metadata !56, null}
!62 = metadata !{i32 12, i32 2, metadata !56, null}
!63 = metadata !{i32 14, i32 3, metadata !64, null}
!64 = metadata !{i32 786443, metadata !56, i32 13, i32 2, metadata !33, i32 1} ; [ DW_TAG_lexical_block ]
!65 = metadata !{i32 20, i32 1, metadata !56, null}
