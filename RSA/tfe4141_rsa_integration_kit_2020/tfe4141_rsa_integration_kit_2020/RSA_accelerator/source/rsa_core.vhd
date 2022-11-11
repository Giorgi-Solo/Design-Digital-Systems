--------------------------------------------------------------------------------
-- Author       : Oystein Gjermundnes
-- Organization : Norwegian University of Science and Technology (NTNU)
--                Department of Electronic Systems
--                https://www.ntnu.edu/ies
-- Course       : TFE4141 Design of digital systems 1 (DDS1)
-- Year         : 2018-2019
-- Project      : RSA accelerator
-- License      : This is free and unencumbered software released into the
--                public domain (UNLICENSE)
--------------------------------------------------------------------------------
-- Purpose:
--   RSA encryption core template. This core currently computes
--   C = M xor key_n
--
--   Replace/change this module so that it implements the function
--   C = M**key_e mod key_n.
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity rsa_core is
	generic (
		-- Users to add parameters here
		C_BLOCK_SIZE          : integer := 256
	);
	port (
		-----------------------------------------------------------------------------
		-- Clocks and reset
		-----------------------------------------------------------------------------
		clk                    :  in std_logic;
		reset_n                :  in std_logic;

		-----------------------------------------------------------------------------
		-- Slave msgin interface
		-----------------------------------------------------------------------------
		-- Message that will be sent out is valid
		msgin_valid             : in std_logic;
		-- Slave ready to accept a new message
		msgin_ready             : out std_logic;
		-- Message that will be sent out of the rsa_msgin module
		msgin_data              :  in std_logic_vector(C_BLOCK_SIZE-1 downto 0);
		-- Indicates boundary of last packet
		msgin_last              :  in std_logic;

		-----------------------------------------------------------------------------
		-- Master msgout interface
		-----------------------------------------------------------------------------
		-- Message that will be sent out is valid
		msgout_valid            : out std_logic;
		-- Slave ready to accept a new message
		msgout_ready            :  in std_logic;
		-- Message that will be sent out of the rsa_msgin module
		msgout_data             : out std_logic_vector(C_BLOCK_SIZE-1 downto 0);
		-- Indicates boundary of last packet
		msgout_last             : out std_logic;

		-----------------------------------------------------------------------------
		-- Interface to the register block
		-----------------------------------------------------------------------------
		key_e_d                 :  in std_logic_vector(C_BLOCK_SIZE-1 downto 0);
		key_n                   :  in std_logic_vector(C_BLOCK_SIZE-1 downto 0);
		rsa_status              : out std_logic_vector(31 downto 0)

	);
end rsa_core;

architecture rtl of rsa_core is
    constant coreNumber  : integer := 18;
    constant counterSize : integer := 2;
    
    type DATA_OUT_ARRAY is array (0 to (coreNumber - 1)) of std_logic_vector(31 downto 0);
        
    signal ready_in_q  : std_logic_vector((coreNumber - 1) downto 0);  -- queue of cores that are ready to start calculation
    signal valid_out_q : std_logic_vector((coreNumber - 1) downto 0);  -- queue of cores that finished the calculation
    
    signal valid_in_vec    : std_logic_vector((coreNumber - 1) downto 0);
    signal msgout_last_vec : std_logic_vector((coreNumber - 1) downto 0);
    signal data_out_arr    : DATA_OUT_ARRAY;
    signal ready_out_vec   : std_logic_vector((coreNumber - 1) downto 0);
    
    signal id_ready_core    : integer := 0;
    signal id_finished_core : integer := 0;

