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

entity selector_tb is
end selector_tb;

architecture Behavioral of selector_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    constant maxVal    : std_logic_vector := x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    
    constant coreNumber    : integer := 8;
    constant counterSize   : integer := 3;
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    signal valid   : std_logic;
    signal ready   : std_logic;
    
    -- Output to RSA_Core datapath
    signal id      : integer;
    
    signal result    : integer := 0;
    signal isCorrect : boolean;
    
begin

    -- Clock generation
    clk <= not clk after clkPeriod/2;
        
--    result <= (to_integer(unsigned(msgin_data)) ** to_integer(unsigned(key_e_d))) mod (unsigned(key_n));
    
--    isCorrect <= (result = UNSIGNED(msgout_data)) and (msgout_valid = '1');-- when reg_en_i = '1' else
                
    dut_selector: entity work.selector
        generic map
            (
                coreNumber  => coreNumber,
                counterSize => counterSize
            )
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                valid =>  valid,
                ready =>  ready,
                
                id    => id
            );
            
    stimulli:process begin
        
        valid <= '0';
        ready <= '0';
        result <= 0;
        wait for waitTime;
        
        -- Check reset outputs 
        assert (id = result) 
            report "Outputs are not correct after reset"
            severity failure;
            
        wait for clkPeriod;
        
        reset_n <= '1';
        
        wait for waitTime;
        
        -- Check outputs after reset
        assert (id = result) 
            report "Outputs are not correct after reset"
            severity failure;
            
        wait for waitTime;
        
        -- Check outputs when only ready is 1
        
        valid <= '0';
        ready <= '1';
        result <= 0;
        
        wait for clkPeriod;
        assert (id = result) 
            report "Outputs are not correct after reset"
            severity failure;
        
        wait for waitTime;
        
        -- Check outputs when only valid is 1
        
        valid <= '1';
        ready <= '0';
        result <= 0;
        
        wait for clkPeriod;
        assert (id = result) 
            report "Outputs are not correct after reset"
            severity failure;
             
        wait for waitTime;
        
        -- Check outputs when both valid and ready is 1
        
        valid <= '1';
        ready <= '1';
        
        testLoop: for i in 0 to coreNumber loop
            if(result = (coreNumber - 1)) then
                result <= 0;
            else
                result <= result + 1;
            end if;
            
            wait for clkPeriod;
            assert (id = result) 
                report "Running Output are correct"
                severity failure;
        end loop testLoop;
        
        ready <= '0';
        
        wait for clkPeriod;
            assert (id = result) 
                report "Running Output are correct"
                severity failure;
        
        wait for  2*clkPeriod;
        report "ALL TESTS PASSED"
            severity failure;
            
        wait;   
            
        end process stimulli;            
end Behavioral;
