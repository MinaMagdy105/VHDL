library ieee;
use ieee.std_logic_1164.all;

entity fbas_tb is
end fbas_tb;

architecture fbas_tb_arch of fbas_tb is
    component fbas
        port ( 
            a, b: in std_logic_vector(3 downto 0);
            cin: in std_logic;
            sum: out std_logic_vector(3 downto 0);
            cout: out std_logic;
            n: in std_logic
        );
    end component;

    signal a, b, sum: std_logic_vector(3 downto 0);
    signal cin, cout, n: std_logic;


    begin
        fbas0: fbas port map(a, b, cin, sum, cout, n);
    
        process
            begin
                a<="0000";
                b<="0000";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0001";
                b<="0000";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0010";
                b<="0000";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0011";
                b<="0000";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0000";
                b<="0001";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0001";
                b<="0001";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0010";
                b<="0001";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0011";
                b<="0001";
                cin<='0';
                n<='1';
                wait for 10 ns;

                a<="0000";
                b<="0010";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0001";
                b<="0010";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0010";
                b<="0010";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0011";
                b<="0010";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0000";
                b<="0011";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0001";
                b<="0011";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0010";
                b<="0011";
                cin<='0';
                n<='0';
                wait for 10 ns;

                a<="0011";
                b<="0011";
                cin<='0';
                n<='0';
                wait for 10 ns;
        end process;
end fbas_tb_arch;