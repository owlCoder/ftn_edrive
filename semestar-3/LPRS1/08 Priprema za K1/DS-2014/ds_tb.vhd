library ieee;
use ieee.std_logic_1164.all;

entity ds_tb is 
end entity;

architecture beh of ds_tb is
	 signal sA      :   std_logic_vector(3 downto 0);
	 signal	  sB      :   std_logic_vector(3 downto 0);
	signal  sRESULT :  std_logic_vector(7 downto 0);

	component ds is port(
			  iA      : in  std_logic_vector(3 downto 0);
			  iB      : in  std_logic_vector(3 downto 0);
			  oRESULT : out std_logic_vector(7 downto 0)
		 );
	end component;
	
	begin
	
	uut : ds port map(
		iA => sA,
		iB => sB,
		oRESULT => sRESULT
	);
	
	stim_p : process begin
			-- 2 * 0
			sA <= "0010";
			sB <= "0000";
			wait for 100 ns;
			
			-- 5 * 1
			sA <= "0101";
			sB <= "0001";
			wait for 100 ns;
			
			-- 12 na izlazu
			sA <= "0101";
			sB <= "1100";
			wait for 100 ns;
			
		wait;
	end process;
	
end beh;