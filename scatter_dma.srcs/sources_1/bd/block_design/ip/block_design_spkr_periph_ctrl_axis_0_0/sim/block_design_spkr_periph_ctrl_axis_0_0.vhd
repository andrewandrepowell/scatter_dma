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

-- IP VLNV: user.org:user:spkr_periph_ctrl_axis:1.0
-- IP Revision: 2

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY block_design_spkr_periph_ctrl_axis_0_0 IS
  PORT (
    out_pwm : OUT STD_LOGIC;
    input_axis_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    input_axis_tstrb : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    input_axis_tlast : IN STD_LOGIC;
    input_axis_tvalid : IN STD_LOGIC;
    input_axis_tready : OUT STD_LOGIC;
    input_axis_aclk : IN STD_LOGIC;
    input_axis_aresetn : IN STD_LOGIC
  );
END block_design_spkr_periph_ctrl_axis_0_0;

ARCHITECTURE block_design_spkr_periph_ctrl_axis_0_0_arch OF block_design_spkr_periph_ctrl_axis_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF block_design_spkr_periph_ctrl_axis_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT spkr_periph_ctrl_axis_v1_0 IS
    GENERIC (
      C_input_axis_TDATA_WIDTH : INTEGER; -- AXI4Stream sink: Data Width
      g_counter_width : INTEGER;
      g_ofifi_addr_width : INTEGER;
      g_grab_value : INTEGER
    );
    PORT (
      out_pwm : OUT STD_LOGIC;
      input_axis_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      input_axis_tstrb : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
      input_axis_tlast : IN STD_LOGIC;
      input_axis_tvalid : IN STD_LOGIC;
      input_axis_tready : OUT STD_LOGIC;
      input_axis_aclk : IN STD_LOGIC;
      input_axis_aresetn : IN STD_LOGIC
    );
  END COMPONENT spkr_periph_ctrl_axis_v1_0;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_tdata: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_tstrb: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TSTRB";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_tlast: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_tvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_tready: SIGNAL IS "xilinx.com:interface:axis:1.0 input_axis TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_aclk: SIGNAL IS "xilinx.com:signal:clock:1.0 input_axis_CLK CLK";
  ATTRIBUTE X_INTERFACE_INFO OF input_axis_aresetn: SIGNAL IS "xilinx.com:signal:reset:1.0 input_axis_RST RST";
BEGIN
  U0 : spkr_periph_ctrl_axis_v1_0
    GENERIC MAP (
      C_input_axis_TDATA_WIDTH => 16,
      g_counter_width => 10,
      g_ofifi_addr_width => 4,
      g_grab_value => 0
    )
    PORT MAP (
      out_pwm => out_pwm,
      input_axis_tdata => input_axis_tdata,
      input_axis_tstrb => input_axis_tstrb,
      input_axis_tlast => input_axis_tlast,
      input_axis_tvalid => input_axis_tvalid,
      input_axis_tready => input_axis_tready,
      input_axis_aclk => input_axis_aclk,
      input_axis_aresetn => input_axis_aresetn
    );
END block_design_spkr_periph_ctrl_axis_0_0_arch;
