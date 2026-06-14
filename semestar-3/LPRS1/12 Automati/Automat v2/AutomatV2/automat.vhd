library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Automat is
	port(
		iCLK		  : in  std_logic;
		inRST		  : in  std_logic;
		iINPUT	  : in  std_logic_vector(15 downto 0);
		iPRICE	  : in  std_logic_vector(15 downto 0);
		oPAID		  : out std_logic;
		oCHANGE	  : out std_logic_vector(15 downto 0);
		oBAD_INPUT : out std_logic
	);
end entity;

architecture arch of Automat is
	signal sLIM   : std_logic_vector(15 downto 0);
	signal sADD   : std_logic_vector(15 downto 0);
	signal sREG   : std_logic_vector(15 downto 0);
	signal sSUB   : std_logic_vector(15 downto 0);
	signal sPAID  : std_logic;
	
begin
	-- LIMITER
	sLIM <= iINPUT WHEN iINPUT <= "0000000111110100" ELSE "0000000000000000";
	
	-- SABIRAČ
	sADD <= 0 + sLIM;
	
	-- REGISTAR ASINHRONI RESET
	process(iCLK, inRST) begin
		if(inRST = '0') then
			sREG <= "0000000000000000";
		elsif(rising_edge(iCLK)) then
			sREG <= sADD;
		end if;
	end process;
	
	-- ODUZIMAČ
	sSUB <= sREG - iPRICE;
	
	-- KOMPARATOR
	sPAID <= '1' WHEN sSUB >= 0 ELSE '0';
	
	-- MUX
	oCHANGE <= sSUB WHEN sPAID = '1' ELSE "0000000000000000";
	oBAD_INPUT <= '1' WHEN sLIM = 0 ELSE '0';
	oPAID <= sPAID;
end architecture;