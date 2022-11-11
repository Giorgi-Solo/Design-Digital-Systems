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
    signal load_e, shift_e, finish_r, sel : std_logic;
    
  -- outputs of multiplexers in front of register C (See microarchitecture for RL Binary Method)
    signal MxC1_o : std_logic_vector(255 downto 0);
    
  -- these will be assigned to register C and register P 
    signal c_nxt, p_nxt : std_logic_vector(255 downto 0);
    
  -- the output of modular multiplication for register C and register P
    signal sqMlt_C, sqMlt_P, sqMlt: std_logic_vector(255 downto 0);
    
  -- signals associated with A_mux
    signal A_mux_sel, A_mux_sel_r : std_logic;
    signal A_mux_o                : std_logic_vector(255 downto 0);
    
  -- output from counter  
    signal reg_en_i : std_logic;
    
  -- register write enable  
    signal reg_en : std_logic;
    
  -- shift register, registers c and p  
    signal shift_register_e, c_reg, p_reg : std_logic_vector(255 downto 0);
    
  -- register for finished signal  
    signal finished_reg : std_logic;
    
    signal c255b, p255b : std_logic;
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
            
    modular_multiplication: entity work.mod_mult
        port map
            (
                clk => clk,
                reset_n => reset_n,
                
                -- Inputs
                a => A_mux_o,
                b => p_reg, 
                n => key_n,
                
                reg_en => reg_en,
--                a255b  => c255b,
                -- Output 
                r => sqMlt
            );
     
    sqMlt_C <= sqMlt;
    sqMlt_P <= sqMlt;

  -- ***************************************************************************
  -- A_mux logic.
  -- This is a sift register which is initialized with input ke_e_d
  -- and shifted right once in every 256 clock cycles.
  -- ***************************************************************************
    A_mux_sel_reg: process (clk, reset_n) begin
        if (reset_n = '0') then
            A_mux_sel_r <= '0';
        elsif (clk'event and clk='1') then
            if (reg_en = '1') then
                A_mux_sel_r <= not(A_mux_sel) and not(start);
            end if;
        end if;
    end process A_mux_sel_reg;
    
    A_mux_sel <= sel and A_mux_sel_r;
    
    A_mux_o <= c_reg when A_mux_sel = '1' else
               p_reg;
  -- ***************************************************************************

  -- update register when mod_mult finished or when we start calculation
    reg_en <=  reg_en_i or start;
    
  -- define load and shift signals for shift register
    load_e  <= start; 
    shift_e <= not(A_mux_sel) and reg_en;
    
            
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
            if ((shift_register_e = one) and (shift_e = '1')) then
                finished_reg <= '1';
            else 
                finished_reg <= '0';
            end if;
        end if;
    end process finish_register;
    
    sel <= shift_register_e(0);
  -- ***************************************************************************
  -- Multiplexe MxC1 (See microarchitecture for RL Binary method)
  -- This Mux selects between output of register C and output of mod_mult for C.
  -- Decision is based on the least significant bit of shift register
  -- ***************************************************************************
    
    MxC1_o <= sqMlt_C when shift_register_e(0) = '1' else
              c_reg;
    
  
  -- ***************************************************************************
  -- Multiplexe MxC2. (See microarchitecture for RL Binary method)
  -- This Mux selects between 1 and MxC1_o.
  -- Decision is based on the input start
  -- ***************************************************************************
  
    c_nxt <= m when start = '1' else
             MxC1_o;
             
             
  -- ***************************************************************************
  -- Multiplexe MxP. (See microarchitecture for RL Binary method)
  -- This Mux selects between M and and output of mod_mult for P.
  -- Decision is based on the input start
  -- *************************************************************************** 
    p_nxt <= m when start = '1' else
             sqMlt_P;
             
  -- ***************************************************************************
  -- Registers c_reg and p_reg.
  -- C register stores result of modular multiplications (C*P mod N).
  -- P register stores result of modular multiplications (P*P mod N).
  --  When calculation finishes, C holds encrypted/decrypted value
  -- ***************************************************************************             
    C_P_registers: process (clk, reset_n) begin
        if (reset_n = '0') then
            c_reg <= (others => '0');
            p_reg <= (others => '0');
        elsif (clk'event and clk='1') then
            if (((A_mux_sel and reg_en) = '1') or (start = '1')) then
                c_reg <= c_nxt;
            end if;
            if (((not(A_mux_sel) and reg_en) = '1') or (start = '1')) then
                p_reg <= p_nxt;
            end if;
        end if;
    end process C_P_registers;
    
 
  -- Outputs
    c <= c_reg;
    finished <= finished_reg;
end Behavioral;