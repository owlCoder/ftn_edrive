library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity AutomatskaGaraznaKapija_tb is
end AutomatskaGaraznaKapija_tb;

architecture beh of AutomatskaGaraznaKapija_tb is
	component AutomatskaGaraznaKapija
		port(
			iCLK		: in  std_logic;
			iRST		: in  std_logic;
			iCAR		: in  std_logic_vector(2 downto 0);
			oTOTAL   : out std_logic_vector(7 downto 0);
			oOPEN		: out std_logic;
			oWARNING : out std_logic
		);
	end component;
	
	signal iCLK     : std_logic := '0';
   signal iRST     : std_logic := '0';
	signal iCAR     : std_logic_vector(2 downto 0) := "000";
	
	signal oTOTAL   : std_logic_vector(7 downto 0);
	signal oOPEN    : std_logic;
	signal oWARNING : std_logic;
	
	constant iCLK_period : time := 10 ns;

begin
	uut : AutomatskaGaraznaKapija port map (
		 iCLK     => iCLK,
       iRST     => iRST,
		 iCAR     => iCAR,
		 oTOTAL   => oTOTAL,
		 oOPEN    => oOPEN,
		 oWARNING => oWARNING
	);
	
	iCLK_process :process
   begin
		iCLK <= '0';
		wait for iCLK_period / 2;
		iCLK <= '1';
		wait for iCLK_period / 2;
   end process;
 
   stim_proc : process
		begin
			-- Test cases
			iRST <= '1';
			wait for iCLK_period;
			iRST <= '0';
			
			iCAR <= "100"; -- ceka gost
			wait for 5  * iCLK_period;
			
			iCAR <= "001"; -- nema nikoga da ceka
			wait for 10 * iCLK_period;
			
			iCAR <= "010"; -- ceka zaposleni
			wait for 1  * iCLK_period;
			
			iCAR <= "001"; -- nema nikoga da ceka
			wait for 10 * iCLK_period;
			
			iCAR <= "010"; -- ceka zaposleni
			wait for 1  * iCLK_period;
			
			wait for 4 * iCLK_period;
			
			iCAR <= "100"; -- ceka gost
			wait for 1  * iCLK_period;
			
			iCAR <= "010"; -- ceka zaposleni
			wait for 1  * iCLK_period;
			
			iCAR <= "001"; -- nema nikoga da ceka
			wait for 22 * iCLK_period;
			
			iCAR <= "100"; -- ceka gost
			wait for 1  * iCLK_period;
			
			iCAR <= "100"; -- ceka gost
			wait for 1  * iCLK_period;
			
			iRST <= '1';
      wait;
   end process;
	
end architecture;