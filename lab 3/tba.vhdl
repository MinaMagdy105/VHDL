library ieee;
use ieee.std_logic_1164.all;

entity tba is 
	port (
        a, b: in std_logic_vector(1 downto 0); 
	    cin: in std_logic;
		sum: out std_logic_vector(1 downto 0);
        cout: out std_logic
    );
end tba;

architecture tba_arch of tba is
    component fa
        port (
            a, b, cin: in  std_logic;
            sum, cout: out std_logic
        );
    end component;

    signal c: std_logic;

    begin 
        FA0: fa port map (a(0), b(0), cin,sum(0), c);
        FA1: fa port map (a(1), b(1), c, sum(1), cout);
end tba_arch;