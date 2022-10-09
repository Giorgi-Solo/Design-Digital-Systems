----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 10/09/2022 03:23:44 AM
-- Module Name: mod_mult_tb - Behavioral
-- Description: 
--              This module test modular multiplication
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity mod_mult_tb is
end mod_mult_tb;

architecture Behavioral of mod_mult_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    -- Inputs
    signal a, b, n : std_logic_vector(255 downto 0);
    signal reg_en  : std_logic := '1';
    
    -- Output
    signal r : std_logic_vector(255 downto 0);
begin

    -- Clock generation
    clk <= not clk after clkPeriod/2;
  
    -- RSA_Controller Instantiation
    dut_mod_mult: entity work.mod_mult
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs
                a => a,
                b => b, 
                n => n,
                
                reg_en => reg_en,
                
                -- Output 
                r => r
            );
            
    -- Stimulli
    stimulli:process begin
        a <= x"0000000000000000000000000000000000000000000000000000000000000003";
        b <= x"0000000000000000000000000000000000000000000000000000000000000002";
        n <= x"0000000000000000000000000000000000000000000000000000000000000005";
        wait for waitTime;
        
        reset_n <= '1';
        
        wait for clkPeriod;
        
        reg_en <= '0'; 
       
        
        wait;
        
    end process stimulli;   


end Behavioral;
