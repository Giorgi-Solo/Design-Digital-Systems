

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity latches is
  Port (
    D, G : in  std_logic;
    Q    : out std_logic
   );
end latches;

architecture Behavioral of latches is

begin

    process(D,G) is
    begin
            if (G = '1') then
                Q <= D;
            end if;
    end process;

end Behavioral;
