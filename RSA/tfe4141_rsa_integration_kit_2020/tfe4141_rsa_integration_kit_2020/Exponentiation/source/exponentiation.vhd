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
		result 		: out STD_LOGIC_VECTOR(C_block_size-1 downto 0);

		--modulus
		modulus 	: in STD_LOGIC_VECTOR(C_block_size-1 downto 0);

		--utility
		clk 		: in STD_LOGIC;
		reset_n 	: in STD_LOGIC
	);
end exponentiation;


architecture expBehave of exponentiation is
    signal finished, start : std_logic;
begin

    RSA_Datapath: entity work.RSA_Datapath
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs/Outputs from/to modules surrounding RSA_Core
                key_e_d => key, 
                key_n   => modulus, 
                m       => message,
                c       => result,                
                
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
                msgout_valid => valid_out,
                msgout_ready => ready_out,
                msgout_last  => msgout_last,
                msgin_last   => msgin_last,
                
                -- Inputs/Outputs from/to RSA_Core datapath
                finished => finished,
                start => start   
            );

end expBehave;
