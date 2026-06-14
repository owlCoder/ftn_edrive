library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity AutomatskaGaraznaKapija is
	port(
		iCLK		: in  std_logic;
		iRST		: in  std_logic;
		iCAR		: in  std_logic_vector(2 downto 0);
		oTOTAL   : out std_logic_vector(7 downto 0);
		oOPEN		: out std_logic;
		oWARNING : out std_logic
	);
end entity;

architecture arch of AutomatskaGaraznaKapija is
	type   tSTATE is (IDLE, FREE_ENTRY, WARNING, OPEN_MEMBER, OPEN_GUEST);
	signal sSTATE, sNEXT_STATE : tSTATE;
	
	signal sCNT    : std_logic_vector(3 downto 0);
	signal sCNT_T  : std_logic_vector(7 downto 0);
	signal sRESET  : std_logic;
	signal sENABLE : std_logic;
	signal sTC		: std_logic;

begin
	-- COUNTER 1
   --	MOD 10 (signal asinhronog reseta, aktivan na visokom nivou)
	process (iCLK, sRESET) begin
		if(sRESET = '1') then
			sCNT <= "0000";
		elsif(rising_edge(iCLK)) then
			if(sCNT < 9) then
				sCNT <= sCNT + 1;
			elsif(sCNT >= 9) then
				sCNT <= "0000";
			end if;
		end if;
	end process;
	
	-- SIGNAL KRAJA BROJANJA
	sTC <= '1' WHEN sCNT = 9 ELSE '0';
	
	-- REGISTAR PAMCENJA STANJA AUTOMATA
	process(iCLK, iRST) begin
		if(iRST = '1') then
			sSTATE <= IDLE;
		elsif(rising_edge(iCLK)) then
			sSTATE <= sNEXT_STATE;
		end if;
	end process;

	-- FUNKCIJA PRELAZA STANJA
	process (sSTATE, sCNT, iCAR) begin
		case sSTATE is
			WHEN IDLE => 
				if(iCAR = "100") then
					sNEXT_STATE <= WARNING;
				elsif(iCAR = "010") then
					sNEXT_STATE <= OPEN_MEMBER;
				else
					sNEXT_STATE <= IDLE;
				end if;
			
			WHEN WARNING =>
					sNEXT_STATE <= IDLE;
					
			WHEN OPEN_MEMBER => 
					sNEXT_STATE <= FREE_ENTRY;
					
			WHEN FREE_ENTRY =>
				if(sCNT = 9) then -- moze i sTC = '1'
					sNEXT_STATE <= IDLE;
				elsif(iCAR = "100") then
					sNEXT_STATE <= OPEN_GUEST;
				else
					sNEXT_STATE <= OPEN_MEMBER;
				end if;
				
			WHEN OPEN_GUEST =>
				sNEXT_STATE <= IDLE;
			
			WHEN OTHERS => sNEXT_STATE <= IDLE;
		end case;
	end process;
	
	-- funkcija izlaza
	sRESET   <= '0' WHEN sSTATE  = FREE_ENTRY                          ELSE '1';
	sENABLE  <= '1' WHEN (sSTATE = OPEN_MEMBER OR sSTATE = OPEN_GUEST) ELSE '0';
	oWARNING <= '1' WHEN sSTATE  = WARNING                             ELSE '0';
	
	oOPEN    <= sENABLE;
	oTOTAL   <= sCNT_T;
	
	-- counter 2
	process(iCLK, iRST) begin
		if(iRST = '1') then
			sCNT_T <= "00000000";
		elsif(rising_edge(iCLK)) then
			if(sENABLE = '1') then
				sCNT_T <= sCNT_T + 1;
			end if;
		end if;
	end process;
end architecture;