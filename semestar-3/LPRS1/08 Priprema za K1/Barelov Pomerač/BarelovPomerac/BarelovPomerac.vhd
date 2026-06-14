library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity BarelovPomerac is
	port(
		iA			: in  std_logic_vector(7 downto 0);  -- ULAZNI OPERAND
		iB			: in  std_logic_vector(2 downto 0);	 -- BROJ POMERANJA
		oRESULT  : out std_logic_vector(2 downto 0)   -- IZLAZNI REZULTAT PROVUČEN KROZ KODER
	);
end entity;

architecture Behavioral of BarelovPomerac is
	signal sLogickoLevo1 :  std_logic_vector(7 downto 0);
	signal sLogickoLevo2 :  std_logic_vector(7 downto 0);
	signal sLogickoLevo4 :  std_logic_vector(7 downto 0);
	
	signal sMux1 			:  std_logic_vector(7 downto 0);
	signal sMux2 			:  std_logic_vector(7 downto 0);
	signal sMux3 			:  std_logic_vector(7 downto 0);
	
	signal sCoder			: std_logic_vector(2 downto 0);
begin
	-- PRVI POMERAČ
	-- ULAZ iA(7:0); IZLAZ 8-bitni na ulaz MUX1
	sLogickoLevo1 <= iA(6 downto 0) & '0';
	
	-- MUX1
	sMux1			  <= iA 				 WHEN iB(0) = '0' else 
						  sLogickoLevo1 WHEN iB(0) = '1' else
						  sLogickoLevo1;
						  
	-- DRUGI POMERAČ
	-- ULAZ sMux1(7:0), IZLAZ 8-bitni na ulaz MUX2
		sLogickoLevo2 <= sMux1(5 downto 0) & "00";
	
	-- MUX2
	sMux2			  <= sMux1			 WHEN iB(1) = '0' else 
						  sLogickoLevo2 WHEN iB(1) = '1' else
						  sLogickoLevo2;
						  
	-- TREĆI POMERAČ
	-- ULAZ sMux2(7:0), IZLAZ 8-bitni na ulaz MUX3
		sLogickoLevo4 <= sMux2(3 downto 0) & "0000";
	
	-- MUX3
	sMux3			  <= sMux2			 WHEN iB(2) = '0' else 
						  sLogickoLevo4 WHEN iB(2) = '1' else
						  sLogickoLevo4;
	
	-- PRIORITETNI KODER (VEĆI BIT --> VEĆI PRIORITET)
	sCoder 		  <= "111"			 WHEN sMux3(7) = '1' else
						  "110"			 WHEN sMux3(6) = '1' else
						  "101"			 WHEN sMux3(5) = '1' else
						  "100"			 WHEN sMux3(4) = '1' else
						  "011"			 WHEN sMux3(3) = '1' else
						  "010"			 WHEN sMux3(2) = '1' else
						  "001"			 WHEN sMux3(1) = '1' else
						  "000"			 WHEN sMux3(0) = '1' else
						  "000";
						  
	-- DODELA VREDNOSTI KODERA NA IZLAZ
	oRESULT <= sCoder;
end architecture;