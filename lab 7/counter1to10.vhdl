library ieee;
use ieee.std_logic_1164.all;

entity counter1to10 is
    
    port (

count:in std_logic;
load :in std_logic;
a:in std_logic_vector(3 downto 0);
clear_b:out std_logic;
clk:in std_logic;
b:inout std_logic_vector (3 downto 0);
cout:out std_logic

);

end counter1to10;

architecture equations of counter1to10 is

component JKflipflop

port
    (
    s,r,c:in std_logic;
    q,qbar: inout std_logic
    );

end component;

signal loadbar, counting,qb:std_logic;
signal abar:std_logic_vector(3 downto 0); 
signal wand, wor:std_logic_vector(7 downto 0); 
signal outin:std_logic_vector(3 downto 0);
signal and1:std_logic_vector(2 downto 0);


begin

    loadbar<=not load;

        counting<=count and loadbar;

        abar(0)<=not a(0);
        abar(1)<=not a(1);
        abar(2)<=not a(2);
        abar(3)<=not a(3);

        wand(0)<=load and a(0);
        wand(1)<=load and abar(0);
        wand(2)<=load and a(1);
        wand(3)<=load and abar(1);
        wand(4)<=load and a(2);
        wand(5)<=load and abar(2);
        wand(6)<=load and a(3);
        wand(7)<=load and abar(3);
        
        wor(0)<=wand(0) or count;
        wor(1)<=wand(1) or count;
        
        outin(0)<=b(0);
        outin(1)<=b(1);
        outin(2)<=b(2);
        outin(3)<=b(3);
        
      
        and1(0) <= counting and outin(0);
        and1(1) <= counting and outin(0) and outin(1) ;
        and1(2) <= counting and outin(0) and outin(1) and outin(2);
        

            wor(2)<=wand(2) or and1(0);
            wor(3)<=wand(3) or and1(0);
            wor(4)<=wand(4) or and1(1);
            wor(5)<=wand(5) or and1(1);
            wor(6)<=wand(6) or and1(2);
            wor(7)<=wand(7) or and1(2);

       cout<=counting and outin(0) and outin(1) and outin(2) and outin(3); 

        jk1:JKflipflop port map(wor(0),wor(1),clk,outin(0),qb);

        jk2:JKflipflop port map(wor(0),wor(1),clk,outin(1),qb);
        
        jk3:JKflipflop port map(wor(0),wor(1),clk,outin(2),qb);
        
        jk4:JKflipflop port map(wor(0),wor(1),clk,outin(3),qb);
        
    end equations;