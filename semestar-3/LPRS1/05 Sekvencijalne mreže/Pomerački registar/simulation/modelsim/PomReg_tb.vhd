library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PomReg_tb is
end entity;

architecture Test of PomReg_tb is

	signal sRST   :   std_logic := '0';
   signal sCLK   :   std_logic := '0';
   signal sLOAD  :   std_logic := '0';
	signal sARITH :   std_logic := '0';
	signal sSHL   :   std_logic := '0';
	signal sSHR   :   std_logic := '0';
	signal sDATA  :   std_logic_vector(7 downto 0) := "00000000";
	signal sSHREG :   std_logic_vector(7 downto 0);
	
	constant iCLK_PERIOD : time := 10 ns;

component PomReg 
   Port ( iRST   : in  std_logic;
          iCLK   : in  std_logic;
          iLOAD  : in  std_logic;
			 iARITH : in  std_logic;
			 iSHL   : in  std_logic;
			 iSHR   : in  std_logic;
			 iDATA  : in  std_logic_vector(7 downto 0);
			 oSHREG : out std_logic_vector(7 downto 0)
			 );
end component;
	
begin

	uut : PomReg port map (
		iRST => sRST,
		iCLK => sCLK,
		iLOAD => sLOAD,
		iARITH  => sARITH,
		iSHL => sSHL,
		iSHR => sSHR,
		iDATA => sDATA,
		oSHREG => sSHREG
		);

	--takt process
	clk_proc : process
	begin
		sCLK <= '1';
		wait for iCLK_PERIOD / 2;
		sCLK <= '0';
		wait for iCLK_PERIOD / 2;
	end process;
	
   stim_proc: process
   begin
		
		sRST <= '1';
		wait for 3.75 * iCLK_period;
		sRST <= '0';

		-- postavljamo vrednost na sDATA
		sDATA <= "00000001";
		wait for 1 * iCLK_period;

		-- učitaj vrednost
		sLOAD <= '1';
		wait for 2 * iCLK_period;

		-- logički pomeramo ulevo do najvišeg bita
		sLOAD <= '0';
		sSHL <= '1';
		sSHR <= '0';
		sARITH <= '0';
		wait for 7 * iCLK_period;

		-- logički pomeramo udesno do najnižeg bita
		sLOAD <= '0';
		sSHL <= '0';
		sSHR <= '1';
		sARITH <= '0';
		wait for 7 * iCLK_period;
		
		-- aritmetički pomeramo ulevo do najvišeg bita
		sLOAD <= '0';
		sSHL <= '1';
		sSHR <= '0';
		sARITH <= '1';
		wait for 7 * iCLK_period;
		
		-- aritmetički pomeramo udesno do najnižeg bita
		sLOAD <= '0';
		sSHL <= '0';
		sSHR <= '1';
		sARITH <= '1';
		wait for 7 * iCLK_period;

		-- reset 3 periode
		sRST <= '1';
		wait for 2 * iCLK_period;
		sRST <= '0';

		sLOAD <= '1';
				
		wait;
   end process stim_proc;

end architecture;