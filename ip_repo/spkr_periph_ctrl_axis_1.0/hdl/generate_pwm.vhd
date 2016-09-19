----------------------------------------------------------------------------------
-- Purpose: The purpose of generate_pwm is to generate the pwm signal that drives
-- the Digilent Speaker peripheral board.
-- Author: Andrew Powell
----------------------------------------------------------------------------------

library ieee; 
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

library work;
use work.common.all;

entity generate_pwm is
    generic (
        c_counter_width : integer := 16 );
    port ( 
        clock : in std_logic;
        nreset : in std_logic;
        ex_counter : in integer range 0 to get_max( c_counter_width );
        out_pwm : out std_logic );
end generate_pwm;

architecture Behavioral of generate_pwm is
    constant counter_max : integer := get_max( c_counter_width );
    signal in_counter : integer range 0 to counter_max;
begin
    -- Generate pwm.
    process ( clock )
    begin
        if rising_edge( clock ) then
            if nreset='0' then
                in_counter <= 0;
                out_pwm <= '0';
            else
                if ( in_counter < ex_counter ) then
                    out_pwm <= '1';
                else
                    out_pwm <= '0';
                end if;
                if ( in_counter=counter_max ) then
                    in_counter <= 0;
                else
                    in_counter <= in_counter+1;
                end if;
            end if;
        end if;
    end process;
end Behavioral;
