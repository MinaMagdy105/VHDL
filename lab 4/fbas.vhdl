library ieee;
use ieee.std_logic_1164.all;

entity fbas is 
	port ( 
        a, b: in std_logic_vector(3 downto 0);   
        cin: in std_logic;
        sum: out std_logic_vector(3 downto 0);
        cout: out std_logic;
        n: in std_logic
    );
end fbas;

architecture fbas_arch of fbas is 
    component fba
        port (
            a : in  std_logic_vector (3 downto 0);
            b : in  std_logic_vector (3 downto 0);
            cin : in  std_logic;
            sum : out  std_logic_vector (3 downto 0);
            cout : out std_logic
        );
    end component;

    signal b_xor: std_logic_vector(3 downto 0);
    signal l: std_logic;

    begin
        l<=(cin or n);
        b_xor(0)<=b(0) xor n;
        b_xor(1)<=b(1) xor n;
        b_xor(2)<=b(2) xor n;
        b_xor(3)<=b(3) xor n;
        bit4: fba port map(a, b_xor, l, sum, cout);
 end fbas_arch;