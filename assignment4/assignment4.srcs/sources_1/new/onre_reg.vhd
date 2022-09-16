
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity one_regs is
  Port ( 
  clk, reset, a, b : in std_logic;
  y : out std_logic);
end one_regs;

architecture Behavioral of one_regs is
 signal t : std_ulogic;

begin

process (clk, reset) is
-- signal t : std_ulogic;
begin
 if (reset = '1') then
 t <= '0';
 y <= '0';
 elsif (rising_edge(clk)) then
 t <= a xor b;
 y <= t;
 end if;
end process;

end Behavioral;