begin
    -- msgin interface mux and encoder
    msgin_ready <= ready_in_q(id_ready_core);
    
    msgin_valid_ENCODER: process (msgin_valid, id_ready_core) begin
        case (id_ready_core) is
        when 0      => valid_in_vec <= (0 => msgin_valid, others => '0');-- "000000000" & msgin_valid;
        when 1      => valid_in_vec <= (1 => msgin_valid, others => '0');-- "00000000" & msgin_valid & "0";
        when 2      => valid_in_vec <= (2 => msgin_valid, others => '0');-- "0000000" & msgin_valid & "00";
        when 3      => valid_in_vec <= (3 => msgin_valid, others => '0');-- "000000" & msgin_valid & "000";
        when 4      => valid_in_vec <= (4 => msgin_valid, others => '0');-- "00000" & msgin_valid & "0000";
        when 5      => valid_in_vec <= (5 => msgin_valid, others => '0');-- "0000" & msgin_valid & "00000";
        when 6      => valid_in_vec <= (6 => msgin_valid, others => '0');-- "000" & msgin_valid & "000000";
        when 7      => valid_in_vec <= (7 => msgin_valid, others => '0');-- "00" & msgin_valid & "0000000";
        when 8      => valid_in_vec <= (8 => msgin_valid, others => '0');-- "0" & msgin_valid & "00000000";
        when 9      => valid_in_vec <= (9 => msgin_valid, others => '0');-- msgin_valid & "000000000";
        when 10     => valid_in_vec <= (10 => msgin_valid, others => '0');-- "000000000" & msgin_valid;
        when 11     => valid_in_vec <= (11 => msgin_valid, others => '0');-- "00000000" & msgin_valid & "0";
        when 12     => valid_in_vec <= (12 => msgin_valid, others => '0');-- "0000000" & msgin_valid & "00";
        when 13     => valid_in_vec <= (13 => msgin_valid, others => '0');-- "000000" & msgin_valid & "000";
        when 14     => valid_in_vec <= (14 => msgin_valid, others => '0');-- "00000" & msgin_valid & "0000";
        when 15     => valid_in_vec <= (15 => msgin_valid, others => '0');-- "0000" & msgin_valid & "00000";
        when 16     => valid_in_vec <= (16 => msgin_valid, others => '0');-- "000" & msgin_valid & "000000";
        when 17     => valid_in_vec <= (17 => msgin_valid, others => '0');-- "00" & msgin_valid & "0000000";
        when others => valid_in_vec <= (others => '0');
        end case;
    end process msgin_valid_ENCODER;
    
    -- msgout interface mux and encoder
    msgout_valid <= valid_out_q(id_finished_core);
    msgout_last  <= msgout_last_vec(id_finished_core);
    
