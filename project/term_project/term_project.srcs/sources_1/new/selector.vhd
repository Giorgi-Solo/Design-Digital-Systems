----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2022 07:59:09 PM
-- Design Name: 
-- Module Name: selector - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

entity selector is
  generic
  (
    coreNumber   : integer := 4;
    counterSize  : integer := 2
  );
  Port 
  (
    -- posedge clock and negative active reset
    clk     : in std_logic;
    reset_n : in std_logic;
    
    -- 
    valid   : in std_logic;
    ready   : in std_logic;
    
    -- Output to RSA_Core datapath
    id      : out integer --std_logic_vector(counterSize - 1 downto 0)
   );
end selector;

architecture Behavioral of selector is
    signal counter : integer; --std_logic_vector(counterSize -1 downto 0);
begin
    idSelector: process (clk, reset_n) begin
        if (reset_n = '0') then
            counter <= 0;
        elsif (clk'event and clk='1') then
            if (counter = (coreNumber - 1)) then
                counter <= 0;
            elsif ((valid = '1') and (ready = '1')) then
                counter <= counter + 1;
            end if;
        end if;
    end process idSelector;
    
    id <= counter;
end Behavioral;
