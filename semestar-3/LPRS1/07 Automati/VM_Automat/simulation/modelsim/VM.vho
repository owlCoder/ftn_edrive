-- Copyright (C) 2019  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 19.1.0 Build 670 09/22/2019 SJ Lite Edition"

-- DATE "01/21/2022 19:25:08"

-- 
-- Device: Altera 10M16SAU169C8G Package UFBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_G1,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_F5,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_E7,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_C4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_C5,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	VM IS
    PORT (
	iRST : IN std_logic;
	iCLK : IN std_logic;
	i_run : IN std_logic;
	i_water : IN std_logic;
	i_detergent : IN std_logic;
	i_door_closed : IN std_logic;
	i_hw : IN std_logic_vector(1 DOWNTO 0);
	i_temp_ok : IN std_logic;
	i_wl_max : IN std_logic;
	i_wl_min : IN std_logic;
	o_lock : BUFFER std_logic;
	o_valve_in : BUFFER std_logic;
	o_valve_out : BUFFER std_logic;
	o_heater : BUFFER std_logic;
	o_motor_run : BUFFER std_logic_vector(1 DOWNTO 0);
	o_pump_out : BUFFER std_logic
	);
END VM;

-- Design Ports Information
-- o_lock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_valve_in	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_valve_out	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_heater	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_motor_run[0]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_motor_run[1]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_pump_out	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_door_closed	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRST	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_run	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_water	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_detergent	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_hw[1]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_hw[0]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_wl_max	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_wl_min	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_temp_ok	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF VM IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iRST : std_logic;
SIGNAL ww_iCLK : std_logic;
SIGNAL ww_i_run : std_logic;
SIGNAL ww_i_water : std_logic;
SIGNAL ww_i_detergent : std_logic;
SIGNAL ww_i_door_closed : std_logic;
SIGNAL ww_i_hw : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_i_temp_ok : std_logic;
SIGNAL ww_i_wl_max : std_logic;
SIGNAL ww_i_wl_min : std_logic;
SIGNAL ww_o_lock : std_logic;
SIGNAL ww_o_valve_in : std_logic;
SIGNAL ww_o_valve_out : std_logic;
SIGNAL ww_o_heater : std_logic;
SIGNAL ww_o_motor_run : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_o_pump_out : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \o_lock~output_o\ : std_logic;
SIGNAL \o_valve_in~output_o\ : std_logic;
SIGNAL \o_valve_out~output_o\ : std_logic;
SIGNAL \o_heater~output_o\ : std_logic;
SIGNAL \o_motor_run[0]~output_o\ : std_logic;
SIGNAL \o_motor_run[1]~output_o\ : std_logic;
SIGNAL \o_pump_out~output_o\ : std_logic;
SIGNAL \iCLK~input_o\ : std_logic;
SIGNAL \iCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_detergent~input_o\ : std_logic;
SIGNAL \i_run~input_o\ : std_logic;
SIGNAL \i_door_closed~input_o\ : std_logic;
SIGNAL \i_water~input_o\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \i_wl_min~input_o\ : std_logic;
SIGNAL \s_w_timer[0]~6_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \iRST~input_o\ : std_logic;
SIGNAL \iRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_hw[0]~input_o\ : std_logic;
SIGNAL \i_temp_ok~input_o\ : std_logic;
SIGNAL \i_wl_max~input_o\ : std_logic;
SIGNAL \i_hw[1]~input_o\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \Selector1~2_combout\ : std_logic;
SIGNAL \sSTATE.S_WATER_IN~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \sSTATE.S_COLD_W~q\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector4~1_combout\ : std_logic;
SIGNAL \sSTATE.S_HOT_W~q\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \sSTATE.S_WARM_W~q\ : std_logic;
SIGNAL \o_heater~0_combout\ : std_logic;
SIGNAL \s_w_timer[4]~15\ : std_logic;
SIGNAL \s_w_timer[5]~16_combout\ : std_logic;
SIGNAL \Equal3~0_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \sSTATE.S_WASHING~q\ : std_logic;
SIGNAL \s_w_timer[0]~7\ : std_logic;
SIGNAL \s_w_timer[1]~8_combout\ : std_logic;
SIGNAL \s_w_timer[1]~9\ : std_logic;
SIGNAL \s_w_timer[2]~10_combout\ : std_logic;
SIGNAL \s_w_timer[2]~11\ : std_logic;
SIGNAL \s_w_timer[3]~12_combout\ : std_logic;
SIGNAL \s_w_timer[3]~13\ : std_logic;
SIGNAL \s_w_timer[4]~14_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \sSTATE.S_WATER_OUT~q\ : std_logic;
SIGNAL \s_c_timer[0]~5_combout\ : std_logic;
SIGNAL \s_c_timer[0]~6\ : std_logic;
SIGNAL \s_c_timer[1]~7_combout\ : std_logic;
SIGNAL \s_c_timer[1]~8\ : std_logic;
SIGNAL \s_c_timer[2]~9_combout\ : std_logic;
SIGNAL \s_c_timer[2]~10\ : std_logic;
SIGNAL \s_c_timer[3]~11_combout\ : std_logic;
SIGNAL \s_c_timer[3]~12\ : std_logic;
SIGNAL \s_c_timer[4]~13_combout\ : std_logic;
SIGNAL \Equal4~0_combout\ : std_logic;
SIGNAL \Equal4~1_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \sSTATE.S_CENTRIFUGA~q\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \sSTATE.S_WAIT~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \sSTATE.S_IDLE~q\ : std_logic;
SIGNAL \o_lock~0_combout\ : std_logic;
SIGNAL \o_valve_out~0_combout\ : std_logic;
SIGNAL s_w_timer : std_logic_vector(5 DOWNTO 0);
SIGNAL s_c_timer : std_logic_vector(4 DOWNTO 0);
SIGNAL \ALT_INV_iRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_sSTATE.S_WASHING~q\ : std_logic;
SIGNAL \ALT_INV_o_heater~0_combout\ : std_logic;
SIGNAL \ALT_INV_sSTATE.S_CENTRIFUGA~q\ : std_logic;
SIGNAL \ALT_INV_o_lock~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iRST <= iRST;
ww_iCLK <= iCLK;
ww_i_run <= i_run;
ww_i_water <= i_water;
ww_i_detergent <= i_detergent;
ww_i_door_closed <= i_door_closed;
ww_i_hw <= i_hw;
ww_i_temp_ok <= i_temp_ok;
ww_i_wl_max <= i_wl_max;
ww_i_wl_min <= i_wl_min;
o_lock <= ww_o_lock;
o_valve_in <= ww_o_valve_in;
o_valve_out <= ww_o_valve_out;
o_heater <= ww_o_heater;
o_motor_run <= ww_o_motor_run;
o_pump_out <= ww_o_pump_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\iRST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iRST~input_o\);

\iCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iCLK~input_o\);
\ALT_INV_iRST~inputclkctrl_outclk\ <= NOT \iRST~inputclkctrl_outclk\;
\ALT_INV_sSTATE.S_WASHING~q\ <= NOT \sSTATE.S_WASHING~q\;
\ALT_INV_o_heater~0_combout\ <= NOT \o_heater~0_combout\;
\ALT_INV_sSTATE.S_CENTRIFUGA~q\ <= NOT \sSTATE.S_CENTRIFUGA~q\;
\ALT_INV_o_lock~0_combout\ <= NOT \o_lock~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X25_Y22_N23
\o_lock~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_o_lock~0_combout\,
	devoe => ww_devoe,
	o => \o_lock~output_o\);

-- Location: IOOBUF_X19_Y17_N16
\o_valve_in~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sSTATE.S_WATER_IN~q\,
	devoe => ww_devoe,
	o => \o_valve_in~output_o\);

-- Location: IOOBUF_X14_Y17_N2
\o_valve_out~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_valve_out~0_combout\,
	devoe => ww_devoe,
	o => \o_valve_out~output_o\);

-- Location: IOOBUF_X16_Y17_N9
\o_heater~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_o_heater~0_combout\,
	devoe => ww_devoe,
	o => \o_heater~output_o\);

