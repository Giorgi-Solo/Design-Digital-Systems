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


entity exponentiation_tb is
	generic (
		C_block_size : integer := 256
	);
end exponentiation_tb;


architecture expBehave of exponentiation_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    constant maxVal    : std_logic_vector := x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    
  -- ***************************************************************************
  -- correctResult shows correct Result of a**b mod n
  -- isCorrect is true, if module calculates correctly
  -- ***    
    signal correctResult : unsigned(255 downto 0);
    signal isCorrect     : boolean;
    

  -- ***************************************************************************
  -- INPUTS and OUTPUTS to RSA_Core
  -- ***************************************************************************
	
	-- Inputs/Outputs from/to rsa_msgin
    signal valid_in  : std_logic;                      --in  
    signal message   : std_logic_vector(255 downto 0); --in  
    signal ready_in  : std_logic;                      --out 
    
    -- Inputs/Outputs from/to rsa_regio
    signal key, modulus : std_logic_vector(255 downto 0);
    
    -- Inputs/Outputs from/to rsa_msgout
    signal ready_out : std_logic;                        --in  
    signal valid_out : std_logic;                        --out 
    signal result    : std_logic_vector(255 downto 0);   --out 
    signal msgout_last : STD_LOGIC;
	signal msgin_last  : std_logic;
--	signal restart 		: STD_LOGIC;
    
    signal result_internal : std_logic_vector(31 downto 0);
begin

    -- Clock generation
    clk <= not clk after clkPeriod/2;
        
    correctResult <= (to_integer(unsigned(message)) ** to_integer(unsigned(key))) mod (unsigned(modulus));
    
    isCorrect <= (correctResult = UNSIGNED(result)) and (valid_out = '1');-- when reg_en_i = '1' else
               
 
    process (clk, reset_n) begin
        if (reset_n = '0') then
            result <= (others => '0');
        elsif (clk'event and clk='1') then
            if (valid_out = '0') then
                result <= result_internal & result(255 downto 32);
            end if;
        end if;
    end process;
    	
	i_exponentiation : entity work.exponentiation
		port map (
		    msgout_last => msgout_last,
		    msgin_last  => msgin_last,
			message   => message  ,
			key       => key      ,
			valid_in  => valid_in ,
			ready_in  => ready_in ,
			ready_out => ready_out,
			valid_out => valid_out,
			result    => result_internal   ,
			modulus   => modulus  ,
			clk       => clk      ,
			reset_n   => reset_n
		);
         
    -- Stimulli
    stimulli:process begin
        key     <= x"0000000000000000000000000000000000000000000000000000000000000007";  -- std_logic_vector(UNSIGNED(maxVal) - 1);
        modulus <= x"0000000000000000000000000000000000000000000000000000000000000021";
        message <= x"0000000000000000000000000000000000000000000000000000000000000002";
        
        wait for waitTime;
        
        -- Check outputs after reset
        assert (ready_in = '1') and (valid_out = '0')
            report "Outputs are not correct in IDLE State"
            severity failure;
            
        wait for clkPeriod;
        
        reset_n <= '1';
        
        -- Inputs from rsa_msgout
        ready_out <= '0';
        
        -- Inputs from rsa_msgin
        valid_in <= '1';
        wait for  clkPeriod;
        valid_in <= '0';
        
        -- Check outputs in INITIALIZE state
        assert (ready_in = '0') and (valid_out = '0')
            report "Outputs are not correct in INITIALIZE State"
            severity failure;
         
        wait for  clkPeriod;
        
        -- Check outputs in BUSY state
        assert (ready_in = '0') and (valid_out = '0')
            report "Outputs are not correct in BUSY State"
            severity failure;
            
--        key    <= x"000000000000000000000000000000000000000000000000000000000000000A";  -- std_logic_vector(UNSIGNED(maxVal) - 1);
--        modulus      <= x"0000000000000000000000000000000000000000000000000000000000000021";
--        message <= x"0000000000000000000000000000000000000000000000000000000000000002";
        
       
--        wait until valid_out = '1';
        
        
--        wait for  waitTime;
--        -- Inputs from rsa_msgout
--        ready_out <= '0';
        
--        assert valid_out = '1'
--            report "Does not hold correctResult value until outside is ready to read it"
--            severity failure;
            
        wait for  clkPeriod;
        -- Inputs from rsa_msgout
        ready_out <= '1';
        wait until valid_out = '1';
        
        wait for  clkPeriod;
        wait for 1ns;
        -- Check outputs after correctResult is read
        assert (ready_in = '1') and (valid_out = '0')
            report "Outputs are not correct after correctResult is read"
            severity failure;
            
        wait for  2*clkPeriod;
        ready_out <= '1';
        wait for  2*clkPeriod;
        report "ALL TESTS PASSED"
            severity failure;
            
        wait;
        
    end process stimulli;   

    -- ASSERTIONS
    
    
    
    assert not(valid_out = '1') or (correctResult = UNSIGNED(result))
            report "RSA Encryption doesn't return correct value"
            severity failure;

end expBehave;
