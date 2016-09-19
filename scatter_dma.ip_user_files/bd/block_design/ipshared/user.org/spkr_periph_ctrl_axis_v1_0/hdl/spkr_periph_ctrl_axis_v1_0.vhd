library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;

entity spkr_periph_ctrl_axis_v1_0 is
	generic (
		-- Users to add parameters here
        g_counter_width : integer := 10;
        g_ofifi_addr_width : integer := 4;
        g_grab_value : integer := 0;
		-- Parameters of Axi Slave Bus Interface input_axis
		C_input_axis_TDATA_WIDTH	: integer	:= 32
	);
	port (
		-- Users to add ports here
        out_pwm : out std_logic;
		-- Ports of Axi Slave Bus Interface input_axis
		input_axis_aclk	: in std_logic;
		input_axis_aresetn	: in std_logic;
		input_axis_tready	: out std_logic;
		input_axis_tdata	: in std_logic_vector(C_input_axis_TDATA_WIDTH-1 downto 0);
		input_axis_tstrb	: in std_logic_vector((C_input_axis_TDATA_WIDTH/8)-1 downto 0);
		input_axis_tlast	: in std_logic;
		input_axis_tvalid	: in std_logic
	);
end spkr_periph_ctrl_axis_v1_0;

architecture arch_imp of spkr_periph_ctrl_axis_v1_0 is

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

    ofifo_in_data <= input_axis_tdata( g_counter_width-1 downto 0 );
    ofifo_in_stb <= input_axis_tvalid;
    input_axis_tready <= ofifo_in_ack; 

    dma_fifo_inst : dma_fifo
        generic map (
            RAM_ADDR_WIDTH => c_ofifi_addr_width,
            FIFO_DWIDTH => c_counter_width )
        port map (
            clk => input_axis_aclk,
            resetn => input_axis_aresetn,
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
            clock => input_axis_aclk,
            nreset => input_axis_aresetn,
            ofifo_out_data => ofifo_out_data,
            ofifo_out_stb => ofifo_out_stb,
            ofifo_out_ack => ofifo_out_ack,
            ex_counter => ex_counter );
    
    generate_pwm_inst : generate_pwm 
        generic map (
            c_counter_width => c_counter_width )
        port map ( 
            clock => input_axis_aclk,
            nreset => input_axis_aresetn,
            ex_counter => ex_counter,
            out_pwm => out_pwm );

end arch_imp;
