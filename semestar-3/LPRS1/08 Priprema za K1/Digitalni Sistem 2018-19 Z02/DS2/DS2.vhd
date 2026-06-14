library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DS2 is
	port(
		iA      : in  std_logic_vector(2 downto 0);
		iB      : in  std_logic_vector(6 downto 0);
		iC   	  : in  std_logic_vector(6 downto 0);
		iSEL 	  : in  std_logic_vector(3 downto 0);
		oRESULT : out std_logic_vector(7 downto 0)
	);
end entity;

architecture Behavioral of DS2 is
	signal sDecoder : std_logic_vector(7 downto 0);
	signal sHX		 : std_logic_vector(7 downto 0);
	signal sAdd		 : std_logic_vector(7 downto 0);
	signal sGX		 : std_logic_vector(7 downto 0);
	signal sSHL3	 : std_logic_vector(7 downto 0);
	signal sCoder	 : std_logic_vector(1 downto 0);
	signal sMux		 : std_logic_vector(7 downto 0);
begin
	-- DEKODER 3 ulaza, 8 izlaza jer n = 3, 2^n = 2^3 = 8
	sDecoder <= "00000001" WHEN iA = "000" else
					"00000010" WHEN iA = "001" else
					"00000100" WHEN iA = "010" else
					"00001000" WHEN iA = "011" else
					"00010000" WHEN iA = "100" else
					"00100000" WHEN iA = "101" else
					"01000000" WHEN iA = "110" else
					"10000000" WHEN iA = "111" else
					"10000000";
					
	-- FUNKCIJA H(X)
	sHX		<= iB(3 downto 0) & iB(3 downto 0);
	
	-- SABIRAČ
	sAdd 		<= ('0' & iC) + ('0' & iB); -- vodeće nule ne menjaju binarnu vrednost
	
	-- FUNKCIJA G(X) --> ULAZ: iC(3:0)
	sGX		<= "00000" & iC(3 downto 1);
	
	-- LOGIČKI POMERAČ ULEVO 3 MESTA
	sSHL3 	<= sGX(4 downto 0) & "000";
	
	-- PRIORITETNI KODER
	sCoder	<= "11" WHEN iSEL(3) = '1' else
					"10" WHEN iSEL(2) = '1' else
					"01" WHEN iSEL(1) = '1' else
					"00" WHEN iSEL(0) = '1' else
					"00";
					
	-- MULTIPLEKSER
	sMux 		<= sDecoder WHEN sCoder = "00" else
					sHX		WHEN sCoder = "01" else
					sAdd	 	WHEN sCoder = "10" else
					sSHL3	 	WHEN sCoder = "11" else
					sSHL3;
	
	-- DODELA VREDNOST SIGNALA MUX NA IZLAZ
	oRESULT  <= sMux;
	
end architecture;