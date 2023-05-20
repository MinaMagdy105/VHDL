library ieee;
use ieee.std_logic_1164.all;

entity decoder2to4 is
    port(
        a:in bit;
        b:in bit;
        y0:out bit;
        y1:out bit;
        y2:out bit;
        y3:out bit
    );
    end decoder2to4;

    architecture equations of decoder2to4 is

        begin
                y0<=(not b)and (not a);
                y1<=(b)and (not a) ;
                y2<=(not b)and (a) ;
                y3<=(b)and (a) ;
            end equations;