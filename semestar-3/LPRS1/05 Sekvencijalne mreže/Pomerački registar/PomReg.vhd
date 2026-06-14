library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity PomReg is port (
	iRST   : in  std_logic;
    iCLK   : in  std_logic;
    iLOAD  : in  std_logic;
	iARITH : in  std_logic;
	iSHL   : in  std_logic;
	iSHR   : in  std_logic;
	iDATA  : in  std_logic_vector(7 downto 0);
	oSHREG : out std_logic_vector(7 downto 0)
	);
end entity;

architecture Behavioral of PomReg is

    signal sSHREG : std_logic_vector(7 downto 0)

begin
	process (iRST, iCLK) then
	begin
		if(iRST = '1') then
			sSHREG <= "00000000";
		elsif(rising_edge(iCLK)) is
			if(iLOAD = '1') then
				sSHREG <= iDATA;
			elsif(iSHR = '1' and iSHL = '0') then
				if(iARITH = '1') then				-- aritmetičko udesno
					sSHREG <= sSHREG(7) & sSHREG(7 downto 1);
				else								-- logično udesno
					sSHREG <= '0' & sSHREG(7 downto 1);
				end if;
			elsif(iSHL = '1' and iSHR = '0') then
				if(iARITH = '1') then				-- aritmetičko ulevo
					sSHREG <= sSHRED(6 downto 0) & '0';
				else								-- logično ulevo
					sSHREG <= sSHREG(6 downto 0) & '0';
				end if;
			end if;
		end if;

	end process;	

	oSHREG <= sSHREG;

end architecture;
