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


entity RSA_Core is
  Port 
  (
    -- posedge clock and negative active reset
    clk             : in std_logic;
    reset_n         : in std_logic;
    
    -- Inputs/Outputs from/to rsa_msgin
    msgin_valid  : in  std_logic;
    msgin_data   : in  std_logic_vector(255 downto 0);
    msgin_ready  : out std_logic;
    
    -- Inputs/Outputs from/to rsa_regio
    key_e_d, key_n : in  std_logic_vector(255 downto 0);
    
    -- Inputs/Outputs from/to rsa_msgout
    msgout_ready : in  std_logic;
    msgout_valid : out std_logic;
    msgout_data  : out  std_logic_vector(255 downto 0)   
   );
end RSA_Core;

architecture Behavioral of RSA_Core is
    signal finished, start : std_logic;
begin

    RSA_Datapath: entity work.RSA_Datapath
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs/Outputs from/to modules surrounding RSA_Core
                key_e_d => key_e_d, 
                key_n   => key_n, 
                m       => msgin_data,
                c       => msgout_data,                
                
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
                msgin_valid => msgin_valid,
                msgin_ready => msgin_ready, 
                msgout_valid => msgout_valid,
                msgout_ready => msgout_ready,
                
                -- Inputs/Outputs from/to RSA_Core datapath
                finished => finished,
                start => start   
            );

end Behavioral;
