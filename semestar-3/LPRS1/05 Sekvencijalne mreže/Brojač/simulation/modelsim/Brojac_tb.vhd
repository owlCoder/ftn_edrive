library ieee;
use ieee.std_logic_1164.all;

entity Brojac_tb is
end entity;
 
architecture Test of Brojac_tb is
  
   signal sCLK : std_logic := '0';
   signal sRST : std_logic := '0';
   signal sEN : std_logic := '0';
   signal sCNT : std_logic_vector(7 downto 0);
	
	constant iCLK_PERIOD : time := 10 ns;
	
   component Brojac is port (   
		iRST  : in  std_logic;
		iCLK  : in  std_logic;
		iEN   : in  std_logic;
		oCNT  : out std_logic_vector(7 downto 0)
	);
   end component;

begin

   uut: Brojac port map (
          iCLK => sCLK,
          iRST => sRST,
          iEN => sEN,
          oCNT => sCNT
        );
	
	--takt process
	clk_proc : process
	begin
		sCLK <= '1';
		wait for iCLK_PERIOD / 2;
		sCLK <= '0';
		wait for iCLK_PERIOD / 2;
	end process;
	
   stim_proc : process
   begin
		sRST <= '1';						-- pomeraj ulaznog signala (asinhoro)
		wait for 3.25 * iCLK_period;
		sRST <= '0';

		sEN <= '1';							-- 15
		wait for 15 * iCLK_period;

		sEN <= '0';
		wait for 5 * iCLK_period;			-- ovo ignorišeš jer nula

		sEN <= '1';							-- plus 35 jednako 50
		wait for 35 * iCLK_period;

		sRST <= '1';
		wait for 3 * iCLK_period;
		sRST <= '0';

		wait;
   end process;
end architecture;
