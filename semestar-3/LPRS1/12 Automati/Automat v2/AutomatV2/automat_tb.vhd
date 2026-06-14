library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity automat_tb is
end entity;

architecture beh of automat_tb is
	component Automat
		port(
			iCLK		  : in  std_logic;
			inRST		  : in  std_logic;
			iINPUT	  : in  std_logic_vector(15 downto 0);
			iPRICE	  : in  std_logic_vector(15 downto 0);
			oPAID		  : out std_logic;
			oCHANGE	  : out std_logic_vector(15 downto 0);
			oBAD_INPUT : out std_logic
		);
	end component;
	
	-- ULAZI
	signal sCLK    : std_logic := '0';
	signal sRST    : std_logic := '1';
	signal sINPUT  : std_logic_vector(15 downto 0) := "0000000000000000";
	signal sPRICE  : std_logic_vector(15 downto 0) := "0000000000000000";
	
	-- IZLAZI
	signal sPAID   		: std_logic;
	signal sCHANGE 		: std_logic_vector(15 downto 0);
	signal sBAD_INPUT		: std_logic;
	
	constant iCLK_period : time := 10 ns;
	
begin
	uut: Automat port map(
		iCLK 		  => sCLK,
		inRST		  => sRST,
		iINPUT	  => sINPUT,
		iPRICE	  => sPRICE,
		oPAID		  => sPAID,
		oCHANGE    => sCHANGE,
		oBAD_INPUT => sBAD_INPUT
	);
	
   iCLK_process :process
   begin
		sCLK <= '0';
		wait for iCLK_period/2;
		sCLK <= '1';
		wait for iCLK_period/2;
   end process;
 
   stim_proc: process
	begin
		-- Test cases
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		
		-- jeftiniji od 500
		sINPUT <= "0000000100101100";  -- 300 rsd
		sPRICE <= "0000000000000010";   -- 2 rsd
		wait for 10 * iCLK_period; 
		
		-- reset system
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		
		-- jednak 500
		sINPUT <= "0000000111110100";  -- 500 rsd
		sPRICE <= "0000000111110100";  -- 500 rsd
		wait for 10 * iCLK_period; 
		
		-- reset system
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		
		-- jeftiniji od 500
		sINPUT <= "0000000001110100";  -- 116 rsd
		sPRICE <= "0000000111110100";  -- 500 rsd
		wait for 10 * iCLK_period; 
		
		-- reset system
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		
		-- skuplji od 500
		sINPUT <= "0000000001110100";  -- 116 rsd
		sPRICE <= "0000000111110110";  -- 502 rsd
		wait for 10 * iCLK_period; 
		
		-- reset system
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		
		-- skuplji od 500
		sINPUT <= "0000000001110100";  -- 116 rsd
		sPRICE <= "0000000111110111";  -- 503 rsd
		wait for 10 * iCLK_period; 
		
		-- reset system
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		
		-- bad input
		sINPUT <= "0000000111110111";  -- 116 rsd
		sPRICE <= "0000000111110111";  -- 503 rsd
		wait for 10 * iCLK_period; 
		
		-- reset system
		sRST <= '0';
		wait for iCLK_period;
		sRST <= '1';
		wait;
	end process;
end architecture;