library ieee;
use ieee.std_logic_1164.all;

entity FSM_game_tb is
end entity;
 
architecture Test of FSM_game_tb is
  
   signal sCLK	: std_logic := '0';
   signal sRST : std_logic := '0';
   signal sA 	: std_logic_vector(1 downto 0) := "00";
	signal sB 	: std_logic_vector(1 downto 0) := "00";
   signal sOA 	: std_logic;
	signal sOB 	: std_logic;
	
	constant iCLK_period : time := 10 ns; 
   
	component FSM_game is port ( 
		iRST  : in  std_logic;
		iCLK  : in  std_logic;
		iA	   : in  std_logic_vector(1 downto 0);
		iB	   : in  std_logic_vector(1 downto 0);
		oA  	: out std_logic;
		oB  	: out std_logic
		);
	end component;

begin

   uut: FSM_game port map (
          iCLK => sCLK,
          iRST => sRST,
			 iA	=> sA,
			 iB	=> sB,
          oA => sOA,
          oB => sOB
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
		sRST <= '1';
		wait for iCLK_period;
		sRST <= '0';
		
		-- U prvoj partiji neka pobedi igrač A bez da je iko 
		-- iskoristio specijalni potez i da su oba igrača barem
	   -- jednom postigla poen
		sB <= "01";
		wait for iCLK_period; -- B_LEAD
		sB <= "00";
		
		sA <= "01";
		wait for iCLK_period; -- DRAW
		sA <= "00";
		
		sA <= "01";
		wait for iCLK_period; -- A_LEAD
		sA <= "00";
		
		sA <= "01";
		wait for iCLK_period; -- A_WIN
		sA <= "00";
		
		-- Između partija resetovati sistem na 20 perioda takta
		sRST <= '1';
		wait for 20 * iCLK_period;
		sRST <= '0';
		
		-- U drugoj partiji neka pobedi igrač B ali
	   --	tako da su oba igrača iskoristila specijalni potez barem
	   -- jednom
		sB <= "01";
		wait for iCLK_period; -- B_LEAD
		sB <= "00";
		
		sA <= "10";
		wait for iCLK_period; -- A_LEAD
		sA <= "00";
		
		sB <= "10";
		wait for iCLK_period; -- B_LEAD
		sB <= "00";
		
		sB <= "01";
		wait for iCLK_period; -- B_WIN
		sB <= "00";
		
		-- Između partija resetovati sistem na 20 perioda takta
		sRST <= '1';
		wait for 20 * iCLK_period;
		sRST <= '0';
		wait;
   end process;
end architecture;
