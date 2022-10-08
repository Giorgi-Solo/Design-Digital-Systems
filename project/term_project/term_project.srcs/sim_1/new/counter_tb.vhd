----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
--
-- Create Date: 10/08/2022 10:19:59 PM
-- Module Name: counter
-- Description: 
--              Test counter
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity counter_tb is
end counter_tb;

architecture Behavioral of counter_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    -- Inputs
    signal start  : std_logic := '0';
    
    -- Outputs 
    signal reg_en_i  : std_logic;

begin

    -- Clock generation
    clk <= not clk after clkPeriod/2;
  
    -- RSA_Controller Instantiation
    dut_counter: entity work.counter
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs 
                start => start,

                -- Outputs 
                reg_en_i => reg_en_i   
            );
            
    -- Stimulli
    stimulli:process begin
        wait for waitTime;
        
        reset_n <= '1';
        
        wait for waitTime;
        
        start <= '1';
        
        wait for clkPeriod;
        
        start <= '0';
        
        wait;
        
    end process stimulli;


end Behavioral;
