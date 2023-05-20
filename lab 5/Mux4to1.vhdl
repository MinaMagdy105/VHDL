library ieee;
use ieee.std_logic_1164.all;

entity Mux4to1 is
    port(
        a0, a1, a2, a3: in bit_vector(1 downto 0);
        d: in bit_vector(1 downto 0);
        o: out bit_vector(1 downto 0)
    );
end Mux4to1;

architecture Mux4to1_arch of Mux4to1 is
    begin
        o<=a0 when(d="00") else
        a1 when(d="01") else
        a2 when(d="10")else
        a3;
end Mux4to1_arch;