set C_TypeInfoList {{ 
"pwm_prepare" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"in_data": [[],"0"] }, {"out_data": [[],{ "pointer": "0"}] }, {"shift_val": [[],{ "pointer": "1"}] }, {"sum_val": [[],{ "pointer": "1"}] }, {"enable_flag": [[],{ "pointer":  {"scalar": "bool"}}] }],[],""], 
"0": [ "int16_t", {"typedef": [[[], {"scalar": "short"}],""]}], 
"1": [ "uint32_t", {"typedef": [[[], {"scalar": "unsigned int"}],""]}]
}}
set moduleName pwm_prepare
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 1
set C_modelName {pwm_prepare}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_axis int 16 regular {axi_s 0 ""  { input_axis data } }  }
	{ output_axis int 16 regular {axi_s 1 ""  { output_axis data } }  }
	{ shift_val int 32 regular {axi_slave 0}  }
	{ sum_val int 32 regular {axi_slave 0}  }
	{ enable_flag int 1 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "input_axis", "interface" : "axis", "bitwidth" : 16, "direction" : "READONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "in_data","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "output_axis", "interface" : "axis", "bitwidth" : 16, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":15,"cElement": [{"cName": "out_data","cData": "short","bit_use": { "low": 0,"up": 15},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "shift_val", "interface" : "axi_slave", "bundle":"control_axil","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "shift_val","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "sum_val", "interface" : "axi_slave", "bundle":"control_axil","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "sum_val","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "enable_flag", "interface" : "axi_slave", "bundle":"control_axil","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "enable_flag","cData": "bool","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":32}, "offset_end" : {"in":39}} ]}
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
	{ s_axi_control_axil_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_axil_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_axil_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_axil_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_axil_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_axil_ARADDR sc_in sc_lv 6 signal -1 } 
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
	{ "name": "s_axi_control_axil_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control_axil", "role": "AWADDR" },"address":[{"name":"pwm_prepare","role":"start","value":"0","valid_bit":"0"},{"name":"pwm_prepare","role":"continue","value":"0","valid_bit":"4"},{"name":"pwm_prepare","role":"auto_start","value":"0","valid_bit":"7"},{"name":"shift_val","role":"data","value":"16"},{"name":"sum_val","role":"data","value":"24"},{"name":"enable_flag","role":"data","value":"32"}] },
	{ "name": "s_axi_control_axil_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "AWVALID" } },
	{ "name": "s_axi_control_axil_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "AWREADY" } },
	{ "name": "s_axi_control_axil_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "WVALID" } },
	{ "name": "s_axi_control_axil_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control_axil", "role": "WREADY" } },
	{ "name": "s_axi_control_axil_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control_axil", "role": "WDATA" } },
	{ "name": "s_axi_control_axil_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control_axil", "role": "WSTRB" } },
	{ "name": "s_axi_control_axil_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control_axil", "role": "ARADDR" },"address":[{"name":"pwm_prepare","role":"start","value":"0","valid_bit":"0"},{"name":"pwm_prepare","role":"done","value":"0","valid_bit":"1"},{"name":"pwm_prepare","role":"idle","value":"0","valid_bit":"2"},{"name":"pwm_prepare","role":"ready","value":"0","valid_bit":"3"},{"name":"pwm_prepare","role":"auto_start","value":"0","valid_bit":"7"}] },
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
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"], "CDFG" : "pwm_prepare", "VariableLatency" : "0", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "input_axis", "Type" : "Axis", "Direction" : "I", "BlockSignal" : [
			{"Name" : "input_axis_TDATA_blk_n", "Type" : "RtlSignal"}], "SubConnect" : []}, 
		{"Name" : "output_axis", "Type" : "Axis", "Direction" : "O", "BlockSignal" : [
			{"Name" : "output_axis_TDATA_blk_n", "Type" : "RtlSignal"}], "SubConnect" : []}, 
		{"Name" : "shift_val", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "sum_val", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "enable_flag", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.pwm_prepare_control_axil_s_axi_U", "Parent" : "0", "Child" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "0", "Max" : "0"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "1"}
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
