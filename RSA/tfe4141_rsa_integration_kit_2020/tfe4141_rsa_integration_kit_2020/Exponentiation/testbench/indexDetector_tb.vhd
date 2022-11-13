----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2022 10:26:17 PM
-- Design Name: 
-- Module Name: indexDetector_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity indexDetector_tb is
--  Port ( );
end indexDetector_tb;

architecture Behavioral of indexDetector_tb is

    -- Constants
    constant clkPeriod : time := 10ns;
    constant waitTime  : time := 50ns;
    constant maxVal    : std_logic_vector := x"FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF";
    
    -- posedge clock and negative active reset
    signal clk     : std_logic := '0';
    signal reset_n : std_logic := '0';
    
    signal A_in    : std_logic_vector(255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";

    signal A_out   : std_logic_vector(255 downto 0);
        
    signal index   : integer := 0;
    
    signal A_outCorrect : std_logic_vector(255 downto 0) := x"8000000000000000000000000000000000000000000000000000000000000000";
    signal indexCorrect : integer := 0;
    
    signal tmp : std_logic_vector(256 downto 0);-- := x"8000000000000000000000000000000000000000000000000000000000000000";

begin

    dutIndexDetector: entity work.indexDetector
        port map
            (
              clk     => clk    ,
              reset_n => reset_n,                  
              A_in    => A_in   ,                      
              A_out   => A_out  , 
              index   => index  
             ); 
    clk <= not clk after clkPeriod/2;
    
    
    stimuli: process begin
    wait for waitTime;
    reset_n <= '1';
    wait for waitTime;
    A_in <= x"0000000000000000000000000000000000000000000000000000000000000001";    
    
    for i in 0 to 255 loop
        wait for clkPeriod;
        
        if(i>=252) then    
            assert A_out = A_outCorrect
            report "Return A_out Value is Incorrect"
            severity failure;
            
            assert (index = indexCorrect)
            report "Returned Index is Incorrect"
            severity failure;
        else
            assert A_out = A_in
            report "Return A_out Value is Incorrect"
            severity failure;
            
            assert (index = 0)
            report "Returned Index is Incorrect"
            severity failure;
        end if;    
        
        if(i /= 255) then
            A_in <= A_in(254 downto 0) & '0';
            indexCorrect <= indexCorrect + 1;
        end if;
        wait for clkPeriod;
    end loop;
    
    A_in <= maxVal;  
    
    wait for clkPeriod;
  
    assert (index = 255)
            report "Returned Index of MaxVal is Incorrect"
            severity failure;
            
        assert A_out = maxVal
            report "Return A_out Value of MaxVal is Incorrect"
            severity failure;
            
    wait for clkPeriod;
    
    A_in <= x"0000000000000000000000000000000000000000000000000000000000000000";    
    
    wait for clkPeriod;
  
    assert (index = 0)
            report "Returned Index of 0 is Incorrect"
            severity failure;
            
        assert A_out = A_in
            report "Return A_out Value of 0 is Incorrect"
            severity failure;
                     
    wait for clkPeriod;
    
    A_in <= x"8000000000000000000000000007300000000000000000000000000000000000";    
    
    wait for clkPeriod;
  
    assert (index = 255)
            report "Returned Index of 0 is Incorrect"
            severity failure;
            
        assert A_out = A_in
            report "Return A_out Value of 0 is Incorrect"
            severity failure;
    
                         
    wait for clkPeriod;
    
    A_in <= x"4000000000000000000000000000000000000000000000000000000000000000";    
    
    wait for clkPeriod;
  
    assert (index = 254)
            report "Returned Index should be 254"
            severity failure;
            
        assert A_out = A_outCorrect
            report "Return A_out Value is Incorrect"
            severity failure;
    
    tmp <= (others => '0');
    wait for clkPeriod;
    tmp(255-index) <= '1';
    wait for waitTime;
    report "All Test PASSED"
        severity failure;
    end process;

end Behavioral;















