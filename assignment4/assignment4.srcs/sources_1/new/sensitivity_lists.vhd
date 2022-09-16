
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sensitivity_lists is
  Port (
   a, b: in  std_logic;
    y    : out std_logic );
end sensitivity_lists;

architecture Behavioral of sensitivity_lists is

begin

process (a, b) is
begin
 if (a = '1') then
 y <= b;
 else
 y <= '0';
 end if;
end process; 

end Behavioral;
