library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity D_flipflop is
    port(
        d, clk: in std_logic;
        a: out std_logic:='0';
        abar: out std_logic:='1'
    );
end D_flipflop;

architecture D_flipflop_arch of D_flipflop is
    begin
    ha: process(d,clk)
        begin
            if (rising_edge(clk)) then
                if d='1' then
                    a<='1';
                    abar<='0';
                else
                    a<='0';
                    abar<='1';
                end if;
            end if;
    end process ha;
end D_flipflop_arch;