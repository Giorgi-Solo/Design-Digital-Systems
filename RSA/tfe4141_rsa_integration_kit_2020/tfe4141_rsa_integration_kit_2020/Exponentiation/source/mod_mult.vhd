----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 10/09/2022 12:25:11 AM
-- Module Name: mod_mult - Behavioral
-- Description: 
--              Inputs: A, B, N, reg_en
--              Output: r = A * B (mod N)
--              This module calculates modular multiplication using Blakley's Algorithm
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;


entity mod_mult is
  Port 
  (
    -- posedge clock and negative active reset
    clk             : in std_logic;
    reset_n         : in std_logic;
    
    -- Input from RSA_Core Datapath
    a, b, n : in std_logic_vector(255 downto 0);
    reg_en  : in std_logic;
    
    -- Output to RSA_Core datapath
    r    : out std_logic_vector(255 downto 0)
   );
end mod_mult;

architecture Behavioral of mod_mult is
    
    signal r_reg : std_logic_vector(255 downto 0);
    signal r_nxt : std_logic_vector(255 downto 0);
--    signal r_reg_shift  : std_logic_vector(255 downto 0); -- r_reg_shift = 2*r_reg
    
    signal shift_reg_A  : std_logic_vector(254 downto 0);
    signal load_reg     : std_logic;
    
    signal Mx1_o             : std_logic; 
    signal Mx2_o_partial_sum : std_logic_vector(257 downto 0);
    
    signal r_nxt_sel   : std_logic_vector(2 downto 0);
    
    signal partial_sum_N, partial_sum_2N : std_logic_vector(257 downto 0);
    
    signal twoN, twoR : std_logic_vector(257 downto 0);
    
    signal isSumLessN, isSumLess2N : std_logic;
    
begin

  -- ***************************************************************************
  -- Register load_reg
  -- Delays input reg_en by 1 clock cycle
  -- Logic for loading shift_reg_A register
  -- ***************************************************************************
    load_A_reg: process (clk, reset_n) begin
        if (reset_n = '0') then
            load_reg <= '0';
        elsif (clk'event and clk='1') then
            load_reg <= reg_en;
        end if;
    end process load_A_reg;
    
    
  -- ***************************************************************************
  -- Register r_reg.
  -- This register is assigned with 0 ath the begining of the calculation 
  -- and every 256 clk cycles later after the start
  -- ***************************************************************************
    r_register: process (clk, reset_n) begin
        if (reset_n = '0') then
            r_reg <= (others => '0');
        elsif (clk'event and clk='1') then
            if (reg_en = '1') then
                r_reg <= (others => '0');
            else 
                r_reg <= r_nxt; -- this is r 
            end if;
        end if;
    end process r_register;
    
        
  -- ***************************************************************************
  -- Register shift_reg_A.
  -- This is a sift register which is initialized with input a(254 downto 0)
  -- and shifted left.
  -- ***************************************************************************
    shift_register_A: process (clk, reset_n) begin
        if (reset_n = '0') then
            shift_reg_A <= (others => '0');
        elsif (clk'event and clk='1') then
            if (load_reg = '1') then
                shift_reg_A <= a(254 downto 0);
            else 
                shift_reg_A <= shift_reg_A(253 downto 0) & '0';
            end if;
        end if;
    end process shift_register_A;
        
        
  -- ***************************************************************************
  -- Multiplexer 1 - Mx1 (See microarchitecture for Blakley).
  -- This multiplexer chooses between the output of shift register and the most 
  -- significant bit of input a. Decision is made based on load_reg
  -- ***************************************************************************
    Mx1_o <= a(255) when load_reg = '1' else
             shift_reg_A(254);
      
      
  -- Calculation of 2*N and 2* r
    twoN <= '0' & n(255 downto 0) & '0';
    twoR <= '0' & r_reg(255 downto 0) & '0';    
      
        
  -- ***************************************************************************
  -- Multiplexer 2 - Mx2 (See microarchitecture for Blakley).
  -- This multiplexer chooses between 2*R and 2*R + b. 
  -- The output is partial sum. Decision is made based on Mx1_o
  -- ***************************************************************************
    Mx2_o_partial_sum <= std_logic_vector(UNSIGNED(twoR) + UNSIGNED("00" & b)) when Mx1_o = '1' else
             twoR;
    
  -- Evaluation for select signals for R_nxt multiplexer (See microarchitecture for Blakley). 
  
    isSumLessN  <= partial_sum_N(257);
    isSumLess2N <= partial_sum_2N(257);
    
    r_nxt_sel   <= reg_en & isSumLessN & isSumLess2N;
    
  -- Evaluation of partial sum - N and partial sum - 2N (See microarchitecture for Blakley). 
  
    partial_sum_N  <= std_logic_vector(UNSIGNED(Mx2_o_partial_sum) - UNSIGNED("00" & n));
    partial_sum_2N <= std_logic_vector(UNSIGNED(Mx2_o_partial_sum) - UNSIGNED(twoN));
    
  -- ***************************************************************************
  -- Multiplexer for R_nxt (See microarchitecture for Blakley).
  -- This multiplexer chooses between 
  --                                  Mx2_o_partial_sum, 
  --                                  Mx2_o_partial_sum - n.  
  --                                  Mx2_o_partial_sum - 2n, 
  --                                  0. 
  -- Decision is made based on concatenation of reg_en, isSumLessN, isSumLess2N.
  -- ***************************************************************************     
    
    R_NXT_MUX: process(r_nxt_sel, Mx2_o_partial_sum, partial_sum_N, partial_sum_2N) begin
        case(r_nxt_sel) is
            when "011"  => r_nxt <= Mx2_o_partial_sum(255 downto 0);
            when "001"  => r_nxt <= partial_sum_N(255 downto 0);
            when "000"  => r_nxt <= partial_sum_2N(255 downto 0);
            when others => r_nxt <= (others => '0');
        end case;
    end process R_NXT_MUX;
        
  -- Output         
    r <= r_reg;
end Behavioral;