set C_TypeInfoList {{ 
"awgn" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"input_data": [[],"0"] }, {"output_data": [[],{ "pointer": "0"}] }, {"stdd": [[],{ "pointer": "1"}] }, {"enable": [[],{ "pointer":  {"scalar": "_Bool"}}] }],[],""], 
"0": [ "int16_t", {"typedef": [[[], {"scalar": "short"}],""]}], 
"1": [ "uint32_t", {"typedef": [[[], {"scalar": "unsigned int"}],""]}]
}}
set moduleName awgn
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {awgn}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_axis int 16 regular {axi_s 0 ""  { input_axis data } }  }
	{ output_axis int 16 regular {axi_s 1 ""  { output_axis data } }  }
	{ stdd int 32 regular {axi_slave 0}  }
	{ enable int 1 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_axis", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "input_data","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "output_axis", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "output_data","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "stdd", "interface" : "axi_slave", "bundle":"control_axil","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "stdd","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "enable", "interface" : "axi_slave", "bundle":"control_axil","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "enable","cData": "_Bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} ]}
# RTL Port declarations: 
set portNum 26
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ input_axis_TDATA sc_in sc_lv 16 signal 0 } 
	{ input_axis_TVALID sc_in sc_logic 1 invld 0 } 
	{ input_axis_TREADY sc_out sc_logic 1 inacc 0 } 
	{ output_axis_TDATA sc_out sc_lv 16 signal 1 } 
	{ output_axis_TVALID sc_out sc_logic 1 outvld 1 } 
	{ output_axis_TREADY sc_in sc_logic 1 outacc 1 } 
	{ s_axi_control_axil_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_AWADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_axil_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_axil_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_axil_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_ARADDR sc_in sc_lv 5 signal -1 } 
	{ s_axi_control_axil_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_axil_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_axil_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_axil_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_axil", "role": "AWADDR" },"address":[{"name":"awgn","role":"start","value":"0","valid_bit":"0"},{"name":"awgn","role":"continue","value":"0","valid_bit":"4"},{"name":"awgn","role":"auto_start","value":"0","valid_bit":"7"},{"name":"stdd","role":"data","value":"16"},{"name":"enable","role":"data","value":"24"}] },
	{ "name": "s_axi_control_axil_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "AWVALID" } },
	{ "name": "s_axi_control_axil_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "AWREADY" } },
	{ "name": "s_axi_control_axil_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "WVALID" } },
	{ "name": "s_axi_control_axil_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "WREADY" } },
	{ "name": "s_axi_control_axil_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control_axil", "role": "WDATA" } },
	{ "name": "s_axi_control_axil_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control_axil", "role": "WSTRB" } },
	{ "name": "s_axi_control_axil_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "control_axil", "role": "ARADDR" },"address":[{"name":"awgn","role":"start","value":"0","valid_bit":"0"},{"name":"awgn","role":"done","value":"0","valid_bit":"1"},{"name":"awgn","role":"idle","value":"0","valid_bit":"2"},{"name":"awgn","role":"ready","value":"0","valid_bit":"3"},{"name":"awgn","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_axil_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "ARVALID" } },
	{ "name": "s_axi_control_axil_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "ARREADY" } },
	{ "name": "s_axi_control_axil_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "RVALID" } },
	{ "name": "s_axi_control_axil_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "RREADY" } },
	{ "name": "s_axi_control_axil_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control_axil", "role": "RDATA" } },
	{ "name": "s_axi_control_axil_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control_axil", "role": "RRESP" } },
	{ "name": "s_axi_control_axil_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "BVALID" } },
	{ "name": "s_axi_control_axil_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "BREADY" } },
	{ "name": "s_axi_control_axil_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control_axil", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "input_axis_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "input_axis", "role": "TDATA" }} , 
 	{ "name": "input_axis_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_axis", "role": "TVALID" }} , 
 	{ "name": "input_axis_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_axis", "role": "TREADY" }} , 
 	{ "name": "output_axis_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "output_axis", "role": "TDATA" }} , 
 	{ "name": "output_axis_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_axis", "role": "TVALID" }} , 
 	{ "name": "output_axis_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "output_axis", "role": "TREADY" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"], "CDFG" : "awgn", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "input_axis", "Type" : "Axis", "Direction" : "I", "BlockSignal" : [
			{"Name" : "input_axis_TDATA_blk_n", "Type" : "RtlSignal"}], "SubConnect" : []}, 
		{"Name" : "output_axis", "Type" : "Axis", "Direction" : "O", "BlockSignal" : [
			{"Name" : "output_axis_TDATA_blk_n", "Type" : "RtlSignal"}], "SubConnect" : []}, 
		{"Name" : "stdd", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "enable", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "store_val", "Type" : "OVld", "Direction" : "IO", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "cur", "Type" : "OVld", "Direction" : "IO", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "store_g", "Type" : "OVld", "Direction" : "IO", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_control_axil_s_axi_U", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fadd_32ns_32ns_32_5_full_dsp_U1", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fadd_32ns_32ns_32_5_full_dsp_U2", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fmul_32ns_32ns_32_4_max_dsp_U3", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fmul_32ns_32ns_32_4_max_dsp_U4", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_uitofp_32ns_32_6_U5", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_uitofp_32ns_32_6_U6", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_sitofp_32s_32_6_U7", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fptrunc_64ns_32_1_U8", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fpext_32ns_64_1_U9", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_fcmp_32ns_32ns_1_1_U10", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_dmul_64ns_64ns_64_6_max_dsp_U11", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_ddiv_64ns_64ns_64_31_U12", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_dsqrt_64ns_64ns_64_30_U13", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.awgn_dlog_64ns_64ns_64_31_full_dsp_U14", "Parent" : "0", "Child" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set Spec2ImplPortList { 
	input_axis { axis {  { input_axis_TDATA in_data 0 16 }  { input_axis_TVALID in_vld 0 1 }  { input_axis_TREADY in_acc 1 1 } } }
	output_axis { axis {  { output_axis_TDATA out_data 1 16 }  { output_axis_TVALID out_vld 1 1 }  { output_axis_TREADY out_acc 0 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
