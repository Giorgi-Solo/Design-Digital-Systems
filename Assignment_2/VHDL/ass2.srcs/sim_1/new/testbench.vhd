library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is    
    signal A, B, Q, QN : STD_ULOGIC;
begin
    DUT: entity work.assignment2(Behavioral)
        port map(A => A, B => B, Q => Q, QN => QN);   
    stimuli: process is
    begin
        A <= '1' ; B <= '0' ;
        wait for 10 ns ;
        A <= '0' ;
        wait for 10 ns ;
        B <= '1' ;
        wait for 10 ns ;
        B <= '0' ;
        wait for 10 ns ;
        B <= '1' ; A <= '1' ;
    end process stimuli;
end Behavioral;
