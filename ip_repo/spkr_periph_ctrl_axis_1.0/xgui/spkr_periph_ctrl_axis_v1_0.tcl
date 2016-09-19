# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  set C_input_axis_TDATA_WIDTH [ipgui::add_param $IPINST -name "C_input_axis_TDATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {AXI4Stream sink: Data Width} ${C_input_axis_TDATA_WIDTH}
  ipgui::add_param $IPINST -name "g_counter_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "g_ofifi_addr_width" -parent ${Page_0}
  ipgui::add_param $IPINST -name "g_grab_value" -parent ${Page_0}


}

proc update_PARAM_VALUE.g_counter_width { PARAM_VALUE.g_counter_width } {
	# Procedure called to update g_counter_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_counter_width { PARAM_VALUE.g_counter_width } {
	# Procedure called to validate g_counter_width
	return true
}

proc update_PARAM_VALUE.g_grab_value { PARAM_VALUE.g_grab_value } {
	# Procedure called to update g_grab_value when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_grab_value { PARAM_VALUE.g_grab_value } {
	# Procedure called to validate g_grab_value
	return true
}

proc update_PARAM_VALUE.g_ofifi_addr_width { PARAM_VALUE.g_ofifi_addr_width } {
	# Procedure called to update g_ofifi_addr_width when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.g_ofifi_addr_width { PARAM_VALUE.g_ofifi_addr_width } {
	# Procedure called to validate g_ofifi_addr_width
	return true
}

proc update_PARAM_VALUE.C_input_axis_TDATA_WIDTH { PARAM_VALUE.C_input_axis_TDATA_WIDTH } {
	# Procedure called to update C_input_axis_TDATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_input_axis_TDATA_WIDTH { PARAM_VALUE.C_input_axis_TDATA_WIDTH } {
	# Procedure called to validate C_input_axis_TDATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.C_input_axis_TDATA_WIDTH { MODELPARAM_VALUE.C_input_axis_TDATA_WIDTH PARAM_VALUE.C_input_axis_TDATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_input_axis_TDATA_WIDTH}] ${MODELPARAM_VALUE.C_input_axis_TDATA_WIDTH}
}

proc update_MODELPARAM_VALUE.g_counter_width { MODELPARAM_VALUE.g_counter_width PARAM_VALUE.g_counter_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_counter_width}] ${MODELPARAM_VALUE.g_counter_width}
}

proc update_MODELPARAM_VALUE.g_ofifi_addr_width { MODELPARAM_VALUE.g_ofifi_addr_width PARAM_VALUE.g_ofifi_addr_width } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_ofifi_addr_width}] ${MODELPARAM_VALUE.g_ofifi_addr_width}
}

proc update_MODELPARAM_VALUE.g_grab_value { MODELPARAM_VALUE.g_grab_value PARAM_VALUE.g_grab_value } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.g_grab_value}] ${MODELPARAM_VALUE.g_grab_value}
}