-- Location: IOOBUF_X19_Y17_N9
\o_motor_run[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sSTATE.S_WASHING~q\,
	devoe => ww_devoe,
	o => \o_motor_run[0]~output_o\);

-- Location: IOOBUF_X16_Y17_N16
\o_motor_run[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sSTATE.S_CENTRIFUGA~q\,
	devoe => ww_devoe,
	o => \o_motor_run[1]~output_o\);

-- Location: IOOBUF_X14_Y17_N23
\o_pump_out~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_valve_out~0_combout\,
	devoe => ww_devoe,
	o => \o_pump_out~output_o\);

-- Location: IOIBUF_X0_Y8_N15
\iCLK~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iCLK,
	o => \iCLK~input_o\);

-- Location: CLKCTRL_G3
\iCLK~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iCLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iCLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X16_Y17_N22
\i_detergent~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_detergent,
	o => \i_detergent~input_o\);

-- Location: IOIBUF_X19_Y17_N1
\i_run~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_run,
	o => \i_run~input_o\);

-- Location: IOIBUF_X25_Y22_N15
\i_door_closed~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_door_closed,
	o => \i_door_closed~input_o\);

-- Location: IOIBUF_X16_Y17_N1
\i_water~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_water,
	o => \i_water~input_o\);

-- Location: LCCOMB_X27_Y17_N26
\Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (\i_detergent~input_o\ & (\i_run~input_o\ & (\i_door_closed~input_o\ & \i_water~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_detergent~input_o\,
	datab => \i_run~input_o\,
	datac => \i_door_closed~input_o\,
	datad => \i_water~input_o\,
	combout => \Selector1~0_combout\);

-- Location: IOIBUF_X50_Y16_N15
\i_wl_min~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_wl_min,
	o => \i_wl_min~input_o\);

-- Location: LCCOMB_X28_Y17_N10
\s_w_timer[0]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_w_timer[0]~6_combout\ = s_w_timer(0) $ (VCC)
-- \s_w_timer[0]~7\ = CARRY(s_w_timer(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_w_timer(0),
	datad => VCC,
	combout => \s_w_timer[0]~6_combout\,
	cout => \s_w_timer[0]~7\);

-- Location: LCCOMB_X29_Y17_N30
\~GND\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: IOIBUF_X0_Y8_N22
\iRST~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iRST,
	o => \iRST~input_o\);

-- Location: CLKCTRL_G4
\iRST~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \iRST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \iRST~inputclkctrl_outclk\);

-- Location: IOIBUF_X19_Y17_N22
\i_hw[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_hw(0),
	o => \i_hw[0]~input_o\);

-- Location: IOIBUF_X21_Y17_N29
\i_temp_ok~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_temp_ok,
	o => \i_temp_ok~input_o\);

-- Location: IOIBUF_X25_Y24_N22
\i_wl_max~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_wl_max,
	o => \i_wl_max~input_o\);

-- Location: IOIBUF_X19_Y17_N29
\i_hw[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_hw(1),
	o => \i_hw[1]~input_o\);

-- Location: LCCOMB_X27_Y17_N28
\Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\sSTATE.S_WATER_IN~q\ & (((\i_hw[0]~input_o\ & \i_hw[1]~input_o\)) # (!\i_wl_max~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_hw[0]~input_o\,
	datab => \i_wl_max~input_o\,
	datac => \i_hw[1]~input_o\,
	datad => \sSTATE.S_WATER_IN~q\,
	combout => \Selector1~1_combout\);

-- Location: LCCOMB_X27_Y17_N6
\Selector1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~2_combout\ = (\Selector1~1_combout\) # ((!\sSTATE.S_IDLE~q\ & \Selector1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sSTATE.S_IDLE~q\,
	datac => \Selector1~0_combout\,
	datad => \Selector1~1_combout\,
	combout => \Selector1~2_combout\);

