library ieee;
use ieee.std_logic_1164.all;

entity fa is
    port (
        a, b, cin: in  std_logic;
        sum, cout: out std_logic
    );
end fa;

architecture fa_arch of fa is
begin
    sum <= a xor b xor cin;
    cout <= (a and b) or (a and cin) or (b and cin);
end fa_arch;