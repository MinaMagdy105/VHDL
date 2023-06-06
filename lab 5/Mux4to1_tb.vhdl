library ieee;
use ieee.std_logic_1164.all;

entity Mux4to1_tb is
end Mux4to1_tb;

architecture test of Mux4to1_tb is
    component Mux4to1
        port(
            a0,a1,a2,a3:in bit_vector(1 downto 0);
            d:in bit_vector(1 downto 0);
            o:out bit_vector(1 downto 0)
        );
    end component;

    signal i0,i1,i2,i3:bit_vector(1 downto 0);
    signal s:bit_vector(1 downto 0);
    signal k:bit_vector(1 downto 0);
    
    begin
        mux:Mux4to1 port map(i0,i1,i2,i3,s,k);
        process 
            begin
                i0 <= "01";
                i1 <= "10";
                i2 <= "11";
                i3 <= "10";
                s  <= "00";
                wait for 10 ns;
                
                i0 <= "01";
                i1 <= "10";
                i2 <= "11";
                i3 <= "10";
                s  <= "01";
                wait for 10 ns;

                i0 <= "01";
                i1 <= "10";
                i2 <= "11";
                i3 <= "10";
                s  <= "11";
                wait for 10 ns;

                i0 <= "01";
                i1 <= "10";
                i2 <= "11";
                i3 <= "10";
                s  <= "10";
                wait for 10 ns;
            end process;
end test;