-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:awgn:1.0
-- IP Revision: 1609181759

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY block_design_awgn_0_0 IS
  PORT (
    s_axi_control_axil_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_control_axil_AWVALID : IN STD_LOGIC;
    s_axi_control_axil_AWREADY : OUT STD_LOGIC;
    s_axi_control_axil_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_axil_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    s_axi_control_axil_WVALID : IN STD_LOGIC;
    s_axi_control_axil_WREADY : OUT STD_LOGIC;
    s_axi_control_axil_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_axil_BVALID : OUT STD_LOGIC;
    s_axi_control_axil_BREADY : IN STD_LOGIC;
    s_axi_control_axil_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    s_axi_control_axil_ARVALID : IN STD_LOGIC;
    s_axi_control_axil_ARREADY : OUT STD_LOGIC;
    s_axi_control_axil_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_control_axil_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_control_axil_RVALID : OUT STD_LOGIC;
    s_axi_control_axil_RREADY : IN STD_LOGIC;
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    interrupt : OUT STD_LOGIC;
    input_axis_TVALID : IN STD_LOGIC;
    input_axis_TREADY : OUT STD_LOGIC;
    input_axis_TDATA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    output_axis_TVALID : OUT STD_LOGIC;
    output_axis_TREADY : IN STD_LOGIC;
    output_axis_TDATA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END block_design_awgn_0_0;

ARCHITECTURE block_design_awgn_0_0_arch OF block_design_awgn_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF block_design_awgn_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT awgn IS
    GENERIC (
      C_S_AXI_CONTROL_AXIL_ADDR_WIDTH : INTEGER;
      C_S_AXI_CONTROL_AXIL_DATA_WIDTH : INTEGER
    );
    PORT (
      s_axi_control_axil_AWADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_control_axil_AWVALID : IN STD_LOGIC;
      s_axi_control_axil_AWREADY : OUT STD_LOGIC;
      s_axi_control_axil_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_axil_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      s_axi_control_axil_WVALID : IN STD_LOGIC;
      s_axi_control_axil_WREADY : OUT STD_LOGIC;
      s_axi_control_axil_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_axil_BVALID : OUT STD_LOGIC;
      s_axi_control_axil_BREADY : IN STD_LOGIC;
      s_axi_control_axil_ARADDR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      s_axi_control_axil_ARVALID : IN STD_LOGIC;
      s_axi_control_axil_ARREADY : OUT STD_LOGIC;
      s_axi_control_axil_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      s_axi_control_axil_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
      s_axi_control_axil_RVALID : OUT STD_LOGIC;
      s_axi_control_axil_RREADY : IN STD_LOGIC;
      ap_clk : IN STD_LOGIC;
      ap_rst_n : IN STD_LOGIC;
      interrupt : OUT STD_LOGIC;
      input_axis_TVALID : IN STD_LOGIC;
      input_axis_TREADY : OUT STD_LOGIC;
      input_axis_TDATA : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      output_axis_TVALID : OUT STD_LOGIC;
      output_axis_TREADY : IN STD_LOGIC;
      output_axis_TDATA : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT awgn;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF block_design_awgn_0_0_arch: ARCHITECTURE IS "awgn,Vivado 2016.2";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF block_design_awgn_0_0_arch : ARCHITECTURE IS "block_design_awgn_0_0,awgn,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF block_design_awgn_0_0_arch: ARCHITECTURE IS "block_design_awgn_0_0,awgn,{x_ipProduct=Vivado 2016.2,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=awgn,x_ipVersion=1.0,x_ipCoreRevision=1609181759,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED,C_S_AXI_CONTROL_AXIL_ADDR_WIDTH=5,C_S_AXI_CONTROL_AXIL_DATA_WIDTH=32}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_AWADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil AWADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_AWVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil AWVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_AWREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil AWREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_WDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil WDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_WSTRB: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil WSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_WVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil WVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_WREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil WREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_BRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil BRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_BVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil BVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_BREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil BREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_ARADDR: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil ARADDR";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_ARVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil ARVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_ARREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil ARREADY";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_RDATA: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil RDATA";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_RRESP: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil RRESP";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_RVALID: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil RVALID";
  ATTRIBUTE X_INTERFACE_INFO OF s_axi_control_axil_RREADY: SIGNAL IS "xilinx.com:interface:aximm:1.0 s_axi_control_axil RREADY";
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst_n RST";
  ATTRIBUTE X_INTERFACE_INFO OF interrupt: SIGNAL IS "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF output_axis_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 output_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF output_axis_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 output_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF output_axis_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 output_axis TDATA";
BEGIN
  U0 : awgn
    GENERIC MAP (
      C_S_AXI_CONTROL_AXIL_ADDR_WIDTH => 5,
      C_S_AXI_CONTROL_AXIL_DATA_WIDTH => 32
    )
    PORT MAP (
      s_axi_control_axil_AWADDR => s_axi_control_axil_AWADDR,
      s_axi_control_axil_AWVALID => s_axi_control_axil_AWVALID,
      s_axi_control_axil_AWREADY => s_axi_control_axil_AWREADY,
      s_axi_control_axil_WDATA => s_axi_control_axil_WDATA,
      s_axi_control_axil_WSTRB => s_axi_control_axil_WSTRB,
      s_axi_control_axil_WVALID => s_axi_control_axil_WVALID,
      s_axi_control_axil_WREADY => s_axi_control_axil_WREADY,
      s_axi_control_axil_BRESP => s_axi_control_axil_BRESP,
      s_axi_control_axil_BVALID => s_axi_control_axil_BVALID,
      s_axi_control_axil_BREADY => s_axi_control_axil_BREADY,
      s_axi_control_axil_ARADDR => s_axi_control_axil_ARADDR,
      s_axi_control_axil_ARVALID => s_axi_control_axil_ARVALID,
      s_axi_control_axil_ARREADY => s_axi_control_axil_ARREADY,
      s_axi_control_axil_RDATA => s_axi_control_axil_RDATA,
      s_axi_control_axil_RRESP => s_axi_control_axil_RRESP,
      s_axi_control_axil_RVALID => s_axi_control_axil_RVALID,
      s_axi_control_axil_RREADY => s_axi_control_axil_RREADY,
      ap_clk => ap_clk,
      ap_rst_n => ap_rst_n,
      interrupt => interrupt,
      input_axis_TVALID => input_axis_TVALID,
      input_axis_TREADY => input_axis_TREADY,
      input_axis_TDATA => input_axis_TDATA,
      output_axis_TVALID => output_axis_TVALID,
      output_axis_TREADY => output_axis_TREADY,
      output_axis_TDATA => output_axis_TDATA
    );
END block_design_awgn_0_0_arch;
