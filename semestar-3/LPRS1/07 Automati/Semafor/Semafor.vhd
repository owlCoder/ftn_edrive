library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Semafor is
    port ( 	iCLK    : in  std_logic;
				iRST    : in  std_logic;
				iOK     : in  std_logic;
				iHAZ    : in  std_logic;
				oRED    : out std_logic;
				oYELLOW : out std_logic;
				oGREEN  : out std_logic);
end Semafor;

architecture Behavioral of Semafor is
	type tSTATE is (IDLE, RED, RED_YELLOW, GREEN, YELLOW, HAZARD);
	signal sSTATE, SNEXT_STATE : tSTATE;
	
	signal sCNT : std_logic_vector(2 downto 0);
	signal sTC  : std_logic;

begin
	-- brojac pola us (broji po modulu 5)
	process(iCLK, iRST) begin
		if(iRST = '1') then
			sCNT <= "000";
		elsif(rising_edge(iCLK)) then
			if(sCNT = 4) then
				sCNT <= "000";
			else
				sCNT <= sCNT + 1;
			end if;
		end if;
	end process;
	
	sTC <= '1' WHEN sCNT = 4 else
			 '0';
	
	-- registar za pamcenje stanja automata
	process(iCLK, iRST) begin
		if(iRST = '1') then
			sSTATE <= IDLE;
		elsif(rising_edge(iCLK)) then
			if(sTC = '1') then
				sSTATE <= sNEXT_STATE;
			end if;
		end if;
	end process;
	
	-- funkcija prelaya stanja
	process(sSTATE, iOK, iHAZ) begin
		case sSTATE is
			WHEN IDLE  		 =>
				if(iOK = '1') then
					sNEXT_STATE <= RED;
				else
					sNEXT_STATE <= IDLE;
				end if;
			WHEN RED	 		 =>
				if(iHAZ = '1') then
					sNEXT_STATE <= HAZARD;
				else
					sNEXT_STATE <= RED_YELLOW;
				end if;
			WHEN RED_YELLOW =>
				if(iHAZ = '1') then
					sNEXT_STATE <= HAZARD;
				else
					sNEXT_STATE <= GREEN;
				end if;
			WHEN GREEN 		 =>
				if(iHAZ = '1') then
					sNEXT_STATE <= HAZARD;
				else
					sNEXT_STATE <= YELLOW;
				end if;
			WHEN YELLOW 	 =>
				if(iHAZ = '1') then
					sNEXT_STATE <= HAZARD;
				else
					sNEXT_STATE <= RED;
				end if;
			WHEN HAZARD 	 =>
				if(iOK = '1') then
					sNEXT_STATE <= RED;
				else
					sNEXT_STATE <= HAZARD;
				end if;
			WHEN OTHERS 	 =>
				sNEXT_STATE <= IDLE;
		end case;
	end process;
	
	-- funkcija izlaza
	oRED <= '1' WHEN sSTATE = RED OR sSTATE = RED_YELLOW OR sSTATE = HAZARD else '0';
	oYELLOW <= '1' WHEN sSTATE = YELLOW OR sSTATE = RED_YELLOW OR sSTATE = HAZARD else '0';
	oGREEN <= '1' WHEN sSTATE = GREEN OR sSTATE = HAZARD else '0';

end Behavioral;