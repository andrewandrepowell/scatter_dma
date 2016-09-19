// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="pwm_prepare,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100tcsg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=5.607500,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=121,HLS_SYN_LUT=318}" *)

module pwm_prepare (
        ap_clk,
        ap_rst_n,
        input_axis_TDATA,
        input_axis_TVALID,
        input_axis_TREADY,
        output_axis_TDATA,
        output_axis_TVALID,
        output_axis_TREADY,
        s_axi_control_axil_AWVALID,
        s_axi_control_axil_AWREADY,
        s_axi_control_axil_AWADDR,
        s_axi_control_axil_WVALID,
        s_axi_control_axil_WREADY,
        s_axi_control_axil_WDATA,
        s_axi_control_axil_WSTRB,
        s_axi_control_axil_ARVALID,
        s_axi_control_axil_ARREADY,
        s_axi_control_axil_ARADDR,
        s_axi_control_axil_RVALID,
        s_axi_control_axil_RREADY,
        s_axi_control_axil_RDATA,
        s_axi_control_axil_RRESP,
        s_axi_control_axil_BVALID,
        s_axi_control_axil_BREADY,
        s_axi_control_axil_BRESP,
        interrupt
);

parameter    ap_ST_st1_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    C_S_AXI_CONTROL_AXIL_DATA_WIDTH = 32;
parameter    ap_const_int64_8 = 8;
parameter    C_S_AXI_CONTROL_AXIL_ADDR_WIDTH = 6;
parameter    C_S_AXI_DATA_WIDTH = 32;
parameter    ap_const_lv16_0 = 16'b0000000000000000;

parameter C_S_AXI_CONTROL_AXIL_WSTRB_WIDTH = (C_S_AXI_CONTROL_AXIL_DATA_WIDTH / ap_const_int64_8);
parameter C_S_AXI_WSTRB_WIDTH = (C_S_AXI_DATA_WIDTH / ap_const_int64_8);

input   ap_clk;
input   ap_rst_n;
input  [15:0] input_axis_TDATA;
input   input_axis_TVALID;
output   input_axis_TREADY;
output  [15:0] output_axis_TDATA;
output   output_axis_TVALID;
input   output_axis_TREADY;
input   s_axi_control_axil_AWVALID;
output   s_axi_control_axil_AWREADY;
input  [C_S_AXI_CONTROL_AXIL_ADDR_WIDTH - 1 : 0] s_axi_control_axil_AWADDR;
input   s_axi_control_axil_WVALID;
output   s_axi_control_axil_WREADY;
input  [C_S_AXI_CONTROL_AXIL_DATA_WIDTH - 1 : 0] s_axi_control_axil_WDATA;
input  [C_S_AXI_CONTROL_AXIL_WSTRB_WIDTH - 1 : 0] s_axi_control_axil_WSTRB;
input   s_axi_control_axil_ARVALID;
output   s_axi_control_axil_ARREADY;
input  [C_S_AXI_CONTROL_AXIL_ADDR_WIDTH - 1 : 0] s_axi_control_axil_ARADDR;
output   s_axi_control_axil_RVALID;
input   s_axi_control_axil_RREADY;
output  [C_S_AXI_CONTROL_AXIL_DATA_WIDTH - 1 : 0] s_axi_control_axil_RDATA;
output  [1:0] s_axi_control_axil_RRESP;
output   s_axi_control_axil_BVALID;
input   s_axi_control_axil_BREADY;
output  [1:0] s_axi_control_axil_BRESP;
output   interrupt;

reg input_axis_TREADY;
reg output_axis_TVALID;

reg    ap_rst_n_inv;
wire    ap_start;
reg    ap_done;
reg    ap_idle;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_18;
reg    ap_ready;
wire   [31:0] shift_val;
wire   [31:0] sum_val;
wire    enable_flag;
reg    input_axis_TDATA_blk_n;
reg    output_axis_TDATA_blk_n;
reg    ap_sig_76;
reg    ap_sig_ioackin_output_axis_TREADY;
reg    ap_reg_ioackin_output_axis_TREADY;
wire  signed [31:0] tmp_fu_73_p1;
wire   [31:0] tmp_1_fu_77_p2;
wire   [31:0] tmp_2_fu_83_p2;
wire   [0:0] storemerge_fu_93_p0;
wire   [15:0] tmp_3_fu_89_p1;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_123;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'b1;
#0 ap_reg_ioackin_output_axis_TREADY = 1'b0;
end

