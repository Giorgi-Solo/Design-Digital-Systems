----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 10/08/2022 09:20:20 PM
-- Module Name: RSA_Controller_tb - Behavioral 
-- Description: 
--              Test RSA_Controller
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity RSA_Controller_tb is
end RSA_Controller_tb;

architecture Behavioral of RSA_Controller_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    -- Inputs
    signal msgin_valid  : std_logic := '0';
    signal finished     : std_logic := '0'; 
    signal msgout_ready : std_logic := '0';
    
    -- Outputs 
    signal msgin_ready  : std_logic;
    signal start        : std_logic;
    signal msgout_valid : std_logic;

begin

    -- Clock generation
    clk <= not clk after clkPeriod/2;
  
    -- RSA_Controller Instantiation
    dut_RSA_Controller: entity work.RSA_Controller
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs/Outputs from/to modules surrounding RSA_Core
                msgin_valid => msgin_valid,
                msgin_ready => msgin_ready, 
                msgout_valid => msgout_valid,
                msgout_ready => msgout_ready,
                
                -- Inputs/Outputs from/to RSA_Core datapath
                finished => finished,
                start => start   
            );
            
    -- Stimulli
    stimulli:process begin
        wait for clkPeriod;
        assert ((msgin_ready = '1') and (start = '0') and (msgout_valid = '0'))
            report "Controller Reset Test: Reset values are not correct"
            severity failure;
            
        wait for waitTime;
        
        reset_n <= '1';
        
        msgin_valid  <= '0'; 
        finished     <= '0';
        msgout_ready <= '0';
         
        assert ((msgin_ready = '1') and (start = '0') and (msgout_valid = '0'))
            report "Controller IDLE Test: Output values are not correct in IDLE state after reset"
            severity failure;
        
        wait for waitTime;
        
        msgin_valid  <= '1'; 
        finished     <= '0';
        msgout_ready <= '0';
        
        wait for 1ns;        
        assert ((msgin_ready = '1') and (start = '1') and (msgout_valid = '0'))
            report "Controller IDLE Test: Output values are not correct in IDLE state after msgin_valid signal is asserted"
            severity failure;
        
        wait for waitTime;
        
        assert ((msgin_ready = '0') and (start = '0') and (msgout_valid = '0'))
            report "Controller BUSY Test: Output values are not correct in BUSY state until calculation is finished"
            severity failure;
        
        wait for waitTime;
        
        msgin_valid  <= '0'; 
        finished     <= '1';
        msgout_ready <= '0';
        
        wait for 1ns;
        assert ((msgin_ready = '0') and (start = '0') and (msgout_valid = '1'))
            report "Controller BUSY Test: Output values are not correct in BUSY state after calculation is finished"
            severity failure;
        
        wait for waitTime;
        
        assert ((msgin_ready = '0') and (start = '0') and (msgout_valid = '1'))
            report "Controller BUSY Test: Output values are not correct in BUSY state after calculation is finished and the outside is not ready to read"
            severity failure;
            
        wait for waitTime;
        
        msgin_valid  <= '0'; 
        finished     <= '0';
        msgout_ready <= '1';
        
        wait for 1ns;
        assert ((msgin_ready = '0') and (start = '0') and (msgout_valid = '1'))
            report "Controller BUSY Test: Output values are not correct in BUSY state after calculation is finished and the outside is ready to read"
            severity failure;
            
        wait for clkPeriod;
        
        assert ((msgin_ready = '1') and (start = '0') and (msgout_valid = '0'))
            report "Controller IDLE Test: Output values are not correct in IDLE state after calculation is finished and the outside read the result"
            severity failure;
        
        
        report "ALL TESTS PASSED"
            severity note;
            
        wait;
        
    end process stimulli;   

end Behavioral;
