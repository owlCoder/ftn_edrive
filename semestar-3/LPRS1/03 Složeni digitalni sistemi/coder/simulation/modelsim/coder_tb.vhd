library ieee;
use ieee.std_logic_1164.all;

entity coder_tb is
end entity;

architecture Behavioral of coder_tb is
	
	signal sX 		    : std_logic_vector(7 downto 0);
	signal sY_uslovna  : std_logic_vector(2 downto 0);
	signal sY_if       : std_logic_vector(2 downto 0);
	signal sY_case     : std_logic_vector(2 downto 0);

	component coder is
		port(
			iX			  : in std_logic_vector(7 downto 0);
			oY_uslovna : out std_logic_vector(2 downto 0);
			oY_if		  : out std_logic_vector(2 downto 0);
			oY_case	  : out std_logic_vector(2 downto 0)
		);
	end component;
	
begin

	uut : coder port map(
		iX => sX,
		oY_uslovna => sY_uslovna,
		oY_case => sY_case,
		oY_if => sY_if
	);
	
	stimulus: process
	begin
		sX <= "01000000"; -- 110
		wait for 100 ns;
		
		sX <= "00010000"; -- 100
		wait for 100 ns;
		
		sX <= "10000000"; -- 111
		wait for 100 ns;
		
		sX <= "00000001"; -- 000
		wait;
	end process stimulus;

end architecture;