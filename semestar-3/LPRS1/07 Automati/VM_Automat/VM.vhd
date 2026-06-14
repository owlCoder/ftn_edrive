library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity VM is port ( 
		iRST 	 	     : in  std_logic;
		iCLK  		  : in  std_logic;
		i_run			  : in  std_logic;
		i_water		  : in  std_logic;
		i_detergent	  : in  std_logic;
		i_door_open   : in  std_logic;
		i_door_closed : in  std_logic;
		i_hw			  : in  std_logic_vector(1 downto 0);
		i_temp_ok     : in  std_logic;
		i_wl_max      : in  std_logic;
		i_wl_min      : in  std_logic;
		o_lock        : out std_logic;
		o_valve_in    : out std_logic;
		o_valve_out   : out std_logic;
		o_heater      : out std_logic;
		o_motor_run   : out std_logic_vector(1 downto 0);
		o_pump_out    : out std_logic
	);
end entity;

architecture Behavioral of VM is
	type tSTATE is (S_IDLE, S_WATER_IN, S_COLD_W, S_WARM_W, 
					    S_HOT_W, S_WASHING, S_WATER_OUT, S_CENTRIFUGA, S_WAIT);
	signal sSTATE, sNEXT_STATE : tSTATE;
	
	-- SIGNALI BROJACA
	signal s_w_timer_elapsed	: std_logic;
	signal s_c_timer_elapsed	: std_logic;
	signal s_w_timer		      : std_logic_vector(5 downto 0); -- 50 = 110010
	signal s_c_timer   			: std_logic_vector(4 downto 0); -- 20 =  10100
	signal s_clr_w_c				: std_logic;
	signal s_w_init				: std_logic;
	signal s_c_init				: std_logic;
	
	
	begin

		-- REGISTAR PAMCENJA STANJA AUTOMATA
		process(iCLK, iRST) begin
			if(iRST = '1') then
				sSTATE <= S_IDLE;
			elsif(rising_edge(iCLK)) then
				sSTATE <= sNEXT_STATE;
			end if;
		end process;
		
		-- FUNKCIJA PRELAZA STANJA AUTOMATA
		process(sSTATE, i_run, i_water, i_detergent, 
							           i_door_closed, i_wl_min, i_wl_max, 
										  i_hw, i_temp_ok, i_door_open,
										  s_w_timer_elapsed, s_c_timer_elapsed) begin
			case sSTATE is
				WHEN S_IDLE =>
					if(i_run = '1' AND i_water = '1' AND
				   	i_detergent = '1' AND i_door_closed = '1') then
						sNEXT_STATE <= S_WATER_IN;
					else
						sNEXT_STATE <= S_IDLE;
					end if;
					
					WHEN S_WATER_IN =>
						if(i_wl_max = '1' AND i_hw = "00") then
							sNEXT_STATE <= S_COLD_W;
						elsif(i_wl_max = '1' AND i_hw = "01") then
							sNEXT_STATE <= S_WARM_W;
						elsif(i_wl_max = '1' AND i_hw = "10") then
							sNEXT_STATE <= S_HOT_W;
						else
							sNEXT_STATE <= S_WATER_IN;
						end if;
						
						WHEN S_COLD_W =>
							if(i_temp_ok = '1') then
								sNEXT_STATE <= S_WASHING;
							else
								sNEXT_STATE <= S_COLD_W;
							end if;
							
						WHEN S_WARM_W =>
							if(i_temp_ok = '1') then
								sNEXT_STATE <= S_WASHING;
							else
								sNEXT_STATE <= S_WARM_W;
							end if;
							
						WHEN S_HOT_W =>
							if(i_temp_ok = '1') then
								sNEXT_STATE <= S_WASHING;
							else
								sNEXT_STATE <= S_HOT_W;
							end if;
							
						WHEN S_WASHING =>
							if(s_w_timer_elapsed = '1') then
								sNEXT_STATE <= S_WATER_OUT;
							else
								sNEXT_STATE <= S_WASHING;
							end if;
							
						WHEN S_WATER_OUT =>
							if(i_wl_min = '1') then
								sNEXT_STATE <= S_CENTRIFUGA;
							else
								sNEXT_STATE <= S_WATER_OUT;
							end if;
							
						WHEN S_CENTRIFUGA =>
							if(s_c_timer_elapsed = '1') then
								sNEXT_STATE <= S_WAIT;
							else
								sNEXT_STATE <= S_CENTRIFUGA;
							end if;
							
						WHEN S_WAIT =>
							if(i_door_open = '1') then
								sNEXT_STATE <= S_IDLE;
							else
								sNEXT_STATE <= S_WAIT;
							end if;
					
					WHEN OTHERS => sNEXT_STATE <= S_IDLE;
			end case;
		end process;
		
		-- FUNKCIJA IZLAZA AUTOMATA
		o_lock      <= '0'  WHEN (sSTATE = S_IDLE OR sSTATE = S_WAIT) ELSE '1';
		o_valve_in  <= '1'  WHEN  sSTATE = S_WATER_IN ELSE '0';
		o_heater    <= '1'  WHEN (sSTATE = S_WARM_W OR sSTATE = S_HOT_W) ELSE '0';
		o_motor_run <= "01" WHEN  sSTATE = S_WASHING ELSE
							"10" WHEN  sSTATE = S_CENTRIFUGA ELSE
							"00";
		o_valve_out <= '1'  WHEN (sSTATE = S_WATER_OUT OR sSTATE = S_CENTRIFUGA) ELSE '0';
		o_pump_out  <= '1'  WHEN (sSTATE = S_WATER_OUT OR sSTATE = S_CENTRIFUGA) ELSE '0';
		s_w_init    <= '1'  WHEN sSTATE = S_WASHING ELSE '0';
		s_c_init    <= '1'  WHEN sSTATE = S_CENTRIFUGA ELSE '0';
		s_clr_w_c   <= '1'  WHEN sSTATE = S_IDLE ELSE '0';
		
   	-- BROJAC W_TIMER [50, 0]
		process(iCLK, iRST) begin
			if(iRST = '1') then
				s_w_timer <= "110010";  	 -- 50
			elsif(rising_edge(iCLK)) then
				if(s_clr_w_c = '1') then
					s_w_timer <= "110010"; 	 -- 50
				else
					if(s_w_init = '1') then
						if(s_w_timer <= 0) then
							s_w_timer <= "110010"; 	 -- 50
						elsif(s_w_timer > 0) then
							s_w_timer <= s_w_timer - 1;
						end if;
					else
						s_w_timer <= "110010"; 	 -- 50
					end if;
				end if;
			end if;
		end process;
		
		-- KRAJ BROJANJA BROJACA W
		s_w_timer_elapsed <= '1' WHEN s_w_timer = 0 ELSE '0';
		
		-- BROJAC C_TIMER [20, 0]
		process(iCLK, iRST) begin
			if(iRST = '1') then
				s_c_timer <= "10100";  	-- 20
			elsif(rising_edge(iCLK)) then
				if(s_clr_w_c = '1') then
					s_c_timer <= "10100"; -- 20
				else
					if(s_c_init = '1') then
						if(s_c_timer <= 0) then
							s_c_timer <= "10100"; -- 20
						elsif(s_c_timer > 0) then
							s_c_timer <= s_c_timer - 1;
						end if;
					else
						s_c_timer <= "10100"; -- 20
					end if;
				end if;
			end if;
		end process;
		
		-- KRAJ BROJANJA BROJACA C
		s_c_timer_elapsed <= '1' WHEN s_c_timer = 0 ELSE '0';
		
end architecture;