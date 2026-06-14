library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

library work;

entity lprs1_homework3_tb is
end entity;

architecture arch of lprs1_homework3_tb is
	-- Constants.
	constant A : std_logic_vector(1 downto 0) := "00";
	constant C : std_logic_vector(1 downto 0) := "01";
	constant G : std_logic_vector(1 downto 0) := "10";
	constant T : std_logic_vector(1 downto 0) := "11";
	
	
	constant i_clk_period : time := 10 ns;
	
	signal i_clk            : std_logic;
	signal i_rst            : std_logic;
	signal i_base           : std_logic_vector(1 downto 0);
	signal i_sequence       : std_logic_vector(63 downto 0);
	signal i_load_sequence  : std_logic;
	signal i_base_src_sel   : std_logic;
	signal i_cnt_subseq_sel : std_logic_vector(1 downto 0);
	signal o_cnt_subseq     : std_logic_vector(3 downto 0);
	
begin
	
	uut: entity work.lprs1_homework3
	port map(
		i_clk            => i_clk,
		i_rst            => i_rst,
		i_base           => i_base,
		i_sequence       => i_sequence,
		i_load_sequence  => i_load_sequence,
		i_base_src_sel   => i_base_src_sel,
		i_cnt_subseq_sel => i_cnt_subseq_sel,
		o_cnt_subseq     => o_cnt_subseq
	);
	
	clk_p: process
	begin
		i_clk <= '0';
		wait for i_clk_period/2;
		i_clk <= '1';
		wait for i_clk_period/2;
	end process;
	
	stim_p: process
	begin
		-- UNDEFINED STATE OF i_seq while data loads! 64*10ns is 640 ns without data...
		for i in 0 to 63 loop
			i_sequence(i) <= '0';
		end loop;
		
		-- START VALUES [PRIPREMA ZA UČITAVANJE PODATAKA]
		i_load_sequence  <= '1';
		i_base_src_sel   <= '0';
		i_cnt_subseq_sel <= "00";
		i_rst				  <= '0';
		
		-- 1. На улаз i_base довести следећe секвенце:
	   -- (а) GAGA GCAT CGTG AAGA GGCA AGAA GGCA CCAT
		i_base <= G;
		wait for i_clk_period;
		
		i_base <= A;
		wait for i_clk_period;
		
		i_base <= G;
		wait for i_clk_period;
		
		i_base <= A;
		wait for i_clk_period;
		
		------------ END OF GAGA -----------------
		
		i_base <= G;
		wait for i_clk_period;
		
		i_base <= C;
		wait for i_clk_period;
		
		i_base <= A;
		wait for i_clk_period;
		
		------------ ISPIS NA MUX ----------------
		i_cnt_subseq_sel <= "01"; -- PODSEKVENCA POD B, VREDNOST 1. BROJAČA
		------------------------------------------
		
		i_base <= T;
		wait for i_clk_period;
		
		------------ END OF GCAT -----------------
		
		i_base <= C;
		wait for i_clk_period;
		
		i_base <= G;
		wait for i_clk_period;
		
		i_base <= T;
		wait for i_clk_period;
		
		i_base <= G;
		wait for i_clk_period;
		
		------------ END OF CGTG -----------------
		
		i_base <= A;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		
		------------ END OF AAGA -----------------
		
		i_base <= G;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		
		------------ END OF GGCA -----------------
		
		i_base <= A;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		
		------------ END OF AGAA -----------------
		
		i_base <= G;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		
		------------ END OF GGCA -----------------
		
		i_base <= C;
		wait for i_clk_period;
		
		------------ ISPIS NA MUX ----------------
		i_cnt_subseq_sel <= "00"; -- PODSEKVENCA POD A, VREDNOST 0. BROJAČA
		------------------------------------------
		
		i_base <= C;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		i_base <= T;
		wait for 2 * i_clk_period;  -- NAKON KRAJA SVAKE SEKVENCE SAČEKATI 1 TAKT
		
		------------ ISPIS NA MUX ----------------
		i_cnt_subseq_sel <= "01"; -- PODSEKVENCA POD B, VREDNOST 1. BROJAČA
		------------------------------------------
		
		------------ END OF CCAT -----------------
		
		-- UČITAJ SEKVENCU
		i_base_src_sel  <= '0';
		i_load_sequence <= '1';
		wait for i_clk_period;
		i_load_sequence <= '0'; -- POTREBNO JE DA SE UČITA NOVA BAZA
		
		-- RESET i_seq
		for i in 0 to 63 loop
			i_sequence(i) <= '0';
		end loop;
		
		-- RESET SELEKCIONOG SORSA
		i_base_src_sel   <= '0';
		i_cnt_subseq_sel <= "00";
		
		-- RESET
		i_rst <= '1';
		wait for 14 * i_clk_period;
		i_rst <= '0';
		
		------------------------------------------------------------
		-- 1. На улаз i_base довести следећe секвенце:
	   -- (б) ATAT CAGT AGCT GACG TTTC ATGA CGCA GCCG
		i_base <= A;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		
		i_base <= C;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		
		i_base <= A;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		
		i_base <= G;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		
		i_base <= T;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		
		i_base <= A;
		wait for i_clk_period;
		i_base <= T;
		wait for i_clk_period;
		
		------------ ISPIS NA MUX ----------------
		i_cnt_subseq_sel <= "01"; -- PODSEKVENCA POD B, VREDNOST 1. BROJAČA
		------------------------------------------
		
		i_base <= G;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		
		i_base <= C;
		wait for i_clk_period;
		i_base <= G;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= A;
		wait for i_clk_period;
		
		i_base <= G;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= C;
		wait for i_clk_period;
		i_base <= G;
		wait for 2 * i_clk_period;  -- NAKON KRAJA SVAKE SEKVENCE SAČEKATI 1 TAKT
		
		-- KRAJ SEKVENCE
		i_base_src_sel  <= '0';
		i_load_sequence <= '0';

		-- RESET i_seq
		for i in 0 to 63 loop
			i_sequence(i) <= '0';
		end loop;
		
		-- RESET
		i_rst <= '1';
		wait for 14 * i_clk_period;
		i_rst <= '0';
		
		---------------------------------------------
		-- 9. На краjу оставити систем у ресету.
		i_load_sequence  <= '0';
		i_base_src_sel   <= '0';
		i_cnt_subseq_sel <= "00";
		i_rst				  <= '1';
		i_base			  <= "00";
		
		for i in 0 to 63 loop
			i_sequence(i) <= '0';
		end loop;
		
		wait;
	end process;
end architecture;
