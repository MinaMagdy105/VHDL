library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;

entity C_Reg is
    port (
        a   : in  bit16;
        clk : in  STD_LOGIC;
        q   : out bit16
    );
end C_Reg;

architecture C_Reg_Arch of C_Reg is
    begin
        process
            begin
                if rising_edge(clk) then
                    q <= a;
                end if;
        end process;
end C_Reg_Arch;