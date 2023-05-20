library ieee;
use ieee.std_logic_1164.all;

entity fba is
    port (
        a : in  std_logic_vector (3 downto 0);
        b : in  std_logic_vector (3 downto 0);
        cin : in  std_logic;
        sum : out  std_logic_vector (3 downto 0);
        cout : out std_logic
    );
end fba;

architecture arc_fba of fba is
    component fa is
        port (
            a, b, cin : in  std_logic;
            sum, cout : out std_logic
        );
        end component;
    signal c1, c2, c3, co: std_logic;
begin
    fa0: fa port map(a(0), b(0), cin, sum(0), c1);
    fa1: fa port map(a(1), b(1), c1, sum(1), c2);
    fa2: fa port map(a(2), b(2), c2, sum(2), c3);
    fa3: fa port map(a(3), b(3), c3, sum(3), co);
    cout <= co;
end arc_fba;