library ieee;
use ieee.std_logic_1164.all;

library work;

entity BarelovPomerac_tb is
end entity;

architecture Behavioral of BarelovPomerac_tb is
	signal iA			: std_logic_vector(7 downto 0);   -- ULAZNI OPERAND
	signal iB			: std_logic_vector(2 downto 0);	 -- BROJ POMERANJA
	signal oRESULT  	: std_logic_vector(2 downto 0);   -- IZLAZNI REZULTAT PROVUČEN KROZ KODER
	 
begin
	uut : entity work.BarelovPomerac
		port map(
			iA			=> iA,
			iB			=> iB,
			oRESULT	=> oRESULT
		);
		
	stimulus : process
		begin
		-- TEST CASES
		-- NEKA ULAZ BUDE 1; POMERAJEM 1 ULEVO 0000 0001 -> DOBIJE SE 2 KAO IZLAZ sMux3
		iA <= "00000001";
		iB <= "001";		-- SAMO PRVO POMERANJE SE RADI
		wait for 100 ns;
		
		-- NEKA ULAZ BUDE 2; POMERANJE 1 ULEVO I 2 ULEVO 0000 0010 --> DOBIJE SE 16 KAO IZLAZ sMux3
		iA <= "00000010";
		iB <= "011";		-- PRVA DVA POMERAČA RADE
		wait for 100 ns;
		
		-- NEKA ULAZ BUDE 4; POMERANJE 1 ULEVO I 2 ULEVO I 4 ULEVO 0000 0100 --> DOBIJE SE 0 KAO IZLAZ sMux3
		iA <= "00000100";
		iB <= "111";		-- PRVA DVA POMERAČA RADE
		wait for 100 ns;
		
		-- NEKA ULAZ BUDE 1; POMERAJ JE 0, IZLAZ 1
		iA <= "00000001";
		iB <= "000";		-- BEZ POMERAJA!
		wait for 100 ns;
		
		-- NEKA ULAZ BUDE 1; POMERAJ JE 4 ULEVO, IZLAZ 32
		iA <= "00000001";
		iB <= "100";		-- SAMO POMERAJ 4 ULEVO
		wait for 100 ns;
		
		wait;
	end process;
end architecture;