-- Location: FF_X27_Y17_N7
\sSTATE.S_WATER_IN\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector1~2_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_WATER_IN~q\);

-- Location: LCCOMB_X27_Y17_N18
\Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\i_wl_max~input_o\ & (!\i_hw[1]~input_o\ & \sSTATE.S_WATER_IN~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_wl_max~input_o\,
	datac => \i_hw[1]~input_o\,
	datad => \sSTATE.S_WATER_IN~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X27_Y17_N14
\Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\i_hw[0]~input_o\ & (!\i_temp_ok~input_o\ & (\sSTATE.S_COLD_W~q\))) # (!\i_hw[0]~input_o\ & ((\Selector2~0_combout\) # ((!\i_temp_ok~input_o\ & \sSTATE.S_COLD_W~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_hw[0]~input_o\,
	datab => \i_temp_ok~input_o\,
	datac => \sSTATE.S_COLD_W~q\,
	datad => \Selector2~0_combout\,
	combout => \Selector2~1_combout\);

-- Location: FF_X27_Y17_N15
\sSTATE.S_COLD_W\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector2~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_COLD_W~q\);

-- Location: LCCOMB_X27_Y17_N16
\Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (!\i_hw[0]~input_o\ & (\i_wl_max~input_o\ & (\i_hw[1]~input_o\ & \sSTATE.S_WATER_IN~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_hw[0]~input_o\,
	datab => \i_wl_max~input_o\,
	datac => \i_hw[1]~input_o\,
	datad => \sSTATE.S_WATER_IN~q\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X27_Y17_N30
\Selector4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector4~1_combout\ = (\Selector4~0_combout\) # ((!\i_temp_ok~input_o\ & \sSTATE.S_HOT_W~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_temp_ok~input_o\,
	datac => \sSTATE.S_HOT_W~q\,
	datad => \Selector4~0_combout\,
	combout => \Selector4~1_combout\);

-- Location: FF_X27_Y17_N31
\sSTATE.S_HOT_W\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector4~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_HOT_W~q\);

-- Location: LCCOMB_X27_Y17_N12
\Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (\i_hw[0]~input_o\ & ((\Selector2~0_combout\) # ((!\i_temp_ok~input_o\ & \sSTATE.S_WARM_W~q\)))) # (!\i_hw[0]~input_o\ & (!\i_temp_ok~input_o\ & (\sSTATE.S_WARM_W~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_hw[0]~input_o\,
	datab => \i_temp_ok~input_o\,
	datac => \sSTATE.S_WARM_W~q\,
	datad => \Selector2~0_combout\,
	combout => \Selector3~0_combout\);

-- Location: FF_X27_Y17_N13
\sSTATE.S_WARM_W\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector3~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_WARM_W~q\);

-- Location: LCCOMB_X27_Y17_N24
\o_heater~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_heater~0_combout\ = (!\sSTATE.S_HOT_W~q\ & !\sSTATE.S_WARM_W~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sSTATE.S_HOT_W~q\,
	datad => \sSTATE.S_WARM_W~q\,
	combout => \o_heater~0_combout\);

-- Location: LCCOMB_X28_Y17_N18
\s_w_timer[4]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_w_timer[4]~14_combout\ = (s_w_timer(4) & (!\s_w_timer[3]~13\)) # (!s_w_timer(4) & ((\s_w_timer[3]~13\) # (GND)))
-- \s_w_timer[4]~15\ = CARRY((!\s_w_timer[3]~13\) # (!s_w_timer(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_w_timer(4),
	datad => VCC,
	cin => \s_w_timer[3]~13\,
	combout => \s_w_timer[4]~14_combout\,
	cout => \s_w_timer[4]~15\);

-- Location: LCCOMB_X28_Y17_N20
\s_w_timer[5]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_w_timer[5]~16_combout\ = \s_w_timer[4]~15\ $ (!s_w_timer(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => s_w_timer(5),
	cin => \s_w_timer[4]~15\,
	combout => \s_w_timer[5]~16_combout\);

-- Location: FF_X28_Y17_N21
\s_w_timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_w_timer[5]~16_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_WASHING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_w_timer(5));

-- Location: LCCOMB_X28_Y17_N24
\Equal3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal3~0_combout\ = (s_w_timer(1) & (!s_w_timer(3) & (!s_w_timer(2) & !s_w_timer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_w_timer(1),
	datab => s_w_timer(3),
	datac => s_w_timer(2),
	datad => s_w_timer(0),
	combout => \Equal3~0_combout\);

-- Location: LCCOMB_X28_Y17_N28
\Selector5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\sSTATE.S_WASHING~q\ & (((!\Equal3~0_combout\) # (!s_w_timer(5))) # (!s_w_timer(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_w_timer(4),
	datab => s_w_timer(5),
	datac => \sSTATE.S_WASHING~q\,
	datad => \Equal3~0_combout\,
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X28_Y17_N22
\Selector5~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\Selector5~0_combout\) # ((\i_temp_ok~input_o\ & ((\sSTATE.S_COLD_W~q\) # (!\o_heater~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sSTATE.S_COLD_W~q\,
	datab => \o_heater~0_combout\,
	datac => \i_temp_ok~input_o\,
	datad => \Selector5~0_combout\,
	combout => \Selector5~1_combout\);

-- Location: FF_X28_Y17_N23
\sSTATE.S_WASHING\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector5~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_WASHING~q\);

-- Location: FF_X28_Y17_N11
\s_w_timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_w_timer[0]~6_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_WASHING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_w_timer(0));

-- Location: LCCOMB_X28_Y17_N12
\s_w_timer[1]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_w_timer[1]~8_combout\ = (s_w_timer(1) & (\s_w_timer[0]~7\ $ (GND))) # (!s_w_timer(1) & (!\s_w_timer[0]~7\ & VCC))
-- \s_w_timer[1]~9\ = CARRY((s_w_timer(1) & !\s_w_timer[0]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_w_timer(1),
	datad => VCC,
	cin => \s_w_timer[0]~7\,
	combout => \s_w_timer[1]~8_combout\,
	cout => \s_w_timer[1]~9\);

-- Location: FF_X28_Y17_N13
\s_w_timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_w_timer[1]~8_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_WASHING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_w_timer(1));

-- Location: LCCOMB_X28_Y17_N14
\s_w_timer[2]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_w_timer[2]~10_combout\ = (s_w_timer(2) & ((GND) # (!\s_w_timer[1]~9\))) # (!s_w_timer(2) & (\s_w_timer[1]~9\ $ (GND)))
-- \s_w_timer[2]~11\ = CARRY((s_w_timer(2)) # (!\s_w_timer[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_w_timer(2),
	datad => VCC,
	cin => \s_w_timer[1]~9\,
	combout => \s_w_timer[2]~10_combout\,
	cout => \s_w_timer[2]~11\);

-- Location: FF_X28_Y17_N15
\s_w_timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_w_timer[2]~10_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_WASHING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_w_timer(2));

-- Location: LCCOMB_X28_Y17_N16
\s_w_timer[3]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_w_timer[3]~12_combout\ = (s_w_timer(3) & (\s_w_timer[2]~11\ & VCC)) # (!s_w_timer(3) & (!\s_w_timer[2]~11\))
-- \s_w_timer[3]~13\ = CARRY((!s_w_timer(3) & !\s_w_timer[2]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_w_timer(3),
	datad => VCC,
	cin => \s_w_timer[2]~11\,
	combout => \s_w_timer[3]~12_combout\,
	cout => \s_w_timer[3]~13\);

-- Location: FF_X28_Y17_N17
\s_w_timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_w_timer[3]~12_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_WASHING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_w_timer(3));

-- Location: FF_X28_Y17_N19
\s_w_timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_w_timer[4]~14_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_WASHING~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_w_timer(4));

-- Location: LCCOMB_X28_Y17_N2
\Selector6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (s_w_timer(4) & (s_w_timer(5) & (\sSTATE.S_WASHING~q\ & \Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_w_timer(4),
	datab => s_w_timer(5),
	datac => \sSTATE.S_WASHING~q\,
	datad => \Equal3~0_combout\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X28_Y17_N4
\Selector6~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\Selector6~0_combout\) # ((!\i_wl_min~input_o\ & \sSTATE.S_WATER_OUT~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_wl_min~input_o\,
	datac => \sSTATE.S_WATER_OUT~q\,
	datad => \Selector6~0_combout\,
	combout => \Selector6~1_combout\);

-- Location: FF_X28_Y17_N5
\sSTATE.S_WATER_OUT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector6~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_WATER_OUT~q\);

-- Location: LCCOMB_X29_Y17_N18
\s_c_timer[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_c_timer[0]~5_combout\ = s_c_timer(0) $ (VCC)
-- \s_c_timer[0]~6\ = CARRY(s_c_timer(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_c_timer(0),
	datad => VCC,
	combout => \s_c_timer[0]~5_combout\,
	cout => \s_c_timer[0]~6\);

-- Location: FF_X29_Y17_N19
\s_c_timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_c_timer[0]~5_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_CENTRIFUGA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_c_timer(0));

-- Location: LCCOMB_X29_Y17_N20
\s_c_timer[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_c_timer[1]~7_combout\ = (s_c_timer(1) & (\s_c_timer[0]~6\ & VCC)) # (!s_c_timer(1) & (!\s_c_timer[0]~6\))
-- \s_c_timer[1]~8\ = CARRY((!s_c_timer(1) & !\s_c_timer[0]~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_c_timer(1),
	datad => VCC,
	cin => \s_c_timer[0]~6\,
	combout => \s_c_timer[1]~7_combout\,
	cout => \s_c_timer[1]~8\);

-- Location: FF_X29_Y17_N21
\s_c_timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_c_timer[1]~7_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_CENTRIFUGA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_c_timer(1));

-- Location: LCCOMB_X29_Y17_N22
\s_c_timer[2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_c_timer[2]~9_combout\ = (s_c_timer(2) & (!\s_c_timer[1]~8\)) # (!s_c_timer(2) & ((\s_c_timer[1]~8\) # (GND)))
-- \s_c_timer[2]~10\ = CARRY((!\s_c_timer[1]~8\) # (!s_c_timer(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_c_timer(2),
	datad => VCC,
	cin => \s_c_timer[1]~8\,
	combout => \s_c_timer[2]~9_combout\,
	cout => \s_c_timer[2]~10\);

-- Location: FF_X29_Y17_N23
\s_c_timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_c_timer[2]~9_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_CENTRIFUGA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_c_timer(2));

-- Location: LCCOMB_X29_Y17_N24
\s_c_timer[3]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_c_timer[3]~11_combout\ = (s_c_timer(3) & (\s_c_timer[2]~10\ & VCC)) # (!s_c_timer(3) & (!\s_c_timer[2]~10\))
-- \s_c_timer[3]~12\ = CARRY((!s_c_timer(3) & !\s_c_timer[2]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_c_timer(3),
	datad => VCC,
	cin => \s_c_timer[2]~10\,
	combout => \s_c_timer[3]~11_combout\,
	cout => \s_c_timer[3]~12\);

-- Location: FF_X29_Y17_N25
\s_c_timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_c_timer[3]~11_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_CENTRIFUGA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_c_timer(3));

-- Location: LCCOMB_X29_Y17_N26
\s_c_timer[4]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_c_timer[4]~13_combout\ = s_c_timer(4) $ (\s_c_timer[3]~12\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_c_timer(4),
	cin => \s_c_timer[3]~12\,
	combout => \s_c_timer[4]~13_combout\);

-- Location: FF_X29_Y17_N27
\s_c_timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_c_timer[4]~13_combout\,
	asdata => \~GND~combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	sload => \ALT_INV_sSTATE.S_CENTRIFUGA~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_c_timer(4));

-- Location: LCCOMB_X29_Y17_N10
\Equal4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal4~0_combout\ = (s_c_timer(2) & (!s_c_timer(3) & (!s_c_timer(1) & !s_c_timer(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_c_timer(2),
	datab => s_c_timer(3),
	datac => s_c_timer(1),
	datad => s_c_timer(0),
	combout => \Equal4~0_combout\);

-- Location: LCCOMB_X29_Y17_N28
\Equal4~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal4~1_combout\ = (s_c_timer(4) & \Equal4~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_c_timer(4),
	datad => \Equal4~0_combout\,
	combout => \Equal4~1_combout\);

-- Location: LCCOMB_X29_Y17_N2
\Selector7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\i_wl_min~input_o\ & ((\sSTATE.S_WATER_OUT~q\) # ((\sSTATE.S_CENTRIFUGA~q\ & !\Equal4~1_combout\)))) # (!\i_wl_min~input_o\ & (((\sSTATE.S_CENTRIFUGA~q\ & !\Equal4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_wl_min~input_o\,
	datab => \sSTATE.S_WATER_OUT~q\,
	datac => \sSTATE.S_CENTRIFUGA~q\,
	datad => \Equal4~1_combout\,
	combout => \Selector7~0_combout\);

-- Location: FF_X29_Y17_N3
\sSTATE.S_CENTRIFUGA\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector7~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_CENTRIFUGA~q\);

-- Location: LCCOMB_X29_Y17_N8
\Selector8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\i_door_closed~input_o\ & (\sSTATE.S_CENTRIFUGA~q\ & ((\Equal4~1_combout\)))) # (!\i_door_closed~input_o\ & ((\sSTATE.S_WAIT~q\) # ((\sSTATE.S_CENTRIFUGA~q\ & \Equal4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_door_closed~input_o\,
	datab => \sSTATE.S_CENTRIFUGA~q\,
	datac => \sSTATE.S_WAIT~q\,
	datad => \Equal4~1_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X29_Y17_N9
\sSTATE.S_WAIT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector8~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_WAIT~q\);

-- Location: LCCOMB_X27_Y17_N4
\Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\Selector1~0_combout\ & (((!\sSTATE.S_WAIT~q\)) # (!\i_door_closed~input_o\))) # (!\Selector1~0_combout\ & (\sSTATE.S_IDLE~q\ & ((!\sSTATE.S_WAIT~q\) # (!\i_door_closed~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector1~0_combout\,
	datab => \i_door_closed~input_o\,
	datac => \sSTATE.S_IDLE~q\,
	datad => \sSTATE.S_WAIT~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X27_Y17_N5
\sSTATE.S_IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector0~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.S_IDLE~q\);

-- Location: LCCOMB_X26_Y17_N0
\o_lock~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_lock~0_combout\ = (\sSTATE.S_WAIT~q\) # (!\sSTATE.S_IDLE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sSTATE.S_IDLE~q\,
	datad => \sSTATE.S_WAIT~q\,
	combout => \o_lock~0_combout\);

-- Location: LCCOMB_X29_Y17_N12
\o_valve_out~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_valve_out~0_combout\ = (\sSTATE.S_WATER_OUT~q\) # (\sSTATE.S_CENTRIFUGA~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sSTATE.S_WATER_OUT~q\,
	datad => \sSTATE.S_CENTRIFUGA~q\,
	combout => \o_valve_out~0_combout\);

-- Location: UNVM_X0_Y18_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~GND~combout\,
	xe_ye => \~GND~combout\,
	se => \~GND~combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X25_Y28_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~GND~combout\,
	usr_pwd => VCC,
	tsen => \~GND~combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

ww_o_lock <= \o_lock~output_o\;

ww_o_valve_in <= \o_valve_in~output_o\;

ww_o_valve_out <= \o_valve_out~output_o\;

ww_o_heater <= \o_heater~output_o\;

ww_o_motor_run(0) <= \o_motor_run[0]~output_o\;

ww_o_motor_run(1) <= \o_motor_run[1]~output_o\;

ww_o_pump_out <= \o_pump_out~output_o\;
END structure;


