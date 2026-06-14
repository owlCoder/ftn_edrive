library ieee;
use ieee.std_logic_1164.all;

entity Toster_tb is 
end entity;

architecture test of Toster_tb is
	component Toster is port(
	iRST 	 	     : in  std_logic;
	iCLK  		  : in  std_logic;
	iTOAST		  : in  std_logic;
	oDONE			  : out std_logic;
	oTEMP			  : out std_logic_vector(7 downto 0);
	oTIME		     : out std_logic_vector(5 downto 0)
	);
	end component;
	
	constant iCLK_period : time := 10 ns; 
	
	signal sRST	  : std_logic := '0';
	signal sCLK	  : std_logic := '0';
	signal sTOAST : std_logic := '0';
	signal sDONE  : std_logic;
	signal sTEMP  : std_logic_vector(7 downto 0);
	signal sTIME  : std_logic_vector(5 downto 0);
	
	begin
		uut: Toster port map (
          iCLK          => sCLK,
          iRST          => sRST,
			 iTOAST		   => sTOAST,
			 oDONE		   => sDONE,
			 oTEMP		   => sTEMP,
			 oTIME		   => sTIME
		);
		
		iCLK_process: process
	begin
		sCLK <= '0';
		wait for iCLK_period / 2; -- iCLK_period je konstanta
		sCLK <= '1';
		wait for iCLK_period / 2;
	end process;

   stim_proc : process
   begin
		-- Test cases
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		sTOAST <= '1';
		wait for iCLK_period;
		sTOAST <= '0';
		
		wait for 45 * iCLK_period;
		wait for 70 * iCLK_period; -- trajanje tostiranja
		wait for 70 * iCLK_period; -- trajanje hladjenja ispod 100 stepeni
		
		sTOAST <= '1';
		wait for iCLK_period;
		sTOAST <= '0';
		
		sRESET <= '1';
		wait;
	end process;
end architecture;