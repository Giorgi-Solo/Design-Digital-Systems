library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity assignment2 is
    Port ( A  : in  STD_ULOGIC;
           B  : in  STD_ULOGIC;
           Q  : out STD_ULOGIC;
           QN : out STD_ULOGIC);
end assignment2;

architecture Behavioral of assignment2 is
signal internal1, internal2 : STD_ULOGIC;
begin

    internal1 <= A nor internal2;
    internal2 <= B nor internal1;
    
    Q  <= internal1;
    QN <= internal2;
end Behavioral;
