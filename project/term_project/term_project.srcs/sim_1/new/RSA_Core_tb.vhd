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

entity RSA_Core_tb is
end RSA_Core_tb;

architecture Behavioral of RSA_Core_tb is

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
     -- Inputs/Outputs from/to rsa_msgin
    signal msgin_valid  : std_logic;                      --in  
    signal msgin_data   : std_logic_vector(255 downto 0); --in  
    signal msgin_ready  : std_logic;                      --out 
    
    -- Inputs/Outputs from/to rsa_regio
    signal key_e_d, key_n : std_logic_vector(255 downto 0);
    
    -- Inputs/Outputs from/to rsa_msgout
    signal msgout_ready : std_logic;                        --in  
    signal msgout_valid : std_logic;                        --out 
    signal msgout_data  : std_logic_vector(255 downto 0);   --out 
    
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
        
    result <= (to_integer(unsigned(msgin_data)) ** to_integer(unsigned(key_e_d))) mod (unsigned(key_n));
    
    isCorrect <= (result = UNSIGNED(msgout_data)) and (msgout_valid = '1');-- when reg_en_i = '1' else
                
-- RSA_Controller Instantiation
    dut_RSA_Core: entity work.RSA_Core
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs/Outputs from/to rsa_msgin
                msgin_valid =>  msgin_valid,
                msgin_data  =>  msgin_data,
                msgin_ready =>  msgin_ready,
                
                key_e_d => key_e_d, 
                key_n   => key_n,
                
                -- Inputs/Outputs from/to rsa_msgout 
                msgout_ready => msgout_ready, 
                msgout_valid => msgout_valid, 
                msgout_data  => msgout_data  
            );
            
    -- Stimulli
    stimulli:process begin
        key_e_d    <= x"0000000000000000000000000000000000000000000000000000000000000007";  -- std_logic_vector(UNSIGNED(maxVal) - 1);
        key_n      <= x"0000000000000000000000000000000000000000000000000000000000000021";
        msgin_data <= x"0000000000000000000000000000000000000000000000000000000000000002";
        
        wait for waitTime;
        
        -- Check outputs after reset
        assert (msgin_ready = '1') and (msgout_valid = '0')
            report "Outputs are not correct in IDLE State"
            severity failure;
            
        wait for clkPeriod;
        
        reset_n <= '1';
        
        -- Inputs from rsa_msgout
        msgout_ready <= '0';
        
        -- Inputs from rsa_msgin
        msgin_valid <= '1';
        wait for  clkPeriod;
        msgin_valid <= '0';
        
        -- Check outputs in INITIALIZE state
        assert (msgin_ready = '0') and (msgout_valid = '0')
            report "Outputs are not correct in INITIALIZE State"
            severity failure;
         
        wait for  clkPeriod;
        
        -- Check outputs in BUSY state
        assert (msgin_ready = '0') and (msgout_valid = '0')
            report "Outputs are not correct in BUSY State"
            severity failure;
            
--        key_e_d    <= x"000000000000000000000000000000000000000000000000000000000000000A";  -- std_logic_vector(UNSIGNED(maxVal) - 1);
--        key_n      <= x"0000000000000000000000000000000000000000000000000000000000000021";
--        msgin_data <= x"0000000000000000000000000000000000000000000000000000000000000002";
        
       
        wait until msgout_valid = '1';
        
        
        wait for  waitTime;
        -- Inputs from rsa_msgout
        msgout_ready <= '0';
        
        assert msgout_valid = '1'
            report "Does not hold result value until outside is ready to read it"
            severity failure;
            
        wait for  clkPeriod;
        -- Inputs from rsa_msgout
        msgout_ready <= '1';
        
        wait for  clkPeriod;
        -- Check outputs after result is read
        assert (msgin_ready = '1') and (msgout_valid = '0')
            report "Outputs are not correct after result is read"
            severity failure;
            
        wait for  2*clkPeriod;
        msgout_ready <= '1';
        wait for  2*clkPeriod;
        report "ALL TESTS PASSED"
            severity note;
            
        wait;
        
    end process stimulli;   

    -- ASSERTIONS
    
    
    
    assert not(msgout_valid = '1') or (result = UNSIGNED(msgout_data))
            report "RSA Encryption doesn't return correct value"
            severity failure;
end Behavioral;
