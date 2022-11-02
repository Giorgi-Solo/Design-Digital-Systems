----------------------------------------------------------------------------------
-- Company    : NTNU
-- Engineer   : Giorgi Solomishvili
--              Besjan Tomja
--              Mohamed Mahmoud Sayed Shelkamy Ali
-- 
-- Create Date: 08/10/2022 04:21:16 PM
-- Module Name: RSA_Controller
-- Description: 
--              inputs:  msgin_valid, finish, msgout_ready
--              outputs: msgin_ready, start, msgout_valid
--
--              This module implements control logic for RSA_Core. 
--              The main part of the module is FSM with the 4 states: IDLE, INITIALIZE, BUSY, FINISH
--                
--                          IDLE       - Output msgin_ready is 1,  FSM stays in this state untill input msgin_valid is asserted.  Next state is INITIALIZE.
--                          INITIALIZE - Output start is 1.        FSM stays in this state for one clock cycle.                   Next state is BUSY.
--                          BUSY       - Outputs are 0.            FSM stays in this state untill input finish is asserted.       Next state is FINISH.   
--                          FINISH     - Output msgout_valid is 1. FSM stays in this state untill input msgout_ready is asserted. Next state is IDLE.   

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity RSA_Controller is
  Port 
  (
    -- posedge clock and negative active reset
    clk             : in std_logic;
    reset_n         : in std_logic;
    
    -- Inputs/Outputs from/to modules surrounding RSA_Core
    msgin_valid, msgout_ready  : in  std_logic;
    msgin_ready, msgout_valid  : out std_logic;
    
    msgout_last : out STD_LOGIC;
    msgin_last  : in std_logic;
    
    -- Inputs/Outputs from/to RSA_Core datapath
    finished : in  std_logic;
    start    : out std_logic
   );
end RSA_Controller;

architecture Behavioral of RSA_Controller is
    type state_type is (IDLE,BUSY);  -- define states for FSM
    signal current_state, next_state : state_type;
    signal finished_r : std_logic;
    signal last_msg_r : std_logic;
begin
    
    -- State transition
    CurrentState: process(clk, reset_n) begin
        if (reset_n = '0') then
            current_state <= IDLE;
            finished_r    <= '0';
            last_msg_r    <= '0';
        elsif (clk'event and clk='1') then
            if(current_state = IDLE) then
                finished_r <= '0';
                last_msg_r <= msgin_last;
            elsif (finished_r = '0') then
                finished_r <= finished;
            end if;
            current_state <= next_state;
        end if;
    end process CurrentState; 
    
    -- Logic for next_state and output
    NextState_Outputs: process(current_state, msgin_valid, finished, finished_r, last_msg_r, msgout_ready) begin
        case (current_state) is
            when IDLE =>
                msgin_ready  <= '1'; 
                msgout_valid <= '0';
                msgout_last  <= '0';
                
                if (msgin_valid = '1') then
                    start      <= '1';
                    next_state <= BUSY;
                else
                    start      <= '0';
                    next_state <= IDLE;
                end if;
              
            when BUSY =>
                msgin_ready  <= '0'; 
                start        <= '0';
                
                if ((finished or finished_r) = '0') then
                    msgout_valid <= '0';
                    msgout_last  <= '0';
                    next_state <= BUSY;
                elsif (msgout_ready = '0') then
                    msgout_valid <= '1';
                    msgout_last  <= last_msg_r;
                    next_state <= BUSY;
                else 
                    msgout_valid <= '1';
                    msgout_last  <= last_msg_r;
                    next_state <= IDLE;
                end if;
                
            when others =>
                msgin_ready  <= '1';
                start        <= '0';
                msgout_valid <= '0';
                msgout_last  <= '0';
                next_state   <= IDLE;
        end case;
    end process NextState_Outputs; 
    
end Behavioral;