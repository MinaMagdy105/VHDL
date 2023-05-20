library ieee;
use ieee.std_logic_1164.all;

entity JK_tb is
end JK_tb;

architecture JK_tb_arch of JK_tb is
    component JKlatch
        port(
            J,K: in std_logic;
            y, ybar: out std_logic
    );
    end component;

    signal J, K, y, ybar: std_logic;

    begin
        JK: JKff port map(J=>J,K=>K,y=>y,ybar=>ybar);
        
        process begin

            J<='X';
            K<='X';
            wait for 10 ns;
            
            J<='1';
            K<='0';
            wait for 10 ns;
            
            J<='1';
            K<='1';
            wait for 10 ns;
            
            J<='0';
            K<='1';
            wait for 10 ns;
            
            J<='1';
            K<='1';
            wait for 10 ns;
            
            J<='0';
            K<='0';
            wait for 10 ns;       
        end process;
end JK_tb_arch;