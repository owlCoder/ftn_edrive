library ieee;
use ieee.std_logic_1164.all;

entity VM_tb is 
end entity;

architecture Test of VM_tb is
	 component VM is port ( 
			iRST 	 	     : in  std_logic;
			iCLK  		  : in  std_logic;
			i_run			  : in  std_logic;
			i_water		  : in  std_logic;
			i_detergent	  : in  std_logic;
			i_door_open	  : in  std_logic;
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
	end component;
	
	constant iCLK_period : time := 10 ns; 
	
	signal sRST				:     std_logic := '0';
	signal sCLK				:     std_logic := '0';
	signal s_run			:     std_logic := '0';
	signal s_water		   :     std_logic := '0';
	signal s_detergent	:     std_logic := '0';
	signal s_door_open   :     std_logic := '0';
	signal s_door_closed :     std_logic := '0';
	signal s_hw			   :     std_logic_vector(1 downto 0) := "00";
	signal s_temp_ok     :     std_logic := '0';
	signal s_wl_max      :     std_logic := '0';
	signal s_wl_min      :     std_logic := '0';
	signal s_lock        :     std_logic;
	signal s_valve_in    :     std_logic;
	signal s_valve_out   :     std_logic;
	signal s_heater      :     std_logic;
	signal s_motor_run   :     std_logic_vector(1 downto 0);
	signal s_pump_out    :     std_logic;
	
	begin
	
	uut: VM port map (
          iCLK          => sCLK,
          iRST          => sRST,
			 i_run         => s_run,
			 i_water       => s_water,
			 i_detergent   => s_detergent,
			 i_door_open   => s_door_open,
			 i_door_closed => s_door_closed,
			 i_hw          => s_hw,
			 i_temp_ok     => s_temp_ok,
			 i_wl_max      => s_wl_max,
			 i_wl_min      => s_wl_min,
			 o_lock        => s_lock,
			 o_valve_in    => s_valve_in,
			 o_valve_out   => s_valve_out,
			 o_heater      => s_heater,
			 o_motor_run   => s_motor_run,
			 o_pump_out    => s_pump_out
        );
  
	iCLK_process: process
	begin
		sCLK <= '0';
		wait for iCLK_period / 2; -- iCLK_period je konstanta
		sCLK <= '1';
		wait for iCLK_period / 2;
	end process;

   stim_proc : process
   begin		
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		s_run <= '1';
		s_water <= '1';
		s_detergent <= '1';
		s_door_closed <= '1';
		wait for iCLK_period;
		
		-- prelazi u stanje S_WATER IN
		s_run <= '0';
		s_water <= '0';
		s_detergent <= '0';
		s_door_closed <= '0';
		wait for 9 * iCLK_period;
		
		s_wl_max <= '1';
		s_hw <= "00";
		wait for iCLK_period;
		
		s_wl_max <= '0';
		s_hw <= "00";
		wait for 9 * iCLK_period;
		
		s_temp_ok <= '1';
		wait for iCLK_period;
		s_temp_ok <= '0';
		
		wait for 60 * iCLK_period; --- s_washing i water out
		s_wl_min <= '1'; -- za centrifuga
		wait for 21 * iCLK_period; -- centrifuga		
		s_wl_min <= '0';
		
		wait for iCLK_period;
		s_door_open <= '1';
		
		-- reset sistema
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		s_run <= '0';
		s_water <= '0';
		s_detergent <= '0';
		s_door_closed <= '0';
		s_door_open <= '0';
		s_wl_max <= '0';
		s_wl_min <= '0';
		s_hw <= "00";
		s_temp_ok <= '0';
		
		
		-- 2. pranje warm w
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		s_run <= '1';
		s_water <= '1';
		s_detergent <= '1';
		s_door_closed <= '1';
		wait for iCLK_period;
		
		-- prelazi u stanje S_WATER IN
		s_run <= '0';
		s_water <= '0';
		s_detergent <= '0';
		s_door_closed <= '0';
		wait for 9 * iCLK_period;
		
		s_wl_max <= '1';
		s_hw <= "01";
		wait for iCLK_period;
		
		s_wl_max <= '0';
		s_hw <= "00";
		wait for 9 * iCLK_period;
		
		s_temp_ok <= '1';
		wait for iCLK_period;
		s_temp_ok <= '0';
		
		wait for 60 * iCLK_period; --- s_washing i water out
		s_wl_min <= '1'; -- za centrifuga
		wait for 21 * iCLK_period; -- centrifuga		
		s_wl_min <= '0';
		
		wait for iCLK_period;
		s_door_open <= '1';
		
		-- reset sistema
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		s_run <= '0';
		s_water <= '0';
		s_detergent <= '0';
		s_door_closed <= '0';
		s_door_open <= '0';
		s_wl_max <= '0';
		s_wl_min <= '0';
		s_hw <= "00";
		s_temp_ok <= '0';
		
		-- vruce pranje
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		s_run <= '1';
		s_water <= '1';
		s_detergent <= '1';
		s_door_closed <= '1';
		wait for iCLK_period;
		
		-- prelazi u stanje S_WATER IN
		s_run <= '0';
		s_water <= '0';
		s_detergent <= '0';
		s_door_closed <= '0';
		wait for 9 * iCLK_period;
		
		s_wl_max <= '1';
		s_hw <= "10";
		wait for iCLK_period;
		
		s_wl_max <= '0';
		s_hw <= "00";
		wait for 9 * iCLK_period;
		
		s_temp_ok <= '1';
		wait for iCLK_period;
		s_temp_ok <= '0';
		
		wait for 60 * iCLK_period; --- s_washing i water out
		s_wl_min <= '1'; -- za centrifuga
		wait for 21 * iCLK_period; -- centrifuga		
		s_wl_min <= '0';
		
		wait for iCLK_period;
		s_door_open <= '1';
		
		-- reset sistema
		sRST <= '1';
		wait for 5.25 * iCLK_period;
		sRST <= '0';
		
		s_run <= '0';
		s_water <= '0';
		s_detergent <= '0';
		s_door_closed <= '0';
		s_door_open <= '0';
		s_wl_max <= '0';
		s_wl_min <= '0';
		s_hw <= "00";
		s_temp_ok <= '0';
		
		sRST <= '1';
		wait;
   end process;
end architecture;