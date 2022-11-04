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

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity exponentiation is
	generic (
		C_block_size : integer := 256
	);
	port (
	    
	    msgout_last : out STD_LOGIC;
		msgin_last  : in std_logic;
		
		--input controll
		valid_in	: in STD_LOGIC;
		ready_in	: out STD_LOGIC;

		--input data
		message 	: in STD_LOGIC_VECTOR ( C_block_size-1 downto 0 );
		key 		: in STD_LOGIC_VECTOR ( C_block_size-1 downto 0 );

		--ouput controll
		ready_out	: in STD_LOGIC;
		valid_out	: out STD_LOGIC;

		--output data
		result 		: out STD_LOGIC_VECTOR(31 downto 0);

		--modulus
		modulus 	: in STD_LOGIC_VECTOR(C_block_size-1 downto 0);

		--utility
		clk 		: in STD_LOGIC;
		reset_n 	: in STD_LOGIC
	);
end exponentiation;


architecture expBehave of exponentiation is
    signal finished, start : std_logic;
    
    signal valid : std_logic;
    
    signal valid_out_internal : std_logic;
    signal ready_out_internal, ready: std_logic;
    
    signal result_internal : std_logic_vector(C_block_size - 1 downto 0);
    
    signal counter : std_logic_vector(2 downto 0);
begin
    
    valid_out <= valid_out_internal when valid = '1' else
                 '0';
                 
    ready_out_internal <= ready_out when valid = '1' else
                          '0';
                 
    process (clk, reset_n) begin
        if (reset_n = '0') then
            counter <= (others => '0');
            valid   <= '0';
            ready   <= '0';
        elsif (clk'event and clk='1') then
            if ((((ready or ready_out) = '1') and (valid_out_internal = '1')) and (valid = '0')) then
                ready   <= '1';
                counter <= std_logic_vector(UNSIGNED(counter) + 1);
                if (counter = "111") then
                  valid <= '1';  
                end if;
            else
                if (ready_out = '1') then
                    counter <= (others => '0');
                    valid   <= '0';
                    ready   <= '0';
                end if;
            end if;
        end if;
     end process;
     
     process (counter, result_internal, valid) begin   
        if (valid = '0') then             
                case (counter) is 
                when "000" =>
                    result <= result_internal( 31 downto  0); 
                when "001" =>
                    result <= result_internal( 63 downto  32);
                when "010" =>
                    result <= result_internal( 95 downto  64);
                when "011" =>
                    result <= result_internal(127 downto  96);
                when "100" =>
                    result <= result_internal(159 downto 128);
                when "101" =>
                    result <= result_internal(191 downto 160);
                when "110" =>
                    result <= result_internal(223 downto 192);
                when "111" =>
                    result <= result_internal(255 downto 224);
                when others =>
                    result <= (others => '0');   
                end case;   
        else
            result <= (others => '0');   
        end if;
    end process;
    
    RSA_Datapath: entity work.RSA_Datapath
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs/Outputs from/to modules surrounding RSA_Core
                key_e_d => key, 
                key_n   => modulus, 
                m       => message,
                c       => result_internal,                
                
                -- Inputs/Outputs from/to RSA_Core datapath
                finished => finished,
                start => start   
            );
            
    RSA_Controller: entity work.RSA_Controller
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs/Outputs from/to modules surrounding RSA_Core
                msgin_valid  => valid_in,
                msgin_ready  => ready_in, 
                msgout_valid => valid_out_internal,
                msgout_ready => ready_out_internal,
                msgout_last  => msgout_last,
                msgin_last   => msgin_last,
                
                -- Inputs/Outputs from/to RSA_Core datapath
                finished => finished,
                start => start   
            );
 
end expBehave;
