library ieee;
use ieee.std_logic_1164.all;

entity Tff is 
port(
 t:in bit;
 c:in std_logic;
 q:inout bit
 );
end Tff;

architecture equations of Tff is
    begin
pro1:process(t,c)
begin
    if rising_edge(c) then 
    --q<='0';
    if t='0' then
        q<=q;
        else
        q<= not q;
    end if;
    else
        q<=q;
    end if;
    end process pro1;
    --qbar<= not q;
    end equations;