library ieee;
use ieee.std_logic_1164.all;

library work;

entity DS1_tb is
end entity;
	
architecture Behavioral of DS1_tb is
		signal iA 	   : std_logic_vector(15 downto 0);
		signal iB 	   : std_logic_vector(3 downto 0);
		signal oRESULT : std_logic_vector(3 downto 0);
	
begin
	uut : entity work.DS1
		port map(
			iA 		=> iA,
			iB 		=> iB,
			oRESULT  => oRESULT
		);

	stimulus : process
		begin
		-- TEST CASES
		-- OBEZBEDITI BAREM JEDAN SLUČAJ GDE SE NA ULAZU U ARITM. POMERAČ NALAZI BIT NAJVEĆE TEŽINE SA VREDNOŠĆU '0'
		iA <= "1111000000001111";
		iB <= "0111";
		wait for 100 ns;
		
		-- OBEZBEDITI BAREM JEDAN SLUČAJ GDE SE NA ULAZU U ARITM. POMERAČ NALAZI BIT NAJVEĆE TEŽINE SA VREDNOŠĆU '1'
		iA <= "1111000000001111";
		iB <= "1000";
		wait for 100 ns;
		
		
		-- AKTIVACIJA GRANE 0 MUX
		-- LOG POMERAJ U LEVO ZA 1 MORA BITI != 2 tj 0010 KAKO BI SEL. IZLAZ BIO 0
		-- 0001 SIGNAL KOJI TREBA DA BUDE ULAZ U LOG. POMERAČ
		-- 0100 SIGNAL NA ULAZU ARITM. POMERAČA U DESNO ZA 2 MESTA
		-- ŠTO ZNAČI DA SVE DRUGE VREDNOSTI SIGNALA ĆE AKTIVIRATI SEL. GRANU 0
		iA <= "1111000000001111";
		iB <= "1111";
		wait for 100 ns;
		
			-- AKTIVACIJA GRANE 1 MUX
		-- LOG POMERAJ U LEVO ZA 1 MORA BITI == 2 tj 0010 KAKO BI SEL. IZLAZ BIO 0
		-- 0001 SIGNAL KOJI TREBA DA BUDE ULAZ U LOG. POMERAČ
		-- 0100 SIGNAL NA ULAZU ARITM. POMERAČA U DESNO ZA 2 MESTA
		-- ŠTO ZNAČI DA VREDNOST ULAZA 0100 iB AKTIVIRATI ĆE SEL. GRANU 1
		iA <= "1111000000001111";
		iB <= "0100";
		wait for 100 ns;
		
		wait;
	end process;
	
end architecture;