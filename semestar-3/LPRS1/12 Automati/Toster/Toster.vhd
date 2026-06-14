library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Toster is port(
	iRST 	 	     : in  std_logic;
	iCLK  		  : in  std_logic;
	iTOAST		  : in  std_logic;
	oDONE			  : out std_logic;
	oTEMP			  : out std_logic_vector(7 downto 0);
	oTIME		     : out std_logic_vector(5 downto 0)
);
end entity;

architecture arch of Toster is
	type tSTATE is (IDLE, WARMUP, TOAST, COOLDOWN);
	signal sSTATE, sNEXT_STATE : tSTATE;
		
	signal sCNT   : std_logic_vector(3 downto 0) := "0000";
	signal sCNT2  : std_logic_vector(7 downto 0) := "00000000";
	signal sTIMER : std_logic_vector(5 downto 0) := "111100";
	signal sTC1	  : std_logic;
	signal sTC2	  : std_logic;
	signal sHEAT  : std_logic;
	signal sEN    : std_logic;
	signal sTEMP  : std_logic_vector(7 downto 0) := "00000000";
	
	begin
		
	-- BROJAC PO NODULU - SIHRONI RESET, AKTIVAN NA VISOKOM NIVOU
	process(iCLK) begin
		if(rising_edge(iCLK)) then
			if(iRST = '1') then
				sCNT <= "0000";
			else
				if(sCNT < 4) then
					sCNT <= sCNT + 1;
				elsif(sCNT >= 4) then
					sCNT <= "0000";
				end if;
			end if;
		end if;
	end process;
	
	sTC1 <= '1' WHEN sCNT = 4  ELSE '0';
	
	-- AUTOMAT: FUNKCIJA PAMCENJA STANJA
	process(iCLK) begin
		if(rising_edge(iCLK)) then
			if(iRST = '1') then
				sSTATE <= IDLE;
			else
				sSTATE <= sNEXT_STATE;
			end if;
		end if;
	end process;
	
	-- AUTOMAT: FUNKCIJA PRELAZA STANJA
	process(sSTATE, sCNT, sTEMP, iTOAST) begin
		case sSTATE is
			WHEN IDLE =>
				if(iTOAST = '1') then
					sNEXT_STATE <= WARMUP;
				else
					sNEXT_STATE <= IDLE;
				end if;
				
			WHEN WARMUP =>
				if(sTEMP > 100) then
					sNEXT_STATE <= TOAST;
				else
					sNEXT_STATE <= WARMUP;
				end if;
				
			WHEN TOAST =>
				if(sTC2 = '1') then
					sNEXT_STATE <= COOLDOWN;
				else
					sNEXT_STATE <= TOAST;
				end if;
			
			WHEN COOLDOWN =>
				if(iTOAST = '1' AND sTEMP < 100) then
					sNEXT_STATE <= WARMUP;
				elsif(iTOAST = '1' AND sTEMP < 200) then
					sNEXT_STATE <= TOAST;
				else
					sNEXT_STATE <= COOLDOWN;
				end if;
				
			WHEN OTHERS => sNEXT_STATE <= IDLE;
		end case;
	end process;
	
	-- AUTOMAT: FUNKCIJA IZLAZA
	oDONE <= '1' WHEN  sSTATE = COOLDOWN ELSE '0';
	sHEAT <= '1' WHEN (sSTATE = WARMUP OR sSTATE = TOAST) ELSE '0';
	sEN   <= '1' WHEN  sSTATE = TOAST ELSE '0';
	
	-- SENZOR ZA TEMPERATURU
	process(iCLK) begin
		if(rising_edge(iCLK)) then
			if(iRST = '1') then
				sCNT2 <= "00010100"; -- 20 = 16 + 4
			else
				if(sTC1 = '1') then
					if(sHEAT = '1') then
						if(sTEMP < 250) then
							sTEMP <= sTEMP + 10;
						end if;
					else
						if(sTEMP > 20) then
							sTEMP <= sTEMP - 10;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	-- TAJMER ZA TOSTIRANJE
	process(iCLK) begin
		if(rising_edge(iCLK)) then
			if(iRST = '1') then
				sTIMER <= "111100";
			else
				if(sEN = '1') then
					sTIMER <= sTIMER - 1;
				end if;
			end if;
		end if;
	end process;
	
	sTC2 <= '1' WHEN sTIMER = 0 ELSE '0';
	oTIME <= sTIMER;
	oTEMP <= sTEMP;
	
end architecture;