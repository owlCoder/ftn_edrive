library ieee;
use ieee.std_logic_1164.all;

entity segmentA is
    port(
        iB0 : in std_logic;
        iB1 : in std_logic;
        iB2 : in std_logic;
        iB3 : in std_logic;
        oY  : out std_logic
    );
end entity;

architecture Behavioral of segmentA is
    signal sS0 : std_logic;
    signal sS1 : std_logic;
    signal sS2 : std_logic;
    signal sS3 : std_logic;
	 signal sS4 : std_logic;

    begin
        sS0 <= iB1 and not(iB0);
        sS1 <= iB2 and iB1;
        sS2 <= not(iB2) and not(iB1);
        sS3 <= not(iB3) and iB2 and iB0;														
		  sS4 <= iB3 and not(iB1) and not(iB0);

        oY <= sS0 or sS1 or sS2 or sS3 or sS4;

end architecture;