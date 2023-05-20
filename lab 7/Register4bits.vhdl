library ieee;
use ieee.std_logic_1164.all;

entity Register4bits is
    port(
        load:in bit;
        clk:in std_logic;
        clr:in bit;
        i:in bit_vector(3 downto 0);
        a:inout bit_vector(3 downto 0)
    );
    end Register4bits;

    architecture equations of Register4bits is

        begin
           p1: process(load,clk,clr)
           begin
            if clr='1' then 
            a<="0000";
             else
                if rising_edge(clk)  then
                    if load='1'  then 
                    a<=i;
                    else 
                    a<=a;
                end if;
            end if;
            end if;
            end process;
            end equations;