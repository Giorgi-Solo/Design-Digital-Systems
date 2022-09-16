
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_regs is
  Port ( 
  clk, reset, a, b : in std_logic;
  y : out std_logic);
end two_regs;

architecture Behavioral of two_regs is

begin

process (clk, reset) is
 variable t : std_ulogic;
begin
 if (reset = '1') then
 t := '0';
 y <= '0';
 elsif (rising_edge(clk)) then
 y <= t;
 t := a xor b;
 end if;
end process;

end Behavioral;
