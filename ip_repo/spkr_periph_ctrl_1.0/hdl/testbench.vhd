library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.common.all;
use work.sim_axi_lite_master.all;

entity testbench is
end testbench;

architecture Behavioral of testbench is

    constant g_counter_width : integer := 10;
    constant g_ofifi_addr_width : integer := 4;
    constant g_grab_value : integer := 0;
    constant C_S00_AXI_DATA_WIDTH    : integer    := c_data_width;
    constant C_S00_AXI_ADDR_WIDTH    : integer    := c_addr_width;
    constant clock_period : time := 10 ns;
    constant sample_period : time := clock_period * (2**g_counter_width) * (g_grab_value+1);
    signal clock_signal : std_logic;
    signal resetn : std_logic := '0';
    signal out_pwm : std_logic;
    signal s00_axi_awaddr    : std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    signal s00_axi_awprot    : std_logic_vector(2 downto 0);
    signal s00_axi_awvalid    : std_logic;
    signal s00_axi_awready    : std_logic;
    signal s00_axi_wdata    : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    signal s00_axi_wstrb    : std_logic_vector((C_S00_AXI_DATA_WIDTH/8)-1 downto 0);
    signal s00_axi_wvalid    : std_logic;
    signal s00_axi_wready    : std_logic;
    signal s00_axi_bresp    : std_logic_vector(1 downto 0);
    signal s00_axi_bvalid    : std_logic;
    signal s00_axi_bready    : std_logic;
    signal s00_axi_araddr    : std_logic_vector(C_S00_AXI_ADDR_WIDTH-1 downto 0);
    signal s00_axi_arprot    : std_logic_vector(2 downto 0);
    signal s00_axi_arvalid    : std_logic;
    signal s00_axi_arready    : std_logic;
    signal s00_axi_rdata    : std_logic_vector(C_S00_AXI_DATA_WIDTH-1 downto 0);
    signal s00_axi_rresp    : std_logic_vector(1 downto 0);
    signal s00_axi_rvalid    : std_logic;
    signal s00_axi_rready    : std_logic;
    
    signal set_addr : std_logic_vector( c_addr_width-1 downto 0 );
    signal set_strb : std_logic_vector( (c_data_width/8)-1 downto 0 );
    signal set_data : std_logic_vector( c_data_width-1 downto 0 );
    signal get_data : std_logic_vector( c_data_width-1 downto 0 );
    
    component spkr_periph_ctrl_v1_0 is
        port (
            out_pwm : out std_logic;
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
    end component spkr_periph_ctrl_v1_0;
    
begin

    spkr_periph_ctrl_v1_0_inst : spkr_periph_ctrl_v1_0 
        port map (
            out_pwm => out_pwm,
            s00_axi_aclk => clock_signal,
            s00_axi_aresetn	=> resetn,
            s00_axi_awaddr => s00_axi_awaddr,
            s00_axi_awprot => s00_axi_awprot,
            s00_axi_awvalid	=> s00_axi_awvalid,
            s00_axi_awready	=> s00_axi_awready,
            s00_axi_wdata => s00_axi_wdata,
            s00_axi_wstrb => s00_axi_wstrb,
            s00_axi_wvalid => s00_axi_wvalid,
            s00_axi_wready => s00_axi_wready,
            s00_axi_bresp => s00_axi_bresp,
            s00_axi_bvalid => s00_axi_bvalid,
            s00_axi_bready => s00_axi_bready,
            s00_axi_araddr => s00_axi_araddr,
            s00_axi_arprot => s00_axi_arprot,
            s00_axi_arvalid => s00_axi_arvalid,
            s00_axi_arready => s00_axi_arready,
            s00_axi_rdata => s00_axi_rdata,
            s00_axi_rresp => s00_axi_rresp,
            s00_axi_rvalid => s00_axi_rvalid,
            s00_axi_rready => s00_axi_rready );

    clock_process : process 
    begin
        clock_signal <= '1';
        wait for clock_period/2;
        clock_signal <= '0';
        wait for clock_period/2;
    end process;
    
    reset_process : process
    begin
        wait_for_next_posedge ( clock_signal );
        resetn <= '1';
    end process;
    
    address_process : process
        procedure perform_write_address_wrapper is
        begin
            perform_address ( 
                clock => clock_signal,
                addr => s00_axi_awaddr,
                valid => s00_axi_awvalid,
                ready => s00_axi_awready,
                set_addr => set_addr );
        end procedure;
        procedure perform_read_address_wrapper is
        begin
            perform_address ( 
                clock => clock_signal,
                addr => s00_axi_araddr,
                valid => s00_axi_rvalid,
                ready => s00_axi_arready,
                set_addr => set_addr );
        end procedure;
    begin
        wait until resetn='1';
        wait_for_next_posedge ( clock_signal );
        wait_for_next_posedge ( clock_signal );
        set_addr <= "01" & "00";
        perform_write_address_wrapper;
        perform_write_address_wrapper;
        wait;
    end process;
    
    data_process : process
        procedure perform_write_wrapper  is
        begin
            perform_write (
                clock => clock_signal,
                strb => s00_axi_wstrb,
                data => s00_axi_wdata,
                valid => s00_axi_wvalid,
                ready => s00_axi_wready,
                set_strb => set_strb,
                set_data => set_data );
        end procedure;
        procedure perform_read_wrapper is
        begin
            perform_read (
                clock => clock_signal,
                resp => s00_axi_rresp,
                data => s00_axi_rdata,
                valid => s00_axi_rvalid,
                ready => s00_axi_rready,
                get_data => get_data );
        end procedure;
    begin
        wait until resetn='1';
        wait_for_next_posedge ( clock_signal );
        wait_for_next_posedge ( clock_signal );
        set_strb <=  "1111";
        set_data <= x"000001ff";
        perform_write_wrapper;
        set_data <= x"0000000f";
        perform_write_wrapper;
        wait;
    end process;
    
    response_process : process
        procedure perform_response_wrapper is 
        begin
            perform_response (
                clock => clock_signal,
                resp => s00_axi_bresp,
                valid => s00_axi_bvalid,
                ready => s00_axi_bready );
        end procedure;
    begin
        wait until resetn='1';
        wait_for_next_posedge ( clock_signal );
        wait_for_next_posedge ( clock_signal );
        perform_response_wrapper;
        perform_response_wrapper;
    end process;


end Behavioral;
