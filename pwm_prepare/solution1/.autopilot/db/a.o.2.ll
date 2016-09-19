; ModuleID = '/opt/Xilinx/Projects/scatter_dma/pwm_prepare/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@pwm_prepare.str = internal unnamed_addr constant [12 x i8] c"pwm_prepare\00" ; [#uses=1 type=[12 x i8]*]
@.str5 = private unnamed_addr constant [13 x i8] c"control_axil\00", align 1 ; [#uses=4 type=[13 x i8]*]
@.str4 = private unnamed_addr constant [10 x i8] c"s_axilite\00", align 1 ; [#uses=4 type=[10 x i8]*]
@.str3 = private unnamed_addr constant [12 x i8] c"output_axis\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=18 type=[1 x i8]*]
@.str1 = private unnamed_addr constant [11 x i8] c"input_axis\00", align 1 ; [#uses=1 type=[11 x i8]*]
@.str = private unnamed_addr constant [5 x i8] c"axis\00", align 1 ; [#uses=2 type=[5 x i8]*]

; [#uses=0]
define void @pwm_prepare(i16 signext %in_data, i16* %out_data, i32* %shift_val, i32* %sum_val, i1* %enable_flag) nounwind uwtable {
_ifconv:
  call void (...)* @_ssdm_op_SpecBitsMap(i16 %in_data) nounwind, !map !26
  call void (...)* @_ssdm_op_SpecBitsMap(i16* %out_data) nounwind, !map !32
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %shift_val) nounwind, !map !38
  call void (...)* @_ssdm_op_SpecBitsMap(i32* %sum_val) nounwind, !map !42
  call void (...)* @_ssdm_op_SpecBitsMap(i1* %enable_flag) nounwind, !map !46
  call void (...)* @_ssdm_op_SpecTopModule([12 x i8]* @pwm_prepare.str) nounwind
  call void @llvm.dbg.value(metadata !{i16 %in_data}, i64 0, metadata !50), !dbg !51 ; [debug line = 3:27] [debug variable = in_data]
  call void @llvm.dbg.value(metadata !{i16* %out_data}, i64 0, metadata !52), !dbg !53 ; [debug line = 3:45] [debug variable = out_data]
  call void @llvm.dbg.value(metadata !{i32* %shift_val}, i64 0, metadata !54), !dbg !55 ; [debug line = 3:65] [debug variable = shift_val]
  call void @llvm.dbg.value(metadata !{i32* %sum_val}, i64 0, metadata !56), !dbg !57 ; [debug line = 3:86] [debug variable = sum_val]
  call void @llvm.dbg.value(metadata !{i1* %enable_flag}, i64 0, metadata !58), !dbg !59 ; [debug line = 3:101] [debug variable = enable_flag]
  %tmp = sext i16 %in_data to i32, !dbg !60       ; [#uses=1 type=i32] [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecInterface(i16 %in_data, [5 x i8]* @.str, i32 0, i32 0, i32 0, i32 0, [11 x i8]* @.str1, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2) nounwind, !dbg !60 ; [debug line = 5:1]
  call void (...)* @_ssdm_op_SpecInterface(i16* %out_data, [5 x i8]* @.str, i32 0, i32 0, i32 0, i32 0, [12 x i8]* @.str3, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2) nounwind, !dbg !62 ; [debug line = 6:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %shift_val, [10 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @.str5, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2) nounwind, !dbg !63 ; [debug line = 7:1]
  call void (...)* @_ssdm_op_SpecInterface(i32* %sum_val, [10 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @.str5, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2) nounwind, !dbg !64 ; [debug line = 8:1]
  call void (...)* @_ssdm_op_SpecInterface(i1* %enable_flag, [10 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @.str5, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2) nounwind, !dbg !65 ; [debug line = 9:1]
  call void (...)* @_ssdm_op_SpecInterface(i32 0, [10 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [13 x i8]* @.str5, [1 x i8]* @.str2, [1 x i8]* @.str2, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str2) nounwind, !dbg !66 ; [debug line = 10:1]
  %enable_flag.load = load i1* %enable_flag, align 1, !dbg !67 ; [#uses=1 type=i1] [debug line = 12:2]
  %shift_val.load = load i32* %shift_val, align 4, !dbg !68 ; [#uses=1 type=i32] [debug line = 14:3]
  %tmp.1 = ashr i32 %tmp, %shift_val.load, !dbg !68 ; [#uses=1 type=i32] [debug line = 14:3]
  %sum_val.load = load i32* %sum_val, align 4, !dbg !68 ; [#uses=1 type=i32] [debug line = 14:3]
  %tmp.2 = add i32 %tmp.1, %sum_val.load, !dbg !68 ; [#uses=1 type=i32] [debug line = 14:3]
  %tmp.3 = trunc i32 %tmp.2 to i16, !dbg !68      ; [#uses=1 type=i16] [debug line = 14:3]
  %storemerge = select i1 %enable_flag.load, i16 %tmp.3, i16 0 ; [#uses=1 type=i16]
  store i16 %storemerge, i16* %out_data, align 2, !dbg !68 ; [debug line = 14:3]
  ret void, !dbg !70                              ; [debug line = 20:1]
}

; [#uses=5]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=6]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=5]
declare void @_ssdm_op_SpecBitsMap(...)

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!19}
!hls.encrypted.func = !{}
!llvm.map.gv = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/opt/Xilinx/Projects/scatter_dma/pwm_prepare/solution1/.autopilot/db/pwm_prepare.pragma.2.cpp", metadata !"/opt/Xilinx/Projects/scatter_dma", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !1} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"pwm_prepare", metadata !"pwm_prepare", metadata !"_Z11pwm_preparesPsPjS0_Pb", metadata !6, i32 3, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (i16, i16*, i32*, i32*, i1*)* @pwm_prepare, null, null, metadata !17, i32 4} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"pwm_prepare/solution1/.tcls/pwm_prepare.cpp", metadata !"/opt/Xilinx/Projects/scatter_dma", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !11, metadata !12, metadata !12, metadata !15}
!9 = metadata !{i32 786454, null, metadata !"int16_t", metadata !6, i32 37, i64 0, i64 0, i64 0, i32 0, metadata !10} ; [ DW_TAG_typedef ]
!10 = metadata !{i32 786468, null, metadata !"short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!11 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ]
!12 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !13} ; [ DW_TAG_pointer_type ]
!13 = metadata !{i32 786454, null, metadata !"uint32_t", metadata !6, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !14} ; [ DW_TAG_typedef ]
!14 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !16} ; [ DW_TAG_pointer_type ]
!16 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ]
!17 = metadata !{metadata !18}
!18 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!19 = metadata !{void (i16, i16*, i32*, i32*, i1*)* @pwm_prepare, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !25}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 1, i32 1, i32 1, i32 1}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"int16_t", metadata !"int16_t*", metadata !"uint32_t*", metadata !"uint32_t*", metadata !"_Bool*"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"in_data", metadata !"out_data", metadata !"shift_val", metadata !"sum_val", metadata !"enable_flag"}
!25 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 0, i32 15, metadata !28}
!28 = metadata !{metadata !29}
!29 = metadata !{metadata !"in_data", metadata !30, metadata !"short", i32 0, i32 15}
!30 = metadata !{metadata !31}
!31 = metadata !{i32 0, i32 0, i32 0}
!32 = metadata !{metadata !33}
!33 = metadata !{i32 0, i32 15, metadata !34}
!34 = metadata !{metadata !35}
!35 = metadata !{metadata !"out_data", metadata !36, metadata !"short", i32 0, i32 15}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 0, i32 0, i32 1}
!38 = metadata !{metadata !39}
!39 = metadata !{i32 0, i32 31, metadata !40}
!40 = metadata !{metadata !41}
!41 = metadata !{metadata !"shift_val", metadata !36, metadata !"unsigned int", i32 0, i32 31}
!42 = metadata !{metadata !43}
!43 = metadata !{i32 0, i32 31, metadata !44}
!44 = metadata !{metadata !45}
!45 = metadata !{metadata !"sum_val", metadata !36, metadata !"unsigned int", i32 0, i32 31}
!46 = metadata !{metadata !47}
!47 = metadata !{i32 0, i32 0, metadata !48}
!48 = metadata !{metadata !49}
!49 = metadata !{metadata !"enable_flag", metadata !36, metadata !"bool", i32 0, i32 0}
!50 = metadata !{i32 786689, metadata !5, metadata !"in_data", metadata !6, i32 16777219, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 3, i32 27, metadata !5, null}
!52 = metadata !{i32 786689, metadata !5, metadata !"out_data", metadata !6, i32 33554435, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!53 = metadata !{i32 3, i32 45, metadata !5, null}
!54 = metadata !{i32 786689, metadata !5, metadata !"shift_val", metadata !6, i32 50331651, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!55 = metadata !{i32 3, i32 65, metadata !5, null}
!56 = metadata !{i32 786689, metadata !5, metadata !"sum_val", metadata !6, i32 67108867, metadata !12, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!57 = metadata !{i32 3, i32 86, metadata !5, null}
!58 = metadata !{i32 786689, metadata !5, metadata !"enable_flag", metadata !6, i32 83886083, metadata !15, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!59 = metadata !{i32 3, i32 101, metadata !5, null}
!60 = metadata !{i32 5, i32 1, metadata !61, null}
!61 = metadata !{i32 786443, metadata !5, i32 4, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!62 = metadata !{i32 6, i32 1, metadata !61, null}
!63 = metadata !{i32 7, i32 1, metadata !61, null}
!64 = metadata !{i32 8, i32 1, metadata !61, null}
!65 = metadata !{i32 9, i32 1, metadata !61, null}
!66 = metadata !{i32 10, i32 1, metadata !61, null}
!67 = metadata !{i32 12, i32 2, metadata !61, null}
!68 = metadata !{i32 14, i32 3, metadata !69, null}
!69 = metadata !{i32 786443, metadata !61, i32 13, i32 2, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!70 = metadata !{i32 20, i32 1, metadata !61, null}
