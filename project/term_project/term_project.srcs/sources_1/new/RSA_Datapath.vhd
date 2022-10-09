----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 10/09/2022 04:12:57 AM
-- Module Name: RSA_Datapath - Behavioral
-- Description: 
--              Inputs:  key_e_d, key_n, m, start
--              Outputs: c, finished
--              
--              This module implements RL Binary method of modular exponentiotion
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity RSA_Datapath is
  Port 
  (
    -- posedge clock and negative active reset
    clk             : in std_logic;
    reset_n         : in std_logic;
    
    -- Inputs/Outputs from/to modules surrounding RSA_Core
    key_e_d, key_n, m  : in  std_logic_vector(255 downto 0);
    c                  : out std_logic_vector(255 downto 0);
    
    -- Inputs/Outputs from/to RSA_Core datapath
    finished : out  std_logic;
    start    : in std_logic
   );
end RSA_Datapath;

architecture Behavioral of RSA_Datapath is
  -- signals associated with shift register
    signal load_e, shift_e, finish_r : std_logic;
    
  -- outputs of multiplexers in front of register C (See microarchitecture for RL Binary Method)
    signal MxC1_o : std_logic_vector(255 downto 0);
    
  -- these will be assigned to register C and register P 
    signal c_nxt, p_nxt : std_logic_vector(255 downto 0);
    
  -- the output of modular multiplication for register C and register P
    signal sqMlt_C, sqMlt_P : std_logic_vector(255 downto 0);
    
  -- output from counter  
    signal reg_en_i : std_logic;
    
  -- register write enable  
    signal reg_en : std_logic;
    
  -- shift register, registers c and p  
    signal shift_register_e, c_reg, p_reg : std_logic_vector(255 downto 0);
    
  -- register for finished signal  
    signal finished_reg : std_logic;
    
    constant one : std_logic_vector(255 downto 0) := x"0000000000000000000000000000000000000000000000000000000000000001";

begin
   -- Instatiations for counter and mod_mult
    counter: entity work.counter
    port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs 
                start => start,

                -- Outputs 
                reg_en_i => reg_en_i   
            );
            
    modular_multiplication_C: entity work.mod_mult
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs
                a => c_reg,
                b => p_reg, 
                n => key_n,
                
                reg_en => reg_en,
                
                -- Output 
                r => sqMlt_C
            );
     
    modular_multiplication_P: entity work.mod_mult
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs
                a => p_reg,
                b => p_reg, 
                n => key_n,
                
                reg_en => reg_en,
                
                -- Output 
                r => sqMlt_P
            );
 
  -- update register when mod_mult finished or when we start calculation
    reg_en <=  reg_en_i or start;
    
  -- define load and shift signals for shift register
    load_e  <= start; 
    shift_e <= reg_en;
    
            
  -- ***************************************************************************
  -- Register shift_register_key_e.
  -- This is a sift register which is initialized with input ke_e_d
  -- and shifted right once in every 256 clock cycles.
  -- ***************************************************************************
    shift_register_key_e: process (clk, reset_n) begin
        if (reset_n = '0') then
            shift_register_e <= (others => '0');
        elsif (clk'event and clk='1') then
            if (load_e = '1') then
                shift_register_e <= key_e_d;
            elsif (shift_e = '1') then 
                shift_register_e <= '0' & shift_register_e(255 downto 1);
            end if;
        end if;
    end process shift_register_key_e;
    
  -- ***************************************************************************
  -- Register finished_reg.
  -- This register indicates when core finishes the encryption/decryption.
  -- finished_reg becomes 1 when shift_register_e becomes 0
  -- ***************************************************************************
    finish_register: process (clk, reset_n) begin
        if (reset_n = '0') then
            finished_reg <= '0';
        elsif (clk'event and clk='1') then
            if (shift_register_e = one) then
                finished_reg <= '1';
            else 
                finished_reg <= '0';
            end if;
        end if;
    end process finish_register;
  -- Outputs
    c <= c_reg;
    finished <= finished_reg;
end Behavioral;
