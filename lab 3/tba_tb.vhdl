library ieee;
use ieee.std_logic_1164.all;

entity tba_tb is
end tba_tb;

architecture tba_tb_arch of tba_tb is
    component tba
        port (
            a, b: in std_logic_vector(1 downto 0); 
            cin: in std_logic;
            sum: out std_logic_vector(1 downto 0);
            cout: out std_logic
        );
    end component;

    signal a, b, sum: std_logic_vector(1 downto 0);
    signal cin, cout : std_logic;


    begin
        tba0: tba port map(a, b, cin, sum, cout);
    
        process
            begin
                a<="00";
                b<="00";
                cin<='0';
                wait for 10 ns;

                a<="01";
                b<="00";
                cin<='0';
                wait for 10 ns;

                a<="10";
                b<="00";
                cin<='0';
                wait for 10 ns;

                a<="11";
                b<="00";
                cin<='0';
                wait for 10 ns;

                a<="00";
                b<="01";
                cin<='0';
                wait for 10 ns;

                a<="01";
                b<="01";
                cin<='0';
                wait for 10 ns;

                a<="10";
                b<="01";
                cin<='0';
                wait for 10 ns;

                a<="11";
                b<="01";
                cin<='0';
                wait for 10 ns;


                a<="00";
                b<="10";
                cin<='0';
                wait for 10 ns;

                a<="01";
                b<="10";
                cin<='0';
                wait for 10 ns;

                a<="10";
                b<="10";
                cin<='0';
                wait for 10 ns;

                a<="11";
                b<="10";
                cin<='0';
                wait for 10 ns;

                a<="00";
                b<="11";
                cin<='0';
                wait for 10 ns;

                a<="01";
                b<="11";
                cin<='0';
                wait for 10 ns;

                a<="10";
                b<="11";
                cin<='0';
                wait for 10 ns;

                a<="11";
                b<="11";
                cin<='0';
                wait for 10 ns;

                a<="00";
                b<="00";
                cin<='1';
                wait for 10 ns;

                a<="01";
                b<="00";
                cin<='1';
                wait for 10 ns;

                a<="10";
                b<="00";
                cin<='1';
                wait for 10 ns;

                a<="11";
                b<="00";
                cin<='1';
                wait for 10 ns;

                a<="00";
                b<="01";
                cin<='1';
                wait for 10 ns;

                a<="01";
                b<="01";
                cin<='1';
                wait for 10 ns;

                a<="10";
                b<="01";
                cin<='1';
                wait for 10 ns;

                a<="11";
                b<="01";
                cin<='1';
                wait for 10 ns;


                a<="00";
                b<="10";
                cin<='1';
                wait for 10 ns;

                a<="01";
                b<="10";
                cin<='1';
                wait for 10 ns;

                a<="10";
                b<="10";
                cin<='1';
                wait for 10 ns;

                a<="11";
                b<="10";
                cin<='1';
                wait for 10 ns;

                a<="00";
                b<="11";
                cin<='1';
                wait for 10 ns;

                a<="01";
                b<="11";
                cin<='1';
                wait for 10 ns;

                a<="10";
                b<="11";
                cin<='1';
                wait for 10 ns;

                a<="11";
                b<="11";
                cin<='1';
                wait for 10 ns;
        end process;
end tba_tb_arch;