library ieee;
use work.cpu_lib.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity C_ALU is
   port (
      a, b: in bit16;
      opr: in t_alu;
      c: iut bit16
   );
end C_ALU;

architecture C_ALU_Arch of C_ALU is
   begin
      process
         begin
            case opr is
               when
                  andOp => c <= a AND b;

               when
                  orOp => c <= a OR b;

               when
                  xorOp => c <= a XOR b;

               when
                  notOp => c <= NOT a;

               when
                  plus => c <= a + b;

               when
                  alusub => c <= a - b;

               when
                  alupass => c <= a;

               when
                  inc => c <= a + "0000000000000001";

               when
                  dec => c <= a - "0000000000000001";

               when
                  zero => c <= "0000000000000000";

               when
                  others => c <= "0000000000000000";
            end case;
      end process;
end C_ALU_Arch;