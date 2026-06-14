library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity Brojac is port ( 
	iRST  : in  std_logic;
	iCLK  : in  std_logic;
	iEN   : in  std_logic;
	oCNT  : out std_logic_vector(7 downto 0)
	);
end entity;

architecture Behavioral of Brojac is

	signal sCNT : std_logic_vector(7 downto 0);
	
begin
	
	process (iRST, iCLK) begin						-- asinhroni
		if(iRST = '1') then
			sCNT <= "00000000";
		elsif (iCLK'event and iCLK = '1') then		-- rastuća ivica
			if(iEN = '1') then
				if(sCNT = 82) then					-- po modulu 83
					sCNT <= "00000000";
				else
					sCNT <= sCNT + 1;
				end if;
			end if;
		end if;
	end process;
	
end Behavioral;
