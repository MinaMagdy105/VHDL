library ieee;
use ieee.std_logic_1164.all;

entity Dff_tb is
end Dff_tb;

architecture Dff_tb_arch of Dff_tb is 
    component Dff
        port(
            D,C:in std_logic;
            y,ybar:out std_logic
        );
    end component;

    signal D,C,y,ybar:std_logic;

    begin
        Dff1: Dff port map(D=>D,C=>C,y=>y,ybar=>ybar);
        process
            begin
                D<='X';
                C<='X';
                wait for 1 ns;

                D<='0';
                C<='1';
                wait for 1 ns;

                D<='0';
                C<='0';
                wait for 1 ns;

                D<='1';
                C<='0';
                wait for 1 ns;

                D<='1';
                C<='1';
                wait for 1 ns;

                D<='0';
                C<='0';
                wait for 1 ns;

                D<='1';
                C<='0';
                wait for 1 ns;
   
       end process;
end Dff_tb_arch;