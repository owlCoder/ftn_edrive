library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DS1 is 
	port(
		iA 	  : in  std_logic_vector(15 downto 0);
		iB 	  : in  std_logic_vector(3 downto 0);
		oRESULT : out std_logic_vector(3 downto 0)
	
	);
end entity;
	
architecture Behavioral of DS1 is
	signal sCoder 			 : std_logic_vector(3 downto 0);
	signal sAritPomDesno2 : std_logic_vector(3 downto 0);
	signal sLogPomLevo1   : std_logic_vector(3 downto 0);
	signal sComp			 : std_logic;
	signal sMux    		 : std_logic_vector(3 downto 0);
	signal sLogPomDesno1  : std_logic_vector(3 downto 0);
	
begin
	-- PRIORITETNI KODER (PRIORITET -> BITI SA VEĆIM INDEKSOM)
	-- 2^4 ULAZA, 4 IZLAZA
	sCoder <= "1111" WHEN iA(15) = '1' else
				 "1110" WHEN iA(14) = '1' else
				 "1101" WHEN iA(13) = '1' else
				 "1100" WHEN iA(12) = '1' else
				 "1011" WHEN iA(11) = '1' else
				 "1010" WHEN iA(10) = '1' else
				 "1001" WHEN iA(9)  = '1' else
				 "1000" WHEN iA(8)  = '1' else
				 "0111" WHEN iA(7)  = '1' else
				 "0110" WHEN iA(6)  = '1' else
				 "0101" WHEN iA(5)  = '1' else
				 "0100" WHEN iA(4)  = '1' else
				 "0011" WHEN iA(3)  = '1' else
				 "0010" WHEN iA(2)  = '1' else
				 "0001" WHEN iA(1)  = '1' else
				 "0000" WHEN iA(0)  = '1' else
				 "0000";
				 
	-- ARITMETIČKI POMERAJ U DESNO ZA 2 MESTA
	sAritPomDesno2 <= iB(3) & iB(3) & iB(3 downto 2);
	
	-- LOGIČKI POMERAJ U LEVO ZA 1 MESTO
	sLogPomLevo1 <= sAritPomDesno2(2 downto 0) & '0';
	
	-- KOMPARATOR = 2 ?
	sComp   <= '1' WHEN sLogPomLevo1 = "0010" else '0';
	
	-- MULTIPLEKSER
	sMux 	  <= sCoder  WHEN sComp = '0' else
				  sLogPomLevo1 WHEN sComp = '1' else
				  sLogPomLevo1;
				  
	-- LOGIČKI POMERAJ U DESNO ZA 1 MESTO
	sLogPomDesno1 <= '0' & sMux(3 downto 1);
	
	-- DODELA VREDNOSTI IZLAZU
	oRESULT <= sLogPomDesno1;
				  

end architecture;