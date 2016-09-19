
library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

package common is
    function get_max( width : integer ) return integer;
    function get_width ( max : integer ) return integer;
end package;

package body common is

    function get_max( width : integer ) return integer is
    begin
        return integer((2**width)-1); 
    end function;
    
    function get_width ( max : integer ) return integer is
        variable curr_max, bitcount : integer;
    begin
        curr_max := max-1;
        bitcount := 0;
        while ( curr_max > 0 ) loop
            bitcount := bitcount+1;
            curr_max := curr_max/2;
        end loop;
        return bitcount;
    end function;
    
end package body;

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

package sim_axi_lite_master is

    constant c_addr_width : integer := 4;
    constant c_data_width : integer := 32;
    
    procedure wait_for_next_posedge ( signal sig : in std_logic );
    
    procedure perform_address ( 
        signal clock : in std_logic;
        signal addr : out std_logic_vector( c_addr_width-1 downto 0 );
        signal valid : out std_logic;
        signal ready : in std_logic;
        signal set_addr : in std_logic_vector( c_addr_width-1 downto 0 ) );
        
    procedure perform_write (
        signal clock : in std_logic;
        signal strb : out std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal data : out std_logic_vector( c_data_width-1 downto 0 );
        signal valid : out std_logic;
        signal ready : in std_logic;
        signal set_strb : in std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal set_data : in std_logic_vector( c_data_width-1 downto 0 ) );
        
    procedure perform_response (
        signal clock : in std_logic;
        signal resp : in std_logic_vector( 1 downto 0 );
        signal valid : in std_logic;
        signal ready : out std_logic );
        
    procedure perform_read (
        signal clock : in std_logic;
        signal resp : in std_logic_vector( 1 downto 0 );
        signal data : in std_logic_vector( c_data_width-1 downto 0 );
        signal valid : in std_logic;
        signal ready : out std_logic;
        signal get_data : out std_logic_vector( c_data_width-1 downto 0 ) );
    
    procedure perform_axi_lite_write (
        signal clock : in std_logic;
        signal awaddr : out std_logic_vector( c_addr_width-1 downto 0 );
        signal awvalid : out std_logic;
        signal awready : in std_logic;
        signal wstrb : out std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal wdata : out std_logic_vector( c_data_width-1 downto 0 );
        signal wvalid : out std_logic;
        signal wready : in std_logic;
        signal bresp : in std_logic_vector( 1 downto 0 );
        signal bvalid : in std_logic;
        signal bready : out std_logic;
        signal set_addr : in std_logic_vector( c_addr_width-1 downto 0 );
        signal set_strb : in std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal set_data : in std_logic_vector( c_data_width-1 downto 0 ) );
    
    procedure perform_axi_lite_read (
        signal clock : in std_logic;
        signal araddr : out std_logic_vector( c_addr_width-1 downto 0 );
        signal arvalid : out std_logic;
        signal arready : in std_logic;
        signal rresp : in std_logic_vector( 1 downto 0 );
        signal rdata : in std_logic_vector( c_data_width-1 downto 0 );
        signal rvalid : in std_logic;
        signal rready : out std_logic;
        signal set_addr : in std_logic_vector( c_addr_width-1 downto 0 );
        signal get_data : out std_logic_vector( c_data_width-1 downto 0 ) ); 
    
end package;

package body sim_axi_lite_master is

    procedure wait_for_next_posedge ( signal sig : in std_logic ) is
    begin
        wait until sig='0';
        wait until sig='1';
    end procedure;

