library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;

entity C_Shift is
    PORT (
        a : in bit16;
        opr : in t_C_shift;
        y : out bit16
    );
end C_Shift;

architecture C_Shift_Arch of C_Shift is
    begin
        process
            begin
                case opr is
                    when shftpass => y <= a;

                    when rotr => y <= a(0) & a(15 downto 1);
                    
                    when shr => y <= '0' & a(15 downto 1);
                    
                    when rotl => y <= a(14 downto 0) & a(15);

                    when shl => y <= a(14 downto 0) & '0';

                    when others => y <= a;
                end case;
        end process;
end C_Shift_Arch;