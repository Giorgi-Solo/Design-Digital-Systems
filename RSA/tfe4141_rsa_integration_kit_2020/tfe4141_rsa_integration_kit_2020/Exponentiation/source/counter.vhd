----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- Create Date: 10/08/2022 10:01:50 PM
-- Module Name: counter - Behavioral 
-- Description: 
--             Inputs:  start
--             Outputs: reg_en_i
--
--              This module asserts reg_en_i after each 256 clock cycles 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity counter is
  Port 
  (
    -- posedge clock and negative active reset
    clk             : in std_logic;
    reset_n         : in std_logic;
    
    -- Input from RSA_Core Controller
    start  : in  std_logic;
    
    -- Output to RSA_Core datapath
    reg_en_i    : out std_logic
   );
end counter;

architecture Behavioral of counter is

    signal counter  : std_logic_vector(7 downto 0);
    signal reg_en_R : std_logic;
begin

    CounterProc: process(clk, reset_n) begin
        if (reset_n = '0') then
            counter <= (others => '0');
            reg_en_R  <= '0';
        elsif (clk'event and clk='1') then
            if (start = '1') then
                counter <= (others => '0');
                reg_en_R  <= '0';
            else 
                if (reg_en_R = '1') then
                    counter <= (others => '0');
                else
                    counter <= std_logic_vector(UNSIGNED(counter) + 1);
                end if;
                
                if (counter = x"FF") then
                    reg_en_R <= '1';
                else
                    reg_en_R <= '0';
                end if;
            end if;
        end if;
    end process CounterProc;
    
    reg_en_i <= reg_en_R;
end Behavioral;