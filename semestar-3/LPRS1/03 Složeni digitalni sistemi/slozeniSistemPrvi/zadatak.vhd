library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity zadatak is
	port(
		iA : in std_logic_vector(7 downto 0);
		iB : in std_logic_vector(2 downto 0);
		iSEL : in std_logic_vector(1 downto 0);
		oY : out std_logic_vector(3 downto 0);
		oZERO : out std_logic
	);
end entity;

architecture Behavioral of zadatak is
	signal sCODER : std_logic_vector(2 downto 0);
	signal sADD	  : std_logic_vector(3 downto 0);
	signal sB 	  : std_logic_vector(3 downto 0);
	signal sC	  : std_logic_vector(3 downto 0);
	signal sCOMP  : std_logic_vector(3 downto 0);
	signal sSHIFT : std_logic_vector(3 downto 0);
	signal sDEC   : std_logic_vector(7 downto 0);
	signal sDEC_HIGH : std_logic_vector(3 downto 0);
	signal sDEC_LOW : std_logic_vector(3 downto 0);
	signal sMUX   : std_logic_vector(3 downto 0);
	
begin
	-- prioritetni koder
	sCODER <= "111" when iA(7) = '1' else
				 "110" when iA(6) = '1' else
				 "101" when iA(5) = '1' else
				 "100" when iA(4) = '1' else
				 "011" when iA(3) = '1' else
				 "010" when iA(2) = '1' else
				 "001" when iA(1) = '1' else
				 "000";
	
	-- sabirac
	sB     <= iB(2) & iB;
	sC     <= sCODER(2) & sCODER;	
	sADD   <= sB + sC;
	
	-- komplementer
	sCOMP  <= not(sADD) + 1;
	
	-- aritmeticko pomeranje za 2 udesno
	sSHIFT <= sADD(3) & sADD(3) & sADD(3 downto 2);
	
	-- dekoder
	sDEC   <= "00000001" when iB = "000" else
				 "00000010" when iB = "001" else
				 "00000100" when iB = "010" else
				 "00001000" when iB = "011" else
				 "00010000" when iB = "100" else
				 "00100000" when iB = "101" else
				 "01000000" when iB = "110" else
				 "10000000";
				 
	--
	sDEC_HIGH <= sDEC(7 downto 4);
	sDEC_LOW <= sDEC(3 downto 0);
	
	-- multiplekser
	sMUX <= sCOMP     when iSEL = "00" else
		     sSHIFT    when iSEL = "01" else
			  sDEC_HIGH when iSEL = "10" else
			  sDEC_LOW;
			  
	oY <= sMUX;
	
	oZERO <= '1' when sMUX = 0 else
				'0';
end architecture;