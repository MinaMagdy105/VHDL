library ieee;
use ieee.std_logic_1164.all;

entity Tff_tb is
    end Tff_tb;

    architecture test of Tff_tb is
component Tff 
port(
 t:in bit;
 c:in std_logic;
 q:inout bit;
qbar:out bit
 );
    end component;
    signal t,q,qbar:bit;
    signal c:std_logic;
        begin
            f:Tff port map(t,c,q,qbar);
            process begin

                
                t<='0';
                c<='0';
                wait for 1 ns;
                
                t<='1';
                c<='1';
                wait for 1 ns; 

                t<='0';
                c<='0';
                wait for 1 ns;
                
                t<='1';
                c<='1';
                wait for 1 ns; 

                t<='1';
                c<='0';
                wait for 1 ns;
                
                t<='1';
                c<='1';
                wait for 1 ns;               

       assert false report "Reached end of test";
       wait;
       
           end process;
        end test;