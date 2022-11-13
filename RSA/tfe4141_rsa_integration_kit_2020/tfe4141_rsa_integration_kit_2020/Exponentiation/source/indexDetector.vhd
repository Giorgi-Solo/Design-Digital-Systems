----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 10/09/2022 06:04:57 AM
-- Module Name: RSA_Core - Behavioral
-- Description: 
--              This module performs RSA encryption/Decryption
--              Inputs:  key_n, key_e_d, msgin_valid, msgout_ready, msgin_data
--              Outputs: msgin_ready, msgout_valid, msgout_data
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity indexDetector is
  Port ( 
    --utility
	clk 		: in STD_LOGIC;
	reset_n 	: in STD_LOGIC;
	
    A_in        : in std_logic_vector(255 downto 0);
    
    A_out       : out std_logic_vector(255 downto 0);
        
    index       : out integer := 0 --std_logic_vector(counterSize - 1 downto 0)
  );
end indexDetector;

architecture Behavioral of indexDetector is
    signal A_out_internal : std_logic_vector(255 downto 0);
    signal ind : integer;
    
    constant zero : std_logic_vector(255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000000";
begin

    getIndex: process(A_in) is
            variable index_internal : integer;
    begin
        index_internal := 0;
        for i in 252 to 255 loop
            if((A_in(i) = '1')) then
                index_internal := i;
            end if;
        end loop;
        ind <= index_internal;
    end process getIndex;

    process (clk, reset_n) begin
        if (reset_n = '0') then
            A_out_internal <= (others => '0');
        elsif (clk'event and clk='1') then
            if(ind = 254) then
--                A_out_internal <= std_logic_vector(shift_left(unsigned(A_in),255-ind));--A_in(ind downto 0) & zero(255 downto (ind+1));
                A_out_internal <= A_in(254 downto 0) & '0';
            elsif(ind = 253) then
                A_out_internal <= A_in(253 downto 0) & "00";
            elsif(ind = 252) then
                A_out_internal <= A_in(252 downto 0) & "000";
            else
                A_out_internal <= A_in;
            end if;
        end if;
    end process;
    
-- outputs
    index <= ind;
    A_out <= A_out_internal;
end Behavioral;











