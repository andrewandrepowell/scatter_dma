--Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
--Date        : Mon Sep 19 08:30:58 2016
--Host        : andrewandrepowell2-desktop running 64-bit Ubuntu 16.04 LTS
--Command     : generate_target block_design_wrapper.bd
--Design      : block_design_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity block_design_wrapper is
  port (
    DDR2_addr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    DDR2_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR2_cas_n : out STD_LOGIC;
    DDR2_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    DDR2_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_ras_n : out STD_LOGIC;
    DDR2_we_n : out STD_LOGIC;
    out_pwm : out STD_LOGIC;
    reset : in STD_LOGIC;
    sys_clock : in STD_LOGIC;
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC;
    user_in_tri_i : in STD_LOGIC_VECTOR ( 5 downto 0 )
  );
end block_design_wrapper;

architecture STRUCTURE of block_design_wrapper is
  component block_design is
  port (
    uart_rtl_rxd : in STD_LOGIC;
    uart_rtl_txd : out STD_LOGIC;
    DDR2_dq : inout STD_LOGIC_VECTOR ( 15 downto 0 );
    DDR2_dqs_p : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_dqs_n : inout STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_addr : out STD_LOGIC_VECTOR ( 12 downto 0 );
    DDR2_ba : out STD_LOGIC_VECTOR ( 2 downto 0 );
    DDR2_ras_n : out STD_LOGIC;
    DDR2_cas_n : out STD_LOGIC;
    DDR2_we_n : out STD_LOGIC;
    DDR2_ck_p : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_ck_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_cke : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_cs_n : out STD_LOGIC_VECTOR ( 0 to 0 );
    DDR2_dm : out STD_LOGIC_VECTOR ( 1 downto 0 );
    DDR2_odt : out STD_LOGIC_VECTOR ( 0 to 0 );
    user_in_tri_i : in STD_LOGIC_VECTOR ( 5 downto 0 );
    sys_clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    out_pwm : out STD_LOGIC
  );
  end component block_design;
begin
block_design_i: component block_design
     port map (
      DDR2_addr(12 downto 0) => DDR2_addr(12 downto 0),
      DDR2_ba(2 downto 0) => DDR2_ba(2 downto 0),
      DDR2_cas_n => DDR2_cas_n,
      DDR2_ck_n(0) => DDR2_ck_n(0),
      DDR2_ck_p(0) => DDR2_ck_p(0),
      DDR2_cke(0) => DDR2_cke(0),
      DDR2_cs_n(0) => DDR2_cs_n(0),
      DDR2_dm(1 downto 0) => DDR2_dm(1 downto 0),
      DDR2_dq(15 downto 0) => DDR2_dq(15 downto 0),
      DDR2_dqs_n(1 downto 0) => DDR2_dqs_n(1 downto 0),
      DDR2_dqs_p(1 downto 0) => DDR2_dqs_p(1 downto 0),
      DDR2_odt(0) => DDR2_odt(0),
      DDR2_ras_n => DDR2_ras_n,
      DDR2_we_n => DDR2_we_n,
      out_pwm => out_pwm,
      reset => reset,
      sys_clock => sys_clock,
      uart_rtl_rxd => uart_rtl_rxd,
      uart_rtl_txd => uart_rtl_txd,
      user_in_tri_i(5 downto 0) => user_in_tri_i(5 downto 0)
    );
end STRUCTURE;
