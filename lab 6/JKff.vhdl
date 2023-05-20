library ieee;
use ieee.std_logic_1164.all;
entity JKff is
port
(
s,r,c:in std_logic;
q,qbar: out std_logic
);
end JKff;
architecture sr of JKff is
signal a,b:std_logic;
begin
a<='0';
b<='1';
ha:process(s,r,c)
begin
if rising_edge(c) then
if s='1' and r='1' then
q<=a;
qbar<=b;
elsif s='1' and r='0' then
a<='1';
b<='0';
q<=a;
qbar<=b;
elsif s='0' and r='1' then
a<='0';
b<='1';
q<=a;
qbar<=b;
end if;
else
q<=a;
qbar<=b;
end if;
end process ha;
end sr;