pwm_prepare_control_axil_s_axi #(
    .C_S_AXI_ADDR_WIDTH( C_S_AXI_CONTROL_AXIL_ADDR_WIDTH ),
    .C_S_AXI_DATA_WIDTH( C_S_AXI_CONTROL_AXIL_DATA_WIDTH ))
pwm_prepare_control_axil_s_axi_U(
    .AWVALID(s_axi_control_axil_AWVALID),
    .AWREADY(s_axi_control_axil_AWREADY),
    .AWADDR(s_axi_control_axil_AWADDR),
    .WVALID(s_axi_control_axil_WVALID),
    .WREADY(s_axi_control_axil_WREADY),
    .WDATA(s_axi_control_axil_WDATA),
    .WSTRB(s_axi_control_axil_WSTRB),
    .ARVALID(s_axi_control_axil_ARVALID),
    .ARREADY(s_axi_control_axil_ARREADY),
    .ARADDR(s_axi_control_axil_ARADDR),
    .RVALID(s_axi_control_axil_RVALID),
    .RREADY(s_axi_control_axil_RREADY),
    .RDATA(s_axi_control_axil_RDATA),
    .RRESP(s_axi_control_axil_RRESP),
    .BVALID(s_axi_control_axil_BVALID),
    .BREADY(s_axi_control_axil_BREADY),
    .BRESP(s_axi_control_axil_BRESP),
    .ACLK(ap_clk),
    .ARESET(ap_rst_n_inv),
    .ACLK_EN(1'b1),
    .ap_start(ap_start),
    .interrupt(interrupt),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .shift_val(shift_val),
    .sum_val(sum_val),
    .enable_flag(enable_flag)
);

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst_n_inv == 1'b1) begin
        ap_reg_ioackin_output_axis_TREADY <= 1'b0;
    end else begin
        if ((1'b1 == ap_sig_cseq_ST_st1_fsm_0)) begin
            if (~(ap_sig_76 | (1'b0 == ap_sig_ioackin_output_axis_TREADY))) begin
                ap_reg_ioackin_output_axis_TREADY <= 1'b0;
            end else if (ap_sig_123) begin
                ap_reg_ioackin_output_axis_TREADY <= 1'b1;
            end
        end
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_sig_76 | (1'b0 == ap_sig_ioackin_output_axis_TREADY)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_sig_76 | (1'b0 == ap_sig_ioackin_output_axis_TREADY)))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_18) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == ap_reg_ioackin_output_axis_TREADY)) begin
        ap_sig_ioackin_output_axis_TREADY = output_axis_TREADY;
    end else begin
        ap_sig_ioackin_output_axis_TREADY = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        input_axis_TDATA_blk_n = input_axis_TVALID;
    end else begin
        input_axis_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_sig_76 | (1'b0 == ap_sig_ioackin_output_axis_TREADY)))) begin
        input_axis_TREADY = 1'b1;
    end else begin
        input_axis_TREADY = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st1_fsm_0)) begin
        output_axis_TDATA_blk_n = output_axis_TREADY;
    end else begin
        output_axis_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~ap_sig_76 & (1'b0 == ap_reg_ioackin_output_axis_TREADY))) begin
        output_axis_TVALID = 1'b1;
    end else begin
        output_axis_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : begin
            ap_NS_fsm = ap_ST_st1_fsm_0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

always @ (*) begin
    ap_sig_123 = (~ap_sig_76 & (1'b1 == output_axis_TREADY));
end

always @ (*) begin
    ap_sig_18 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_76 = ((input_axis_TVALID == 1'b0) | (ap_start == 1'b0));
end

assign output_axis_TDATA = ((storemerge_fu_93_p0[0:0] === 1'b1) ? tmp_3_fu_89_p1 : ap_const_lv16_0);

assign storemerge_fu_93_p0 = enable_flag;

assign tmp_1_fu_77_p2 = $signed(tmp_fu_73_p1) >>> shift_val;

assign tmp_2_fu_83_p2 = (sum_val + tmp_1_fu_77_p2);

assign tmp_3_fu_89_p1 = tmp_2_fu_83_p2[15:0];

assign tmp_fu_73_p1 = $signed(input_axis_TDATA);

endmodule //pwm_prepare