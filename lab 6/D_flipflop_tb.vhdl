library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity D_flipflop_tb is
end D_flipflop_tb;
architecture s of D_flipflop_tb is
component D_flipflop
port
(
d,clk:in std_logic;
a,abar:out std_logic
);
end component;
signal d,clk,a,abar: std_logic;
begin
ha: D_flipflop port map (d,clk,a,abar);
process begin
clk<='0';
d<='1';
wait for 1 ns;
clk<='1';
d<='1';
wait for 1 ns;
clk<='0';
d<='0';
wait for 1 ns;
clk<='1';
d<='0';
wait for 1 ns;
end process;
end s;