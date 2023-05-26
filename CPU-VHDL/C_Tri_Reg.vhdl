library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;

entity C_Tri_Reg is
    PORT (
        a : in bit16;
        en : in STD_LOGIC;
        clk : in STD_LOGIC;
        q : out bit16
    );
end C_Tri_Reg;

architecture C_Tri_Reg_Arch of C_Tri_Reg is
    signal val : bit16;
    
    begin
        process
            begin
                if rising_edge(clk) then
                    val <= a;
                end if;
        end process;

    process (en, val)
        begin
            if en = '1' then
                q <= val;
            else
                q <= "ZZZZZZZZZZZZZZZZ";
            end if;
    end process;
end C_Tri_Reg_Arch;