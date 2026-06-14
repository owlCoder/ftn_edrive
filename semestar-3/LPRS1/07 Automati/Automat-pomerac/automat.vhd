library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity automat is
    Port ( 	iCLK    	: in  std_logic;
				iRST    	: in  std_logic;
				iSTOP   	: in  std_logic;
				iRL	   : in  std_logic;
				iRR		: in  std_logic;
				iSRA		: in 	std_logic;
				oDATA		: out std_logic_vector(7 downto 0)
		);
end automat;

architecture Behavioral of automat is
	type tSTATE is (IDLE, ROT_LEFT, ROT_RIGHT, SHIFT_RIGHT_ARITH);
	signal sSTATE, sNEXT_STATE : tSTATE;
	
	signal sDATA, SNEXT_DATA : std_logic_vector(7 downto 0);
begin
	-- registar za pamcenje stanja automata
	process(iCLK, iRST) begin
		if(iRST = '1') then
			sSTATE <= IDLE;
		elsif(rising_edge(iCLK)) then
			sSTATE <= sNEXT_STATE;
		end if;
	end process;
	
	-- funkcija prelaza stanja automata
	process(sSTATE, iRL, iRR, iSRA, iSTOP, sNEXT_STATE) begin
		case sSTATE is
			WHEN IDLE 					=>
				if(iRL = '1') then
					sNEXT_STATE <= ROT_LEFT;
				elsif(iRR = '1') then
					sNEXT_STATE <= ROT_RIGHT;
				elsif(iSRA = '1') then
					sNEXT_STATE <= SHIFT_RIGHT_ARITH;
				else
					sNEXT_STATE <= IDLE;
				end if;
			WHEN ROT_LEFT 				=>
				if(iSTOP = '1') then
					sNEXT_STATE <= IDLE;
				else
					sNEXT_STATE <= ROT_LEFT;
				end if;
			WHEN ROT_RIGHT 			=>
				if(iSTOP = '1') then
					sNEXT_STATE <= IDLE;
				else
					sNEXT_STATE <= ROT_RIGHT;
				end if;
			WHEN SHIFT_RIGHT_ARITH  =>
				if(iSTOP = '1') then
					sNEXT_STATE <= IDLE;
				else
					sNEXT_STATE <= SHIFT_RIGHT_ARITH;
				end if;
			WHEN OTHERS 				=> 
				sNEXT_STATE <= IDLE;
		end case;
	end process;
	
	-- registar za izlazni podatak
		process(iCLK, iRST) begin
		if(iRST = '1') then
			sDATA <= "00000000";
		elsif(rising_edge(iCLK)) then
			sDATA <= sNEXT_DATA;
		end if;
	end process;
	
	-- funkcija izlaza
	process(sSTATE, sDATA) begin
		case sSTATE is
			WHEN IDLE 					=> sNEXT_DATA <= "00110011";
			WHEN ROT_LEFT 				=> sNEXT_DATA <= sDATA(6 downto 0) & sDATA(7);
			WHEN ROT_RIGHT 			=>	sNEXT_DATA <= sDATA(0) & sDATA(7 downto 1);
			WHEN SHIFT_RIGHT_ARITH  => sNEXT_DATA <= sDATA(7) & sDATA(7 downto 1);
			WHEN OTHERS 				=> sNEXT_DATA <= "00000000";
		end case;
	end process;
	
	oDATA <= sDATA;
end architecture;