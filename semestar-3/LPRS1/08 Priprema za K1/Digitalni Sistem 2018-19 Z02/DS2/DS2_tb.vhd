library ieee;
use ieee.std_logic_1164.all;

library work;

entity DS2_tb is 
end entity;

architecture Behavioral of DS2_tb is
		signal iA      : std_logic_vector(2 downto 0);
		signal iB      : std_logic_vector(6 downto 0);
		signal iC   	: std_logic_vector(6 downto 0);
		signal iSEL 	: std_logic_vector(3 downto 0);
		signal oRESULT : std_logic_vector(7 downto 0);
		
begin 
	uut : entity work.DS2
		port map(
			iA 		=> iA,
			iB			=> iB,
			iC			=> iC,
			iSEL		=> iSEL,
			oRESULT	=> oRESULT
		);
		
	stimulus : process
		begin 
		-- TEST CASES
		-- NA IZLAZU TREBA DA SE NAĐE VREDNOST 0x08 NAKON IZVRŠENE OPERACIJE DEKODIRANJA
		-- ŠTO ZNAČI DA IZLAZ PRIORITETNOG KODERA TREBA BITI 0
		-- KAKO BI VREDNOST PRIOR. KODERA BILA 0, ISEL(0) MORA BITI 1, 
		iSEL <= "0001"; -- PRIORITETNI KODER GLEDA PRVU POJAVU JEDINICE!
		iA   <= "011";  -- IZLAZ DEKODERA ĆE BITI 00001000
		iB	  <= "0000000";
		iC   <= "0000000";
		wait for 50 ns;
		
		-- NA IZLAZU TREBA DA SE NAĐE VREDNOST 0x99 NAKON IZVRŠENE OPERACIJE H(X)
		-- ŠTO ZNAČI DA IZLAZ PRIORITETNOG KODERA TREBA BITI 1
		-- KAKO BI VREDNOST PRIOR. KODERA BILA 1, ISEL(1) MORA BITI 1, 
		iSEL <= "0011"; -- PRIORITETNI KODER GLEDA PRVU POJAVU JEDINICE!
		iA   <= "000";  
		iB	  <= "0001001"; -- H(X) iC(3:0) lepi dva puta, 0x99 = 1001 1001 (binarno)
		iC   <= "0000000";
		wait for 50 ns;
		
		-- NA IZLAZU TREBA DA SE NAĐE VREDNOST 0x11 NAKON IZVRŠENE OPERACIJE SABIRANJA
		-- ŠTO ZNAČI DA IZLAZ PRIORITETNOG KODERA TREBA BITI 1
		-- KAKO BI VREDNOST PRIOR. KODERA BILA 2, ISEL(2) MORA BITI 1, 
		iSEL <= "0111"; -- PRIORITETNI KODER GLEDA PRVU POJAVU JEDINICE!
		iA   <= "000";  -- 0x11 = 17 (dekatno), binarno je 8 + 9 = 1000 + 1001 (npr) 
		iB	  <= "0001000";  -- PRVI  OPERAND --> 8
		iC   <= "0001001";  -- DRUGI OPERAND --> 9
		wait for 50 ns;
		
		-- NA IZLAZU TREBA DA SE NAĐE VREDNOST 0x20 NAKON IZVRŠENE OPERACIJE LOG. POMERANJA U LEVO
		-- ŠTO ZNAČI DA IZLAZ PRIORITETNOG KODERA TREBA BITI 1
		-- KAKO BI VREDNOST PRIOR. KODERA BILA 3, ISEL(3) MORA BITI 1, 
		iSEL <= "1111"; -- PRIORITETNI KODER GLEDA PRVU POJAVU JEDINICE!
		-- IZLAZ sSHL3 MORA BITI 0010 0000
		-- ULAZ sSHL3 JE ONDA 0000 0100
		-- IZLAZ G(X) MORA BITI 0000 0100
		-- ULAZ G(X) - iC(3:0) JE U TOM SLUČAJU: 1000 ILI 1001
		iA   <= "000";  
		iB	  <= "0000000";
		iC   <= "0001000";
		wait for 50 ns;
		
		---------------------------------------------------------------------------------------------
		-- PREOSTALA 4 TESTNA SLUČAJA (PROIZVOLJNE VREDNOSTI)
		-- DEKODER
		iSEL <= "0001";
		iA   <= "111";
		iB	  <= "0000000";
		iC   <= "0000000";
		wait for 50 ns;
		
		-- H(X)
		iSEL <= "0011";
		iA   <= "000";  
		iB	  <= "0010001";
		iC   <= "0000000";
		wait for 50 ns;
		
		-- SABIRAČ
		iSEL <= "0111"; -- PRIORITETNI KODER GLEDA PRVU POJAVU JEDINICE!
		iA   <= "000";
		iB	  <= "0001001";  -- PRVI  OPERAND --> 9
		iC   <= "0001001";  -- DRUGI OPERAND --> 9
		-- IZLAZ --> 18 tj 0x12
		wait for 50 ns;
		
		-- LOGIČKI POMERAČ 3 MESTA U LEVO
		iA   <= "000";  
		iB	  <= "0000000";
		iC   <= "0001001";
		wait for 50 ns;
		
		wait;
	end process;
end architecture;