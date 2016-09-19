library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;

entity spkr_periph_ctrl_v1_0 is
	generic (
		-- Users to add parameters here
        g_counter_width : integer := 10;
        g_ofifi_addr_width : integer := 4;
        g_grab_value : integer := 0;
		-- User parameters ends
		-- Parameters of Axi Slave Bus Interface S00_AXI
		C_S00_AXI_DATA_WIDTH	: integer	:= 32;
		C_S00_AXI_ADDR_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
        out_pwm : out std_logic;
		-- User ports ends
		-- Ports of Axi Slave Bus Interface S00_AXI
		s00_axi_aclk	: in std_logic;
		s00_axi_aresetn	: in std_logic;
		s00_axi_awaddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_awprot	: in std_logic_vector(2 downto 0);
		s00_axi_awvalid	: in std_logic;
		s00_axi_awready	: out std_logic;
		s00_axi_wdata	: in std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_wstrb	: in std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
		s00_axi_wvalid	: in std_logic;
		s00_axi_wready	: out std_logic;
		s00_axi_bresp	: out std_logic_vector(1 downto 0);
		s00_axi_bvalid	: out std_logic;
		s00_axi_bready	: in std_logic;
		s00_axi_araddr	: in std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
		s00_axi_arprot	: in std_logic_vector(2 downto 0);
		s00_axi_arvalid	: in std_logic;
		s00_axi_arready	: out std_logic;
		s00_axi_rdata	: out std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
		s00_axi_rresp	: out std_logic_vector(1 downto 0);
		s00_axi_rvalid	: out std_logic;
		s00_axi_rready	: in std_logic );
end spkr_periph_ctrl_v1_0;

architecture arch_imp of spkr_periph_ctrl_v1_0 is

    constant c_counter_width : integer := g_counter_width;
    constant c_ofifi_addr_width : integer := g_ofifi_addr_width;
    constant c_grab_value : integer := g_grab_value;
    signal ofifo_reset : std_logic;
    signal ofifo_in_ack : std_logic;
    signal ofifo_in_data : std_logic_vector( c_counter_width-1 downto 0 ); 
    signal ofifo_in_stb : std_logic;
    signal ofifo_out_ack : std_logic;
    signal ofifo_out_data : std_logic_vector( c_counter_width-1 downto 0 ); 
    signal ofifo_out_stb : std_logic;
    signal ex_counter : integer range 0 to get_max( c_counter_width );

	-- component declaration
	component spkr_periph_ctrl_v1_0_S00_AXI is
		generic (
            c_counter_width : integer := 16;
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            C_S_AXI_ADDR_WIDTH	: integer	:= 4 );
		port (
            ofifo_reset : out std_logic;
            ofifo_in_ack : in std_logic;
            ofifo_in_data : out std_logic_vector( c_counter_width-1 downto 0 ); 
            ofifo_in_stb : out std_logic;
            S_AXI_ACLK	: in std_logic;
            S_AXI_ARESETN	: in std_logic;
            S_AXI_AWADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_AWPROT	: in std_logic_vector(2 downto 0);
            S_AXI_AWVALID	: in std_logic;
            S_AXI_AWREADY	: out std_logic;
            S_AXI_WDATA	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_WSTRB	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
            S_AXI_WVALID	: in std_logic;
            S_AXI_WREADY	: out std_logic;
            S_AXI_BRESP	: out std_logic_vector(1 downto 0);
            S_AXI_BVALID	: out std_logic;
            S_AXI_BREADY	: in std_logic;
            S_AXI_ARADDR	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
            S_AXI_ARPROT	: in std_logic_vector(2 downto 0);
            S_AXI_ARVALID	: in std_logic;
            S_AXI_ARREADY	: out std_logic;
            S_AXI_RDATA	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
            S_AXI_RRESP	: out std_logic_vector(1 downto 0);
            S_AXI_RVALID	: out std_logic;
            S_AXI_RREADY	: in std_logic );
	end component spkr_periph_ctrl_v1_0_S00_AXI;
	
	component dma_fifo is
        generic (
            RAM_ADDR_WIDTH : integer := 3;
            FIFO_DWIDTH : integer := 16 );
        port (
            clk        : in  std_logic;
            resetn        : in  std_logic;
            fifo_reset    : in  std_logic;
            in_stb        : in  std_logic;
            in_ack        : out std_logic;
            in_data        : in  std_logic_vector(FIFO_DWIDTH-1 downto 0);
            out_stb        : out std_logic;    
            out_ack        : in  std_logic;
            out_data    : out std_logic_vector(FIFO_DWIDTH-1 downto 0) );
    end component dma_fifo;
    
    component submit_sample is
        generic (
            c_counter_width : integer := 16;
            c_grab_value : integer := 4 );
        port ( 
            clock : in std_logic;
            nreset : in std_logic;
            ofifo_out_data : in std_logic_vector( c_counter_width-1 downto 0 );
            ofifo_out_stb : in std_logic;
            ofifo_out_ack : out std_logic;
            ex_counter : out integer range 0 to get_max( c_counter_width ) );
    end component submit_sample;

    component generate_pwm is
        generic (
            c_counter_width : integer := 16 );
        port ( 
            clock : in std_logic;
            nreset : in std_logic;
            ex_counter : in integer range 0 to get_max( c_counter_width );
            out_pwm : out std_logic );
    end component generate_pwm;
    
