library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity C_Reg_Array is
    PORT (
        data : IN bit16;
        opr : IN t_reg;
        en : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        q : OUT bit16
    );
end C_Reg_Array;

architecture C_Reg_Array_Arch of C_Reg_Array is
    type t_array is array (0 to 7) of bit16;
    SIGNAL temp_q : bit16;
    begin
        process
            variable regData : t_array;
            begin
                if rising_edge(clk) then
                    regData(conv_integer(opr)) := data;
                end if;
                temp_q <= regData(conv_integer(opr));
        end process;

        process
            begin
                if en = '1' then
                    q <= temp_q after 1 ns;
                else
                    q <= "ZZZZZZZZZZZZZZZZ";
                end if;
        end process;
end C_Reg_ArrayArch;