--    procedure sample (
--        signal clock : in std_logic;  
--        signal valid : out std_logic; 
--        signal ready : in std_logic;
--        start : in boolean ) is
--    begin
--        wait_for_next_posedge( clock );
--        if ( start=True ) then
--            valid <= '1';
--            wait_for_next_posedge( clock );
--            while ( ready='0' ) loop
--                wait_for_next_posedge( clock );
--            end loop;
--        else
--            valid <= '0';
--        end if;
--    end procedure;

    procedure handshake ( 
        signal clock : in std_logic; 
        signal valid : out std_logic; 
        signal ready : in std_logic ) is
    begin
        wait_for_next_posedge( clock );
        valid <= '1';
        wait_for_next_posedge( clock );
        while ( ready='0' ) loop
            wait_for_next_posedge( clock );
        end loop;
        valid <= '0';
    end procedure;
    
    procedure perform_address ( 
        signal clock : in std_logic;
        signal addr : out std_logic_vector( c_addr_width-1 downto 0 );
        signal valid : out std_logic;
        signal ready : in std_logic;
        signal set_addr : in std_logic_vector( c_addr_width-1 downto 0 ) ) is
    begin
        wait_for_next_posedge( clock );
        addr <= set_addr;
        handshake( clock, valid, ready );
    end procedure;
    
    procedure perform_write (
        signal clock : in std_logic;
        signal strb : out std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal data : out std_logic_vector( c_data_width-1 downto 0 );
        signal valid : out std_logic;
        signal ready : in std_logic;
        signal set_strb : in std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal set_data : in std_logic_vector( c_data_width-1 downto 0 ) ) is
    begin
        wait_for_next_posedge( clock );
        strb <= set_strb;
        data <= set_data;
        handshake( clock, valid, ready );
    end procedure;
    
    procedure perform_response (
        signal clock : in std_logic;
        signal resp : in std_logic_vector( 1 downto 0 );
        signal valid : in std_logic;
        signal ready : out std_logic ) is
        variable get_resp : std_logic_vector( 1 downto 0 );
    begin
        handshake( clock, ready, valid );
        get_resp := resp;
        assert get_resp="00" 
            report "Write Response reported failure: " & integer'image( to_integer( unsigned( get_resp ) ) ) 
            severity error;
    end procedure;
    
    procedure perform_read (
        signal clock : in std_logic;
        signal resp : in std_logic_vector( 1 downto 0 );
        signal data : in std_logic_vector( c_data_width-1 downto 0 );
        signal valid : in std_logic;
        signal ready : out std_logic;
        signal get_data : out std_logic_vector( c_data_width-1 downto 0 ) ) is
        variable get_resp : std_logic_vector( 1 downto 0 );
    begin
        handshake( clock, ready, valid );
        get_resp := resp;
        get_data <= data;
        assert get_resp="00" 
            report "Read Response reported failure: " & integer'image( to_integer( unsigned( get_resp ) ) ) 
            severity error;
    end procedure;
    
    procedure perform_axi_lite_write (
        signal clock : in std_logic;
        signal awaddr : out std_logic_vector( c_addr_width-1 downto 0 );
        signal awvalid : out std_logic;
        signal awready : in std_logic;
        signal wstrb : out std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal wdata : out std_logic_vector( c_data_width-1 downto 0 );
        signal wvalid : out std_logic;
        signal wready : in std_logic;
        signal bresp : in std_logic_vector( 1 downto 0 );
        signal bvalid : in std_logic;
        signal bready : out std_logic;
        signal set_addr : in std_logic_vector( c_addr_width-1 downto 0 );
        signal set_strb : in std_logic_vector( (c_data_width/8)-1 downto 0 );
        signal set_data : in std_logic_vector( c_data_width-1 downto 0 ) ) is
    begin
        perform_address( clock, awaddr, awvalid, awready, set_addr );
        perform_write( clock, wstrb, wdata, wvalid, wready, set_strb, set_data );
        perform_response( clock, bresp, bvalid, bready );
    end procedure;
        
    procedure perform_axi_lite_read (
        signal clock : in std_logic;
        signal araddr : out std_logic_vector( c_addr_width-1 downto 0 );
        signal arvalid : out std_logic;
        signal arready : in std_logic;
        signal rresp : in std_logic_vector( 1 downto 0 );
        signal rdata : in std_logic_vector( c_data_width-1 downto 0 );
        signal rvalid : in std_logic;
        signal rready : out std_logic;
        signal set_addr : in std_logic_vector( c_addr_width-1 downto 0 );
        signal get_data : out std_logic_vector( c_data_width-1 downto 0 ) ) is
    begin
        perform_address( clock, araddr, arvalid, arready, set_addr );
        perform_read( clock, rresp, rdata, rvalid, rready, get_data );
    end procedure;

end package body;