begin

    spkr_periph_ctrl_v1_0_S00_AXI_inst : spkr_periph_ctrl_v1_0_S00_AXI
        generic map (
            c_counter_width => c_counter_width,
            C_S_AXI_DATA_WIDTH	=> C_S00_AXI_DATA_WIDTH,
            C_S_AXI_ADDR_WIDTH	=> C_S00_AXI_ADDR_WIDTH )
        port map (
            ofifo_reset => ofifo_reset,
            ofifo_in_ack => ofifo_in_ack,
            ofifo_in_data => ofifo_in_data,
            ofifo_in_stb => ofifo_in_stb,
            S_AXI_ACLK	=> s00_axi_aclk,
            S_AXI_ARESETN	=> s00_axi_aresetn,
            S_AXI_AWADDR	=> s00_axi_awaddr,
            S_AXI_AWPROT	=> s00_axi_awprot,
            S_AXI_AWVALID	=> s00_axi_awvalid,
            S_AXI_AWREADY	=> s00_axi_awready,
            S_AXI_WDATA	=> s00_axi_wdata,
            S_AXI_WSTRB	=> s00_axi_wstrb,
            S_AXI_WVALID	=> s00_axi_wvalid,
            S_AXI_WREADY	=> s00_axi_wready,
            S_AXI_BRESP	=> s00_axi_bresp,
            S_AXI_BVALID	=> s00_axi_bvalid,
            S_AXI_BREADY	=> s00_axi_bready,
            S_AXI_ARADDR	=> s00_axi_araddr,
            S_AXI_ARPROT	=> s00_axi_arprot,
            S_AXI_ARVALID	=> s00_axi_arvalid,
            S_AXI_ARREADY	=> s00_axi_arready,
            S_AXI_RDATA	=> s00_axi_rdata,
            S_AXI_RRESP	=> s00_axi_rresp,
            S_AXI_RVALID	=> s00_axi_rvalid,
            S_AXI_RREADY	=> s00_axi_rready );

	dma_fifo_inst : dma_fifo
        generic map (
            RAM_ADDR_WIDTH => c_ofifi_addr_width,
            FIFO_DWIDTH => c_counter_width )
        port map (
            clk => s00_axi_aclk,
            resetn => s00_axi_aresetn,
            fifo_reset => ofifo_reset,
            in_stb => ofifo_in_stb,
            in_ack => ofifo_in_ack,
            in_data => ofifo_in_data,
            out_stb => ofifo_out_stb,
            out_ack => ofifo_out_ack,
            out_data => ofifo_out_data );
            
    submit_sample_inst : submit_sample 
        generic map (
            c_counter_width => c_counter_width,
            c_grab_value => c_grab_value )
        port map ( 
            clock => s00_axi_aclk,
            nreset => s00_axi_aresetn,
            ofifo_out_data => ofifo_out_data,
            ofifo_out_stb => ofifo_out_stb,
            ofifo_out_ack => ofifo_out_ack,
            ex_counter => ex_counter );

    generate_pwm_inst : generate_pwm 
        generic map (
            c_counter_width => c_counter_width )
        port map ( 
            clock => s00_axi_aclk,
            nreset => s00_axi_aresetn,
            ex_counter => ex_counter,
            out_pwm => out_pwm );

end arch_imp;