--    msgout_data  <= data_out_arr(id_finished_core);
    
    process (clk, reset_n) begin
        if (reset_n = '0') then
            msgout_data <= (others => '0');
        elsif (clk'event and clk='1') then
            if (valid_out_q(id_finished_core) = '0') then
                msgout_data <= data_out_arr(id_finished_core) & msgout_data(255 downto 32);
            end if;
        end if;
    end process;
        
    msgout_ready_ENCODER: process (msgout_ready, id_finished_core) begin
        case (id_finished_core) is
        when 0      => ready_out_vec <= (0 => msgout_ready, others => '0');-- "000000000" & msgout_ready;
        when 1      => ready_out_vec <= (1 => msgout_ready, others => '0');-- "00000000" & msgout_ready & "0";
        when 2      => ready_out_vec <= (2 => msgout_ready, others => '0');-- "0000000" & msgout_ready & "00";
        when 3      => ready_out_vec <= (3 => msgout_ready, others => '0');-- "000000" & msgout_ready & "000";
        when 4      => ready_out_vec <= (4 => msgout_ready, others => '0');-- "00000" & msgout_ready & "0000";
        when 5      => ready_out_vec <= (5 => msgout_ready, others => '0');-- "0000" & msgout_ready & "00000";
        when 6      => ready_out_vec <= (6 => msgout_ready, others => '0');-- "000" & msgout_ready & "000000";
        when 7      => ready_out_vec <= (7 => msgout_ready, others => '0');-- "00" & msgout_ready & "0000000";
        when 8      => ready_out_vec <= (8 => msgout_ready, others => '0');-- "0" & msgout_ready & "00000000";
        when 9      => ready_out_vec <= (9 => msgout_ready, others => '0');-- msgout_ready & "000000000";
        when 10     => ready_out_vec <= (10 => msgout_ready, others => '0');-- "000000000" & msgout_ready;
        when 11     => ready_out_vec <= (11 => msgout_ready, others => '0');-- "00000000" & msgout_ready & "0";
        when 12     => ready_out_vec <= (12 => msgout_ready, others => '0');-- "0000000" & msgout_ready & "00";
        when 13     => ready_out_vec <= (13 => msgout_ready, others => '0');-- "000000" & msgout_ready & "000";
        when 14     => ready_out_vec <= (14 => msgout_ready, others => '0');-- "00000" & msgout_ready & "0000";
        when 15     => ready_out_vec <= (15 => msgout_ready, others => '0');-- "0000" & msgout_ready & "00000";
        when 16     => ready_out_vec <= (16 => msgout_ready, others => '0');-- "000" & msgout_ready & "000000";
        when 17     => ready_out_vec <= (17 => msgout_ready, others => '0');-- "00" & msgout_ready & "0000000";
        when others => ready_out_vec <= (others => '0');
        end case;
    end process msgout_ready_ENCODER;
    
    
    dut_selector_for_ready_core: entity work.selector
        generic map
            (
                coreNumber  => coreNumber,
                counterSize => counterSize
            )
        port map
            (
                clk     => clk                          ,
                reset_n => reset_n                      ,
                
                valid   =>  msgin_valid                 ,
                ready   =>  msgin_ready, --ready_in_q(id_ready_core)   ,
                
                id      => id_ready_core
            );
    
    dut_selector_for_finished_core: entity work.selector
        generic map
            (
                coreNumber  => coreNumber,
                counterSize => counterSize
            )
        port map
            (
                clk     => clk                              ,
                reset_n => reset_n                          ,
                
                valid   =>  msgout_valid, --valid_out_q(id_finished_core)   ,
                ready   =>  msgout_ready                    ,
                
                id      => id_finished_core
            );
                    
	i_exponentiation00 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(0) , --msgout_last,
			ready_out   => ready_out_vec(0)   , --msgout_ready,
			valid_out   => valid_out_q(0)     , --msgout_valid,
			result      => data_out_arr(0)    , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(0)    , --msgin_valid ,
			ready_in    => ready_in_q(0)      , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last         ,
			message     => msgin_data         ,
			key         => key_e_d            ,
			modulus     => key_n              ,
			clk         => clk                ,
			reset_n     => reset_n
		);
	
	i_exponentiation01 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(1), --msgout_last,
			ready_out   => ready_out_vec(1)  , --msgout_ready,
			valid_out   => valid_out_q(1)    , --msgout_valid,
			result      => data_out_arr(1)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(1)   , --msgin_valid ,
			ready_in    => ready_in_q(1)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
			
	i_exponentiation02 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(2), --msgout_last,
			ready_out   => ready_out_vec(2)  , --msgout_ready,
			valid_out   => valid_out_q(2)    , --msgout_valid,
			result      => data_out_arr(2)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(2)   , --msgin_valid ,
			ready_in    => ready_in_q(2)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
					
	i_exponentiation03 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(3), --msgout_last,
			ready_out   => ready_out_vec(3)  , --msgout_ready,
			valid_out   => valid_out_q(3)    , --msgout_valid,
			result      => data_out_arr(3)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(3)   , --msgin_valid ,
			ready_in    => ready_in_q(3)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
						
	i_exponentiation04 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(4), --msgout_last,
			ready_out   => ready_out_vec(4)  , --msgout_ready,
			valid_out   => valid_out_q(4)    , --msgout_valid,
			result      => data_out_arr(4)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(4)   , --msgin_valid ,
			ready_in    => ready_in_q(4)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
								
	i_exponentiation05 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(5), --msgout_last,
			ready_out   => ready_out_vec(5)  , --msgout_ready,
			valid_out   => valid_out_q(5)    , --msgout_valid,
			result      => data_out_arr(5)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(5)   , --msgin_valid ,
			ready_in    => ready_in_q(5)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
										
	i_exponentiation06 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(6), --msgout_last,
			ready_out   => ready_out_vec(6)  , --msgout_ready,
			valid_out   => valid_out_q(6)    , --msgout_valid,
			result      => data_out_arr(6)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(6)   , --msgin_valid ,
			ready_in    => ready_in_q(6)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
											
	i_exponentiation07 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(7), --msgout_last,
			ready_out   => ready_out_vec(7)  , --msgout_ready,
			valid_out   => valid_out_q(7)    , --msgout_valid,
			result      => data_out_arr(7)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(7)   , --msgin_valid ,
			ready_in    => ready_in_q(7)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
												
	i_exponentiation08 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(8), --msgout_last,
			ready_out   => ready_out_vec(8)  , --msgout_ready,
			valid_out   => valid_out_q(8)    , --msgout_valid,
			result      => data_out_arr(8)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(8)   , --msgin_valid ,
			ready_in    => ready_in_q(8)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
		
	i_exponentiation09 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(9), --msgout_last,
			ready_out   => ready_out_vec(9)  , --msgout_ready,
			valid_out   => valid_out_q(9)    , --msgout_valid,
			result      => data_out_arr(9)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(9)   , --msgin_valid ,
			ready_in    => ready_in_q(9)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
		                    
	i_exponentiation10 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(10) , --msgout_last,
			ready_out   => ready_out_vec(10)   , --msgout_ready,
			valid_out   => valid_out_q(10)     , --msgout_valid,
			result      => data_out_arr(10)    , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(10)    , --msgin_valid ,
			ready_in    => ready_in_q(10)      , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last         ,
			message     => msgin_data         ,
			key         => key_e_d            ,
			modulus     => key_n              ,
			clk         => clk                ,
			reset_n     => reset_n
		);
	
	i_exponentiation11 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(11), --msgout_last,
			ready_out   => ready_out_vec(11)  , --msgout_ready,
			valid_out   => valid_out_q(11)    , --msgout_valid,
			result      => data_out_arr(11)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(11)   , --msgin_valid ,
			ready_in    => ready_in_q(11)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
			
	i_exponentiation12 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(12), --msgout_last,
			ready_out   => ready_out_vec(12)  , --msgout_ready,
			valid_out   => valid_out_q(12)    , --msgout_valid,
			result      => data_out_arr(12)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(12)   , --msgin_valid ,
			ready_in    => ready_in_q(12)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
					
	i_exponentiation13 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(13), --msgout_last,
			ready_out   => ready_out_vec(13)  , --msgout_ready,
			valid_out   => valid_out_q(13)    , --msgout_valid,
			result      => data_out_arr(13)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(13)   , --msgin_valid ,
			ready_in    => ready_in_q(13)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
						
	i_exponentiation14 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(14), --msgout_last,
			ready_out   => ready_out_vec(14)  , --msgout_ready,
			valid_out   => valid_out_q(14)    , --msgout_valid,
			result      => data_out_arr(14)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(14)   , --msgin_valid ,
			ready_in    => ready_in_q(14)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
								
	i_exponentiation15 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(15), --msgout_last,
			ready_out   => ready_out_vec(15)  , --msgout_ready,
			valid_out   => valid_out_q(15)    , --msgout_valid,
			result      => data_out_arr(15)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(15)   , --msgin_valid ,
			ready_in    => ready_in_q(15)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
										
	i_exponentiation16 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(16), --msgout_last,
			ready_out   => ready_out_vec(16)  , --msgout_ready,
			valid_out   => valid_out_q(16)    , --msgout_valid,
			result      => data_out_arr(16)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(16)   , --msgin_valid ,
			ready_in    => ready_in_q(16)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
											
	i_exponentiation17 : entity work.exponentiation
		generic map (
			C_block_size => C_BLOCK_SIZE
		)
		port map (
            -- from/to rsa_msgout_regs
		    msgout_last => msgout_last_vec(17), --msgout_last,
			ready_out   => ready_out_vec(17)  , --msgout_ready,
			valid_out   => valid_out_q(17)    , --msgout_valid,
			result      => data_out_arr(17)   , --msgout_data ,
			
			-- from/to rsa_msgin_regs
			valid_in    => valid_in_vec(17)   , --msgin_valid ,
			ready_in    => ready_in_q(17)     , --msgin_ready ,  in queue
			
			msgin_last  => msgin_last        ,
			message     => msgin_data        ,
			key         => key_e_d           ,
			modulus     => key_n             ,
			clk         => clk               ,
			reset_n     => reset_n
		);
	

	rsa_status   <= (others => '0');
end rtl;
