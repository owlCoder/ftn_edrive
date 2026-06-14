
library ieee;
use ieee.std_logic_1164.all;

library work;

entity lprs1_homework2_tb is
end entity;

architecture arch of lprs1_homework2_tb is
	
	constant i_clk_period : time := 40 ns; -- 25 MHz
	
	signal i_clk    : std_logic;
	signal i_rst    : std_logic;
	signal i_run    : std_logic;
	signal i_pause  : std_logic;
	
	signal o_digit0 : std_logic_vector(3 downto 0);
	signal o_digit1 : std_logic_vector(3 downto 0);
	signal o_digit2 : std_logic_vector(3 downto 0);
	signal o_digit3 : std_logic_vector(3 downto 0);
	
begin
	
	uut: entity work.lprs1_homework2
	port map(
		i_clk    => i_clk,
		i_rst    => i_rst,
		i_run    => i_run,
		i_pause  => i_pause,
		o_digit0 => o_digit0,
		o_digit1 => o_digit1,
		o_digit2 => o_digit2,
		o_digit3 => o_digit3
	);
	
	clk_p: process
	begin
		i_clk <= '1';
		wait for i_clk_period/2;
		i_clk <= '0';
		wait for i_clk_period/2;
	end process;
	
	stim_p: process
	begin
		-- Test cases:
		i_run   <= '0';
		i_pause <= '0';
		
		-- 1. RESET PRITISNUT 1 MIKROSEKUNDU - TAKT
		i_rst <= '1';
		wait for 1us - i_clk_period;      -- 960    ns 
		i_rst <= '0';
		
		wait for 25 * i_clk_period;       --  1000 ns
		
		-- 2. PRITISNUTI I_RUN TASTER [o_digit = 0 --> 1 U 2US]
		i_run <= '1';
		wait for i_clk_period;            
		i_run <= '0';
		
		
		-- 3. ZOOM WAVEFORM U 3 us
		wait for 49 * i_clk_period;    
		
		-- 4. PAUZIRANJE ŠTOPERICE ZA 1 TAKT -> I_PAUSE
		i_pause <= '1';
		wait for i_clk_period; 				 -- 40 ns 
		i_pause <= '0';
		
		i_run <= '1';
		wait for i_clk_period;   			 -- 40 ns
		i_run <= '0';
		
		-- 5. POSTAVITI I_RUN NA 1
		i_run <= '1';
		
		-- 6. PUSTITI RESET NA 6 MS
		wait for 25 * i_clk_period; 		 -- 10 us
		i_rst <= '1';
		wait for 24 * i_clk_period;   	 --  6 us = 6000 ns
		
		i_rst <= '0';
		
		-- 7.
		-- o digit_0 DOSTIGNE 3 ZA 18040 NS, DOK O_DIGIT1 DOSTIGNE VREDNOST 2 ZA 18040 NS
		-- 6000 NS JE PRE DISABLE RESETA
		-- 18040 - 6000 = 12040 NS 
		-- 12040 / I_CLK_PERIOD = 301
		wait for 301 * i_clk_period;
		wait for i_clk_period; -- ZADRŽATI SIGNAL 1 TAKT
		
		i_rst <= '1';			  -- DRŽATI RESET
		wait for i_clk_period; -- 1 TAKT
		i_rst <= '0';
		
		-- 8.
		-- o digit_0 DOSTIGNE 5 ZA 32160 NS, DOK O_DIGIT1 DOSTIGNE VREDNOST 2 ZA 32160 NS
		-- 18080 NS JE PRE DISABLE RESETA
		-- 32160 - 18080 = 14080 NS 
		-- 18080 / I_CLK_PERIOD = 352
		wait for 352 * i_clk_period;
		
		i_rst <= '1';			  -- DRŽATI RESET 1 TAKT
		wait for i_clk_period; -- 1 TAKT
		i_rst <= '0';
		
		wait;
	end process;
	
	
end architecture;
