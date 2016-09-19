library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.common.all;

entity submit_sample is
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
end submit_sample;

architecture Behavioral of submit_sample is
    constant counter_max : integer := get_max( c_counter_width );
    subtype t_counter is integer range 0 to counter_max;
    subtype t_grab is integer range 0 to c_grab_value;
    signal submit_counter : t_counter;
    signal next_counter : t_counter;
    signal next_grab : t_grab;
begin

    process ( clock )
    begin
        if ( rising_edge( clock ) ) then
            if ( nreset='0' ) then
                submit_counter <= 0;
                ex_counter <= 0;
            else
                if ( submit_counter=0 ) then
                    ex_counter <= next_counter;
                end if;
                if ( submit_counter=counter_max ) then
                    submit_counter <= 0;
                else
                    submit_counter <= submit_counter+1;
                end if;
            end if;
        end if;
    end process;
    
    process ( clock )
    begin
        if ( rising_edge( clock ) ) then
            if ( nreset='0' ) then
                ofifo_out_ack <= '0';
                next_counter <= 0;
                next_grab <= 0;
            else --  and 
                if ( submit_counter=0 ) then
                    if ( next_grab=c_grab_value )  then
                        if ( ofifo_out_stb='1' ) then
                            next_counter <= to_integer( unsigned( ofifo_out_data ) );
                            ofifo_out_ack <= '1';
                        end if;
                        next_grab <= 0;
                    else
                        next_grab <= next_grab+1;
                    end if;
                else
                    ofifo_out_ack <= '0';
                end if;
            end if;
        end if;
    end process;

end Behavioral;
