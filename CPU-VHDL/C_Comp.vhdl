library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;

entity C_Comp is
    port (
        a, b : in bit16;
        opr : in t_comp;
        c : out STD_LOGIC
    );
end C_Comp;

architecture C_Comp_Arch of C_Comp is
    begin
        process
            begin
                case opr is
                    when gt =>
                        if a > b then
                            c <= '1';
                        else
                            c <= '0';
                        end if;
                    
                    when eq =>
                        if a = b then
                            c <= '1';
                        else
                            c <= '0';
                        end if;

                    when lt =>
                        if a < b then
                            c <= '1';
                        else
                            c <= '0';
                        end if;

                    when lte =>
                        if a <= b then
                            c <= '1';
                        else
                            c <= '0';
                        end if;
                    
                    when gte =>
                        if a >= b then
                            c <= '1';
                        else
                            c <= '0';
                        end if;
                    
                    when neq =>
                        if a /= b then
                            c <= '1';
                        else
                            c <= '0';
                        end if;
                    when others => c <= '0';
                end case;
    end process;
end C_Comp_Arch;