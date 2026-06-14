library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Libraries.

entity lprs1_homework2 is
	port(
		i_clk    :  in std_logic;
		i_rst    :  in std_logic;
		i_run    :  in std_logic;
		i_pause  :  in std_logic;
		o_digit0 : out std_logic_vector(3 downto 0);
		o_digit1 : out std_logic_vector(3 downto 0);
		o_digit2 : out std_logic_vector(3 downto 0);
		o_digit3 : out std_logic_vector(3 downto 0)
	);
end entity;


architecture arch of lprs1_homework2 is
	-- Constants.
	constant cHighMod25  : std_logic_vector(4 downto 0) := "11000";    -- PO MODULU 25 (16 + 8 + 1) ide Mod - 1 => 24
	constant cHighMod10  : std_logic_vector(3 downto 0) := "1001";     -- PO MODULU 10 (8 + 2) ide Mod - 1 => 9
	constant cHighMod5   : std_logic_vector(3 downto 0) := "0100";     -- PO MODULU 5  (4 + 1) ide Mod - 1 => 4
	
	-- Signals.
	signal s_en_1us 		: std_logic;
	signal s_en0			: std_logic;
	signal s_en1			: std_logic;
	signal s_tc_1us		: std_logic;
	signal s_cnt_1us		: std_logic_vector(4 downto 0);
	signal s_tc0			: std_logic;
	signal s_cnt0			: std_logic_vector(3 downto 0);
	signal s_cnt1			: std_logic_vector(3 downto 0);
	signal s_tc1			: std_logic;
	
begin
	-- KONTROLA DOZVOLE BROJANJA
	process (i_clk, i_rst) begin
			if(i_rst = '1') then
				s_en_1us <= '0';
			elsif(rising_edge(i_clk)) then
				if(i_rst = '1') then
					s_en_1us <= '0';
				elsif(i_run = '1') then
					s_en_1us <= '1';
				elsif(i_pause = '1') then
					s_en_1us <= '0';
				elsif(i_pause = '1' AND i_run = '1') then
					s_en_1us <= '1';
				end if;
			end if;
	end process;
	
	-- BROJAČ OD 1 MIKROSEKUNDE
	process (i_clk, i_rst) begin
		if(i_rst = '1') then
			s_cnt_1us <= "00000";
		elsif(rising_edge(i_clk)) then
			if(s_en_1us = '1') then
				if(s_cnt_1us < cHighMod25) then
					s_cnt_1us <= s_cnt_1us + 1;
				elsif(s_cnt_1us >= cHighMod25) then
					s_cnt_1us <= "00000";
				end if;
			end if;
		end if;
	end process;
	
	-- KOMBINACIONO KOLO ZA SIGNAL KRAJA BROJANJA
	s_tc_1us <= '1' when s_cnt_1us = "00000" else
				   '0';
	-- AND GATE KOJI DOZVOLJAVA RAD BROJAČA NULTE CIFRE
	-- AKKO SU OBA SIGNALA DOZVOLE I KRAJA BROJANJA AKTIVNA
	s_en0 <= s_en_1us AND s_tc_1us;
	
	-- BROJAČ NULTE CIFRE
	process (i_clk, i_rst) begin
		if(i_rst = '1') then
			s_cnt0 <= "0000";
		elsif(rising_edge(i_clk)) then
			if(s_en0 = '1') then
				if(s_cnt0 < cHighMod10) then
					s_cnt0 <= s_cnt0 + 1;
				elsif(s_cnt0 >= cHighMod10) then
					s_cnt0 <= "0000";
				end if;
			end if;
		end if;
	end process;
	
	-- KOMBINACIONO KOLO PROVERE AKTIVACIJE SIGNALA
	s_tc0 <= '1' when s_cnt0 = "1001" else
				'0';
				
	-- AND GATE
	s_en1 <= s_en0 AND s_tc0;
	
	-- DODELA VREDNOSTI SIGNALA S_CNT0 na o_digit0
	o_digit0 <= s_cnt0;
	
	-- BROJAČ JEDNE PRVE CIFRE
	process (i_clk, i_rst) begin
		if(i_rst = '1') then
			s_cnt1 <= "0000"; 
		elsif(rising_edge(i_clk)) then
			if(s_en1 = '1') then
				if(s_cnt1 < cHighMod5) then
					s_cnt1 <= s_cnt1 + 1;
				elsif(s_cnt0 >= cHighMod5) then
					s_cnt1 <= "0000";
				end if;
			end if;
		end if;
	end process;
	
	--  KOMBINACIONO KOLO ZA SIGNAL KRAJA BROJANJA
	s_tc1 <= '1' when s_cnt1 = "0101" else
				'0';
	
	-- DODELA VREDNOSTI SIGNALA NA IZLAZ
	o_digit1 <= s_cnt1;
	
	-- DODELA VREDNOSTI 3 NA SIGNAL
	o_digit2 <= "0011";
	
	-- DODELA VREDNOSTI 9 NA SIGNAL
	o_digit3 <= "1001";
end architecture;
