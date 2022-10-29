----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 10/09/2022 03:23:44 AM
-- Module Name: mod_mult_tb - Behavioral
-- Description: 
--              This module test datapath of RSA_CORE
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity RSA_Datapath_tb is
end RSA_Datapath_tb;

architecture Behavioral of RSA_Datapath_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    constant maxVal    : std_logic_vector := x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
  -- ***************************************************************************
  -- INPUTS and OUTPUTS to RSA_Datapath
  -- ***************************************************************************
     
    -- Inputs
    signal key_e_d, key_n, m  : std_logic_vector(255 downto 0);
    signal start              : std_logic; 

    -- Outputs 
    signal finished : std_logic;   
    signal c        : std_logic_vector(255 downto 0);
    
  -- ***************************************************************************
  -- INPUTS and OUTPUTS to COUNTER 
  -- ***************************************************************************
  

   

  -- ***************************************************************************
  -- INPUTS and OUTPUTS to COUNTER 
  -- result shows correct result of a**b mod n
  -- isCorrect is true, if module calculates correctly
  -- ***    
    signal result    : unsigned(255 downto 0);
    signal isCorrect : boolean;
    
begin

    -- Clock generation
    clk <= not clk after clkPeriod/2;
        
    result <= (to_integer(unsigned(m)) ** to_integer(unsigned(key_e_d))) mod (unsigned(key_n));
    
    isCorrect <= (result = UNSIGNED(c)) and (finished = '1');-- when reg_en_i = '1' else
                
-- RSA_Controller Instantiation
    dut_RSA_Datapath: entity work.RSA_Datapath
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs
                start => start,   
                key_e_d => key_e_d,
                key_n   => key_n, 
                m       => m,
                
                -- Outputs 
                finished => finished,
                c => c
            );
            
    -- Stimulli
    stimulli:process begin
        key_e_d <= x"0000000000000000000000000000000000000000000000000000000000000007";  -- std_logic_vector(UNSIGNED(maxVal) - 1);
        key_n   <= x"0000000000000000000000000000000000000000000000000000000000000021";
        m       <= x"0000000000000000000000000000000000000000000000000000000000000002";
        
        wait for waitTime;
        reset_n <= '1';
        start   <= '1';
        wait for  clkPeriod;
        start   <= '0';
        
        wait until finished = '1';
        wait for  clkPeriod;
        
        key_e_d <= x"000000000000000000000000000000000000000000000000000000000000000A";  -- std_logic_vector(UNSIGNED(maxVal) - 1);
        key_n   <= x"0000000000000000000000000000000000000000000000000000000000000021";
        m       <= x"0000000000000000000000000000000000000000000000000000000000000002";
        
        start   <= '1';
        wait for  clkPeriod;
        start   <= '0';
        
        wait until finished = '1';
        
        wait for  2*clkPeriod;
        report "ALL TESTS PASSED"
            severity note;
            
        wait;
        
    end process stimulli;   

    -- ASSERTIONS
    
    
    assert not(finished = '1') or (result = UNSIGNED(c))
            report "RSA Encryption doesn't return correct value"
            severity failure;
end Behavioral;
