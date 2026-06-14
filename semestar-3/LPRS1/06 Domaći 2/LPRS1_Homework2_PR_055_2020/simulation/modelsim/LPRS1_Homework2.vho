-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "11/21/2021 15:26:37"

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
-- ~ALTERA_TMS~	=>  Location: PIN_G1,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_F5,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_E7,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_C4,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_C5,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default


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

ENTITY 	lprs1_homework2 IS
    PORT (
	i_clk : IN std_logic;
	i_rst : IN std_logic;
	i_run : IN std_logic;
	i_pause : IN std_logic;
	o_digit0 : BUFFER std_logic_vector(3 DOWNTO 0);
	o_digit1 : BUFFER std_logic_vector(3 DOWNTO 0);
	o_digit2 : BUFFER std_logic_vector(3 DOWNTO 0);
	o_digit3 : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END lprs1_homework2;

-- Design Ports Information
-- o_digit0[0]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit0[1]	=>  Location: PIN_N8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit0[2]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit0[3]	=>  Location: PIN_N5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit1[0]	=>  Location: PIN_M7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit1[1]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit1[2]	=>  Location: PIN_N7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit1[3]	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit2[0]	=>  Location: PIN_C9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit2[1]	=>  Location: PIN_M12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit2[2]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit2[3]	=>  Location: PIN_M4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit3[0]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit3[1]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit3[2]	=>  Location: PIN_N11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_digit3[3]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- i_clk	=>  Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_rst	=>  Location: PIN_H5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_run	=>  Location: PIN_J5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_pause	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default


ARCHITECTURE structure OF lprs1_homework2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk : std_logic;
SIGNAL ww_i_rst : std_logic;
SIGNAL ww_i_run : std_logic;
SIGNAL ww_i_pause : std_logic;
SIGNAL ww_o_digit0 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_o_digit1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_o_digit2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_o_digit3 : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \i_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \o_digit0[0]~output_o\ : std_logic;
SIGNAL \o_digit0[1]~output_o\ : std_logic;
SIGNAL \o_digit0[2]~output_o\ : std_logic;
SIGNAL \o_digit0[3]~output_o\ : std_logic;
SIGNAL \o_digit1[0]~output_o\ : std_logic;
SIGNAL \o_digit1[1]~output_o\ : std_logic;
SIGNAL \o_digit1[2]~output_o\ : std_logic;
SIGNAL \o_digit1[3]~output_o\ : std_logic;
SIGNAL \o_digit2[0]~output_o\ : std_logic;
SIGNAL \o_digit2[1]~output_o\ : std_logic;
SIGNAL \o_digit2[2]~output_o\ : std_logic;
SIGNAL \o_digit2[3]~output_o\ : std_logic;
SIGNAL \o_digit3[0]~output_o\ : std_logic;
SIGNAL \o_digit3[1]~output_o\ : std_logic;
SIGNAL \o_digit3[2]~output_o\ : std_logic;
SIGNAL \o_digit3[3]~output_o\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \i_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \s_cnt0~1_combout\ : std_logic;
SIGNAL \i_rst~input_o\ : std_logic;
SIGNAL \i_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \s_cnt_1us[0]~5_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \i_run~input_o\ : std_logic;
SIGNAL \i_pause~input_o\ : std_logic;
SIGNAL \s_en_1us~0_combout\ : std_logic;
SIGNAL \s_en_1us~q\ : std_logic;
SIGNAL \s_cnt_1us[0]~6\ : std_logic;
SIGNAL \s_cnt_1us[1]~7_combout\ : std_logic;
SIGNAL \s_cnt_1us[1]~8\ : std_logic;
SIGNAL \s_cnt_1us[2]~9_combout\ : std_logic;
SIGNAL \s_cnt_1us[2]~10\ : std_logic;
SIGNAL \s_cnt_1us[3]~11_combout\ : std_logic;
SIGNAL \s_cnt_1us[3]~12\ : std_logic;
SIGNAL \s_cnt_1us[4]~13_combout\ : std_logic;
SIGNAL \s_en0~0_combout\ : std_logic;
SIGNAL \s_en0~combout\ : std_logic;
SIGNAL \s_cnt0~2_combout\ : std_logic;
SIGNAL \s_cnt0~3_combout\ : std_logic;
SIGNAL \s_cnt0~0_combout\ : std_logic;
SIGNAL \s_cnt1~1_combout\ : std_logic;
SIGNAL \s_en1~0_combout\ : std_logic;
SIGNAL \s_en1~combout\ : std_logic;
SIGNAL \s_cnt1~2_combout\ : std_logic;
SIGNAL \s_cnt1~0_combout\ : std_logic;
SIGNAL s_cnt_1us : std_logic_vector(4 DOWNTO 0);
SIGNAL s_cnt0 : std_logic_vector(3 DOWNTO 0);
SIGNAL s_cnt1 : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_i_rst~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_clk <= i_clk;
ww_i_rst <= i_rst;
ww_i_run <= i_run;
ww_i_pause <= i_pause;
o_digit0 <= ww_o_digit0;
o_digit1 <= ww_o_digit1;
o_digit2 <= ww_o_digit2;
o_digit3 <= ww_o_digit3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\i_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_clk~input_o\);

