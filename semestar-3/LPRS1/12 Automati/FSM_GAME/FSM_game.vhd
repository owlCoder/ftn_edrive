library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.ALL;

entity FSM_game is port ( 
	iRST  : in  std_logic;
	iCLK  : in  std_logic;
	iA	   : in  std_logic_vector(1 downto 0);
	iB	   : in  std_logic_vector(1 downto 0);
	oA  	: out std_logic;
	oB  	: out std_logic
	);
end entity;

architecture Behavioral of FSM_game is
	type tSTATE is(DRAW, A_LEAD, B_LEAD, A_WIN, B_WIN);
	signal sSTATE, sNEXT_STATE : tSTATE;
	signal sWIN : std_logic_vector(1 downto 0);
	
begin
	-- funkciju pamćenja stanja
	process(iCLK, iRST) begin
		if(iRST = '1') then
			sSTATE <= DRAW;
		elsif(rising_edge(iCLK)) then
			sSTATE <= sNEXT_STATE;
		end if;
	end process;
	
	-- funkcija prelaza stanja
	process(sSTATE, iA, iB) begin
		case sSTATE is
			WHEN DRAW =>
				if(iB = "01") then
					sNEXT_STATE <= B_LEAD;
				elsif(iA = "01") then
					sNEXT_STATE <= A_LEAD;
				else
					sNEXT_STATE <= DRAW;
				end if;
				
			WHEN A_LEAD =>
				if(iA = "01") then
					sNEXT_STATE <= A_WIN;
				elsif(iB = "01") then
					sNEXT_STATE <= DRAW;
				elsif(iB = "10") then
					sNEXT_STATE <= B_LEAD;
				else
					sNEXT_STATE <= A_LEAD;
				end if;
				
			WHEN B_LEAD =>
				if(iA = "01") then
					sNEXT_STATE <= DRAW;
				elsif(iB = "01") then
					sNEXT_STATE <= B_WIN;
				elsif(iA = "10") then
					sNEXT_STATE <= A_LEAD;
				else
					sNEXT_STATE <= B_LEAD;
				end if;
			
			WHEN A_WIN => sNEXT_STATE <= A_WIN;
			
			WHEN B_WIN => sNEXT_STATE <= B_WIN;
			
			WHEN OTHERS => sNEXT_STATE <= DRAW;
		end case;		
	end process;
	
	-- funkcija izlaza automata
	sWIN <= "01" WHEN sSTATE = A_WIN ELSE
			  "10" WHEN sSTATE = B_WIN ELSE
			  "00";
			  
	-- DEKODER
	oA   <= '1' WHEN sWIN = "01" ELSE '0';
	oB   <= '1' WHEN sWIN = "10" ELSE '0';

end Behavioral;