\i_rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_rst~input_o\);
\ALT_INV_i_rst~inputclkctrl_outclk\ <= NOT \i_rst~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y21_N16
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X6_Y0_N23
\o_digit0[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt0(0),
	devoe => ww_devoe,
	o => \o_digit0[0]~output_o\);

-- Location: IOOBUF_X8_Y0_N23
\o_digit0[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt0(1),
	devoe => ww_devoe,
	o => \o_digit0[1]~output_o\);

-- Location: IOOBUF_X6_Y0_N9
\o_digit0[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt0(2),
	devoe => ww_devoe,
	o => \o_digit0[2]~output_o\);

-- Location: IOOBUF_X6_Y0_N16
\o_digit0[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt0(3),
	devoe => ww_devoe,
	o => \o_digit0[3]~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\o_digit1[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt1(0),
	devoe => ww_devoe,
	o => \o_digit1[0]~output_o\);

-- Location: IOOBUF_X8_Y0_N16
\o_digit1[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt1(1),
	devoe => ww_devoe,
	o => \o_digit1[1]~output_o\);

-- Location: IOOBUF_X8_Y0_N30
\o_digit1[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => s_cnt1(2),
	devoe => ww_devoe,
	o => \o_digit1[2]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\o_digit1[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_digit1[3]~output_o\);

-- Location: IOOBUF_X19_Y17_N2
\o_digit2[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \o_digit2[0]~output_o\);

-- Location: IOOBUF_X19_Y0_N16
\o_digit2[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \o_digit2[1]~output_o\);

-- Location: IOOBUF_X19_Y17_N30
\o_digit2[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_digit2[2]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\o_digit2[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_digit2[3]~output_o\);

-- Location: IOOBUF_X16_Y17_N16
\o_digit3[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \o_digit3[0]~output_o\);

-- Location: IOOBUF_X14_Y17_N23
\o_digit3[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_digit3[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N30
\o_digit3[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_digit3[2]~output_o\);

-- Location: IOOBUF_X8_Y17_N2
\o_digit3[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \o_digit3[3]~output_o\);

-- Location: IOIBUF_X0_Y9_N22
\i_clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: CLKCTRL_G4
\i_clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X7_Y1_N2
\s_cnt0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt0~1_combout\ = (!s_cnt0(3) & (s_cnt0(0) $ (s_cnt0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_cnt0(0),
	datac => s_cnt0(1),
	datad => s_cnt0(3),
	combout => \s_cnt0~1_combout\);

-- Location: IOIBUF_X0_Y8_N15
\i_rst~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_rst,
	o => \i_rst~input_o\);

-- Location: CLKCTRL_G3
\i_rst~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_rst~inputclkctrl_outclk\);

-- Location: LCCOMB_X7_Y1_N18
\s_cnt_1us[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_1us[0]~5_combout\ = s_cnt_1us(0) $ (VCC)
-- \s_cnt_1us[0]~6\ = CARRY(s_cnt_1us(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_cnt_1us(0),
	datad => VCC,
	combout => \s_cnt_1us[0]~5_combout\,
	cout => \s_cnt_1us[0]~6\);

-- Location: LCCOMB_X7_Y1_N16
\LessThan1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (s_cnt_1us(4) & s_cnt_1us(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_cnt_1us(4),
	datad => s_cnt_1us(3),
	combout => \LessThan1~0_combout\);

-- Location: IOIBUF_X6_Y0_N1
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

-- Location: IOIBUF_X6_Y0_N29
\i_pause~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_pause,
	o => \i_pause~input_o\);

-- Location: LCCOMB_X6_Y1_N16
\s_en_1us~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_en_1us~0_combout\ = (\i_run~input_o\) # ((\s_en_1us~q\ & !\i_pause~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_run~input_o\,
	datac => \s_en_1us~q\,
	datad => \i_pause~input_o\,
	combout => \s_en_1us~0_combout\);

-- Location: FF_X6_Y1_N17
s_en_1us : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_en_1us~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_en_1us~q\);

-- Location: FF_X7_Y1_N19
\s_cnt_1us[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt_1us[0]~5_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sclr => \LessThan1~0_combout\,
	ena => \s_en_1us~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_1us(0));

-- Location: LCCOMB_X7_Y1_N20
\s_cnt_1us[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_1us[1]~7_combout\ = (s_cnt_1us(1) & (!\s_cnt_1us[0]~6\)) # (!s_cnt_1us(1) & ((\s_cnt_1us[0]~6\) # (GND)))
-- \s_cnt_1us[1]~8\ = CARRY((!\s_cnt_1us[0]~6\) # (!s_cnt_1us(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_cnt_1us(1),
	datad => VCC,
	cin => \s_cnt_1us[0]~6\,
	combout => \s_cnt_1us[1]~7_combout\,
	cout => \s_cnt_1us[1]~8\);

-- Location: FF_X7_Y1_N21
\s_cnt_1us[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt_1us[1]~7_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sclr => \LessThan1~0_combout\,
	ena => \s_en_1us~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_1us(1));

-- Location: LCCOMB_X7_Y1_N22
\s_cnt_1us[2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_1us[2]~9_combout\ = (s_cnt_1us(2) & (\s_cnt_1us[1]~8\ $ (GND))) # (!s_cnt_1us(2) & (!\s_cnt_1us[1]~8\ & VCC))
-- \s_cnt_1us[2]~10\ = CARRY((s_cnt_1us(2) & !\s_cnt_1us[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_1us(2),
	datad => VCC,
	cin => \s_cnt_1us[1]~8\,
	combout => \s_cnt_1us[2]~9_combout\,
	cout => \s_cnt_1us[2]~10\);

-- Location: FF_X7_Y1_N23
\s_cnt_1us[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt_1us[2]~9_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sclr => \LessThan1~0_combout\,
	ena => \s_en_1us~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_1us(2));

-- Location: LCCOMB_X7_Y1_N24
\s_cnt_1us[3]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_1us[3]~11_combout\ = (s_cnt_1us(3) & (!\s_cnt_1us[2]~10\)) # (!s_cnt_1us(3) & ((\s_cnt_1us[2]~10\) # (GND)))
-- \s_cnt_1us[3]~12\ = CARRY((!\s_cnt_1us[2]~10\) # (!s_cnt_1us(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_cnt_1us(3),
	datad => VCC,
	cin => \s_cnt_1us[2]~10\,
	combout => \s_cnt_1us[3]~11_combout\,
	cout => \s_cnt_1us[3]~12\);

-- Location: FF_X7_Y1_N25
\s_cnt_1us[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt_1us[3]~11_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sclr => \LessThan1~0_combout\,
	ena => \s_en_1us~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_1us(3));

-- Location: LCCOMB_X7_Y1_N26
\s_cnt_1us[4]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_1us[4]~13_combout\ = s_cnt_1us(4) $ (!\s_cnt_1us[3]~12\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_1us(4),
	cin => \s_cnt_1us[3]~12\,
	combout => \s_cnt_1us[4]~13_combout\);

-- Location: FF_X7_Y1_N27
\s_cnt_1us[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt_1us[4]~13_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sclr => \LessThan1~0_combout\,
	ena => \s_en_1us~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_1us(4));

-- Location: LCCOMB_X7_Y1_N8
\s_en0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_en0~0_combout\ = (\s_en_1us~q\ & (!s_cnt_1us(1) & (!s_cnt_1us(2) & !s_cnt_1us(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_en_1us~q\,
	datab => s_cnt_1us(1),
	datac => s_cnt_1us(2),
	datad => s_cnt_1us(0),
	combout => \s_en0~0_combout\);

-- Location: LCCOMB_X7_Y1_N10
s_en0 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_en0~combout\ = (!s_cnt_1us(4) & (!s_cnt_1us(3) & \s_en0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_1us(4),
	datab => s_cnt_1us(3),
	datac => \s_en0~0_combout\,
	combout => \s_en0~combout\);

-- Location: FF_X7_Y1_N3
\s_cnt0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt0~1_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt0(1));

-- Location: LCCOMB_X7_Y1_N4
\s_cnt0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt0~2_combout\ = (!s_cnt0(3) & (s_cnt0(2) $ (((s_cnt0(0) & s_cnt0(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt0(3),
	datab => s_cnt0(0),
	datac => s_cnt0(2),
	datad => s_cnt0(1),
	combout => \s_cnt0~2_combout\);

-- Location: FF_X7_Y1_N5
\s_cnt0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt0~2_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt0(2));

-- Location: LCCOMB_X7_Y1_N6
\s_cnt0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt0~3_combout\ = (s_cnt0(0) & (s_cnt0(2) & (!s_cnt0(3) & s_cnt0(1)))) # (!s_cnt0(0) & (!s_cnt0(2) & (s_cnt0(3) & !s_cnt0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt0(0),
	datab => s_cnt0(2),
	datac => s_cnt0(3),
	datad => s_cnt0(1),
	combout => \s_cnt0~3_combout\);

-- Location: FF_X7_Y1_N7
\s_cnt0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt0~3_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt0(3));

-- Location: LCCOMB_X7_Y1_N0
\s_cnt0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt0~0_combout\ = (!s_cnt0(0) & (((!s_cnt0(2) & !s_cnt0(1))) # (!s_cnt0(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt0(3),
	datab => s_cnt0(2),
	datac => s_cnt0(0),
	datad => s_cnt0(1),
	combout => \s_cnt0~0_combout\);

-- Location: FF_X7_Y1_N1
\s_cnt0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt0~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en0~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt0(0));

-- Location: LCCOMB_X8_Y1_N10
\s_cnt1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1~1_combout\ = (!s_cnt1(2) & (s_cnt1(0) $ (s_cnt1(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_cnt1(0),
	datac => s_cnt1(1),
	datad => s_cnt1(2),
	combout => \s_cnt1~1_combout\);

-- Location: LCCOMB_X7_Y1_N28
\s_en1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_en1~0_combout\ = (s_cnt0(3) & (s_cnt0(0) & (!s_cnt0(2) & !s_cnt0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt0(3),
	datab => s_cnt0(0),
	datac => s_cnt0(2),
	datad => s_cnt0(1),
	combout => \s_en1~0_combout\);

-- Location: LCCOMB_X7_Y1_N30
s_en1 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_en1~combout\ = (!s_cnt_1us(4) & (!s_cnt_1us(3) & (\s_en0~0_combout\ & \s_en1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_1us(4),
	datab => s_cnt_1us(3),
	datac => \s_en0~0_combout\,
	datad => \s_en1~0_combout\,
	combout => \s_en1~combout\);

-- Location: FF_X8_Y1_N11
\s_cnt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt1~1_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(1));

-- Location: LCCOMB_X8_Y1_N12
\s_cnt1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1~2_combout\ = (s_cnt1(1) & (!s_cnt1(2) & s_cnt1(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt1(1),
	datac => s_cnt1(2),
	datad => s_cnt1(0),
	combout => \s_cnt1~2_combout\);

-- Location: FF_X8_Y1_N13
\s_cnt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt1~2_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(2));

-- Location: LCCOMB_X8_Y1_N0
\s_cnt1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1~0_combout\ = (!s_cnt1(0) & !s_cnt1(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_cnt1(0),
	datad => s_cnt1(2),
	combout => \s_cnt1~0_combout\);

-- Location: FF_X8_Y1_N1
\s_cnt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \i_clk~inputclkctrl_outclk\,
	d => \s_cnt1~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_en1~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(0));

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
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
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
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

ww_o_digit0(0) <= \o_digit0[0]~output_o\;

ww_o_digit0(1) <= \o_digit0[1]~output_o\;

ww_o_digit0(2) <= \o_digit0[2]~output_o\;

ww_o_digit0(3) <= \o_digit0[3]~output_o\;

ww_o_digit1(0) <= \o_digit1[0]~output_o\;

ww_o_digit1(1) <= \o_digit1[1]~output_o\;

ww_o_digit1(2) <= \o_digit1[2]~output_o\;

ww_o_digit1(3) <= \o_digit1[3]~output_o\;

ww_o_digit2(0) <= \o_digit2[0]~output_o\;

ww_o_digit2(1) <= \o_digit2[1]~output_o\;

ww_o_digit2(2) <= \o_digit2[2]~output_o\;

ww_o_digit2(3) <= \o_digit2[3]~output_o\;

ww_o_digit3(0) <= \o_digit3[0]~output_o\;

ww_o_digit3(1) <= \o_digit3[1]~output_o\;

ww_o_digit3(2) <= \o_digit3[2]~output_o\;

ww_o_digit3(3) <= \o_digit3[3]~output_o\;
END structure;


