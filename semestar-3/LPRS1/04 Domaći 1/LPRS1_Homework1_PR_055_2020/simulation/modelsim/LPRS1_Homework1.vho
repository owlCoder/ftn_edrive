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

-- DATE "11/04/2021 12:09:58"

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


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	lprs1_homework1 IS
    PORT (
	i_x : IN std_logic_vector(3 DOWNTO 0);
	i_y : IN std_logic_vector(3 DOWNTO 0);
	i_z : IN std_logic_vector(1 DOWNTO 0);
	i_sel : IN std_logic_vector(1 DOWNTO 0);
	o_res : OUT std_logic_vector(3 DOWNTO 0);
	o_cmp : OUT std_logic_vector(1 DOWNTO 0);
	o_enc : OUT std_logic_vector(1 DOWNTO 0)
	);
END lprs1_homework1;

-- Design Ports Information
-- i_y[0]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_y[1]	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- o_res[0]	=>  Location: PIN_E6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_res[1]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_res[2]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_res[3]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_cmp[0]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_cmp[1]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_enc[0]	=>  Location: PIN_M7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_enc[1]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- i_sel[0]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_y[2]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_z[0]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_z[1]	=>  Location: PIN_E8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_x[0]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sel[1]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_y[3]	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_x[1]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_x[2]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_x[3]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default


ARCHITECTURE structure OF lprs1_homework1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_x : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_i_y : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_i_z : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_i_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_o_res : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_o_cmp : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_o_enc : std_logic_vector(1 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \i_y[0]~input_o\ : std_logic;
SIGNAL \i_y[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \o_res[0]~output_o\ : std_logic;
SIGNAL \o_res[1]~output_o\ : std_logic;
SIGNAL \o_res[2]~output_o\ : std_logic;
SIGNAL \o_res[3]~output_o\ : std_logic;
SIGNAL \o_cmp[0]~output_o\ : std_logic;
SIGNAL \o_cmp[1]~output_o\ : std_logic;
SIGNAL \o_enc[0]~output_o\ : std_logic;
SIGNAL \o_enc[1]~output_o\ : std_logic;
SIGNAL \i_sel[1]~input_o\ : std_logic;
SIGNAL \i_sel[0]~input_o\ : std_logic;
SIGNAL \i_y[2]~input_o\ : std_logic;
SIGNAL \i_x[0]~input_o\ : std_logic;
SIGNAL \i_z[0]~input_o\ : std_logic;
SIGNAL \i_z[1]~input_o\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \s_sub[0]~0_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \i_y[3]~input_o\ : std_logic;
SIGNAL \s_add[1]~0_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \i_x[1]~input_o\ : std_logic;
SIGNAL \s_sub[0]~1\ : std_logic;
SIGNAL \s_sub[1]~2_combout\ : std_logic;
SIGNAL \Add1~1_combout\ : std_logic;
SIGNAL \Equal2~2_combout\ : std_logic;
SIGNAL \i_x[2]~input_o\ : std_logic;
SIGNAL \s_sub[1]~3\ : std_logic;
SIGNAL \s_sub[2]~4_combout\ : std_logic;
SIGNAL \s_add[1]~1\ : std_logic;
SIGNAL \s_add[2]~2_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \s_add[2]~3\ : std_logic;
SIGNAL \s_add[3]~4_combout\ : std_logic;
SIGNAL \i_x[3]~input_o\ : std_logic;
SIGNAL \Equal2~3_combout\ : std_logic;
SIGNAL \s_sub[2]~5\ : std_logic;
SIGNAL \s_sub[3]~6_combout\ : std_logic;
SIGNAL \Add1~3_combout\ : std_logic;
SIGNAL \Equal7~0_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \o_enc~0_combout\ : std_logic;
SIGNAL \Equal7~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal7~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_x <= i_x;
ww_i_y <= i_y;
ww_i_z <= i_z;
ww_i_sel <= i_sel;
o_res <= ww_o_res;
o_cmp <= ww_o_cmp;
o_enc <= ww_o_enc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
\ALT_INV_Equal7~0_combout\ <= NOT \Equal7~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y19_N16
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

-- Location: IOOBUF_X12_Y17_N30
\o_res[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1~0_combout\,
	devoe => ww_devoe,
	o => \o_res[0]~output_o\);

-- Location: IOOBUF_X14_Y17_N30
\o_res[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1~1_combout\,
	devoe => ww_devoe,
	o => \o_res[1]~output_o\);

-- Location: IOOBUF_X12_Y17_N16
\o_res[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1~2_combout\,
	devoe => ww_devoe,
	o => \o_res[2]~output_o\);

-- Location: IOOBUF_X12_Y17_N9
\o_res[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Add1~3_combout\,
	devoe => ww_devoe,
	o => \o_res[3]~output_o\);

-- Location: IOOBUF_X8_Y17_N2
\o_cmp[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Equal7~0_combout\,
	devoe => ww_devoe,
	o => \o_cmp[0]~output_o\);

-- Location: IOOBUF_X12_Y17_N2
\o_cmp[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LessThan0~0_combout\,
	devoe => ww_devoe,
	o => \o_cmp[1]~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\o_enc[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_enc~0_combout\,
	devoe => ww_devoe,
	o => \o_enc[0]~output_o\);

-- Location: IOOBUF_X12_Y17_N23
\o_enc[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal7~1_combout\,
	devoe => ww_devoe,
	o => \o_enc[1]~output_o\);

-- Location: IOIBUF_X16_Y17_N8
\i_sel[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sel(1),
	o => \i_sel[1]~input_o\);

-- Location: IOIBUF_X10_Y17_N15
\i_sel[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sel(0),
	o => \i_sel[0]~input_o\);

-- Location: IOIBUF_X14_Y17_N1
\i_y[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_y(2),
	o => \i_y[2]~input_o\);

-- Location: IOIBUF_X16_Y17_N1
\i_x[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_x(0),
	o => \i_x[0]~input_o\);

-- Location: IOIBUF_X14_Y17_N22
\i_z[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_z(0),
	o => \i_z[0]~input_o\);

-- Location: IOIBUF_X16_Y17_N22
\i_z[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_z(1),
	o => \i_z[1]~input_o\);

-- Location: LCCOMB_X14_Y13_N16
\Equal2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (\i_z[0]~input_o\) # (\i_z[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_z[0]~input_o\,
	datad => \i_z[1]~input_o\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X13_Y13_N18
\s_sub[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_sub[0]~0_combout\ = (\i_x[0]~input_o\ & (\Equal2~0_combout\ $ (GND))) # (!\i_x[0]~input_o\ & ((GND) # (!\Equal2~0_combout\)))
-- \s_sub[0]~1\ = CARRY((!\Equal2~0_combout\) # (!\i_x[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_x[0]~input_o\,
	datab => \Equal2~0_combout\,
	datad => VCC,
	combout => \s_sub[0]~0_combout\,
	cout => \s_sub[0]~1\);

-- Location: LCCOMB_X13_Y13_N14
\Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = (\i_sel[1]~input_o\ & (\i_sel[0]~input_o\ & (\i_y[2]~input_o\))) # (!\i_sel[1]~input_o\ & ((\i_sel[0]~input_o\) # ((\s_sub[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sel[1]~input_o\,
	datab => \i_sel[0]~input_o\,
	datac => \i_y[2]~input_o\,
	datad => \s_sub[0]~0_combout\,
	combout => \Add1~0_combout\);

-- Location: IOIBUF_X8_Y17_N22
\i_y[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_y(3),
	o => \i_y[3]~input_o\);

-- Location: LCCOMB_X13_Y13_N0
\s_add[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_add[1]~0_combout\ = (\i_x[0]~input_o\ & (\i_y[3]~input_o\ $ (VCC))) # (!\i_x[0]~input_o\ & (\i_y[3]~input_o\ & VCC))
-- \s_add[1]~1\ = CARRY((\i_x[0]~input_o\ & \i_y[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_x[0]~input_o\,
	datab => \i_y[3]~input_o\,
	datad => VCC,
	combout => \s_add[1]~0_combout\,
	cout => \s_add[1]~1\);

-- Location: LCCOMB_X14_Y13_N2
\Equal2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (\i_z[0]~input_o\ & !\i_z[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_z[0]~input_o\,
	datad => \i_z[1]~input_o\,
	combout => \Equal2~1_combout\);

-- Location: IOIBUF_X10_Y17_N8
\i_x[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_x(1),
	o => \i_x[1]~input_o\);

-- Location: LCCOMB_X13_Y13_N20
\s_sub[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_sub[1]~2_combout\ = (\Equal2~1_combout\ & ((\i_x[1]~input_o\ & (!\s_sub[0]~1\)) # (!\i_x[1]~input_o\ & (\s_sub[0]~1\ & VCC)))) # (!\Equal2~1_combout\ & ((\i_x[1]~input_o\ & ((\s_sub[0]~1\) # (GND))) # (!\i_x[1]~input_o\ & (!\s_sub[0]~1\))))
-- \s_sub[1]~3\ = CARRY((\Equal2~1_combout\ & (\i_x[1]~input_o\ & !\s_sub[0]~1\)) # (!\Equal2~1_combout\ & ((\i_x[1]~input_o\) # (!\s_sub[0]~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~1_combout\,
	datab => \i_x[1]~input_o\,
	datad => VCC,
	cin => \s_sub[0]~1\,
	combout => \s_sub[1]~2_combout\,
	cout => \s_sub[1]~3\);

-- Location: LCCOMB_X13_Y13_N16
\Add1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~1_combout\ = (\i_sel[0]~input_o\ & ((\s_add[1]~0_combout\) # ((!\i_sel[1]~input_o\)))) # (!\i_sel[0]~input_o\ & (((!\i_sel[1]~input_o\ & \s_sub[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sel[0]~input_o\,
	datab => \s_add[1]~0_combout\,
	datac => \i_sel[1]~input_o\,
	datad => \s_sub[1]~2_combout\,
	combout => \Add1~1_combout\);

-- Location: LCCOMB_X14_Y13_N20
\Equal2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~2_combout\ = (!\i_z[0]~input_o\ & \i_z[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_z[0]~input_o\,
	datad => \i_z[1]~input_o\,
	combout => \Equal2~2_combout\);

-- Location: IOIBUF_X16_Y17_N15
\i_x[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_x(2),
	o => \i_x[2]~input_o\);

-- Location: LCCOMB_X13_Y13_N22
\s_sub[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_sub[2]~4_combout\ = ((\Equal2~2_combout\ $ (\i_x[2]~input_o\ $ (\s_sub[1]~3\)))) # (GND)
-- \s_sub[2]~5\ = CARRY((\Equal2~2_combout\ & ((!\s_sub[1]~3\) # (!\i_x[2]~input_o\))) # (!\Equal2~2_combout\ & (!\i_x[2]~input_o\ & !\s_sub[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~2_combout\,
	datab => \i_x[2]~input_o\,
	datad => VCC,
	cin => \s_sub[1]~3\,
	combout => \s_sub[2]~4_combout\,
	cout => \s_sub[2]~5\);

-- Location: LCCOMB_X13_Y13_N2
\s_add[2]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_add[2]~2_combout\ = (\i_x[1]~input_o\ & (!\s_add[1]~1\)) # (!\i_x[1]~input_o\ & ((\s_add[1]~1\) # (GND)))
-- \s_add[2]~3\ = CARRY((!\s_add[1]~1\) # (!\i_x[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_x[1]~input_o\,
	datad => VCC,
	cin => \s_add[1]~1\,
	combout => \s_add[2]~2_combout\,
	cout => \s_add[2]~3\);

-- Location: LCCOMB_X13_Y13_N10
\Add1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\i_sel[1]~input_o\ & (((\s_add[2]~2_combout\)) # (!\i_sel[0]~input_o\))) # (!\i_sel[1]~input_o\ & (!\i_sel[0]~input_o\ & (\s_sub[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sel[1]~input_o\,
	datab => \i_sel[0]~input_o\,
	datac => \s_sub[2]~4_combout\,
	datad => \s_add[2]~2_combout\,
	combout => \Add1~2_combout\);

-- Location: LCCOMB_X13_Y13_N4
\s_add[3]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_add[3]~4_combout\ = \s_add[2]~3\ $ (!\i_x[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \i_x[2]~input_o\,
	cin => \s_add[2]~3\,
	combout => \s_add[3]~4_combout\);

-- Location: IOIBUF_X10_Y17_N1
\i_x[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_x(3),
	o => \i_x[3]~input_o\);

-- Location: LCCOMB_X14_Y13_N6
\Equal2~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal2~3_combout\ = (\i_z[0]~input_o\ & \i_z[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_z[0]~input_o\,
	datad => \i_z[1]~input_o\,
	combout => \Equal2~3_combout\);

-- Location: LCCOMB_X13_Y13_N24
\s_sub[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_sub[3]~6_combout\ = \i_x[3]~input_o\ $ (\s_sub[2]~5\ $ (!\Equal2~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_x[3]~input_o\,
	datad => \Equal2~3_combout\,
	cin => \s_sub[2]~5\,
	combout => \s_sub[3]~6_combout\);

-- Location: LCCOMB_X13_Y13_N28
\Add1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~3_combout\ = (\i_sel[0]~input_o\ & (\s_add[3]~4_combout\ & (\i_sel[1]~input_o\))) # (!\i_sel[0]~input_o\ & (((\i_sel[1]~input_o\) # (\s_sub[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sel[0]~input_o\,
	datab => \s_add[3]~4_combout\,
	datac => \i_sel[1]~input_o\,
	datad => \s_sub[3]~6_combout\,
	combout => \Add1~3_combout\);

-- Location: LCCOMB_X13_Y13_N30
\Equal7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal7~0_combout\ = (!\Add1~2_combout\ & (!\Add1~3_combout\ & (!\Add1~0_combout\ & !\Add1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \Add1~3_combout\,
	datac => \Add1~0_combout\,
	datad => \Add1~1_combout\,
	combout => \Equal7~0_combout\);

-- Location: LCCOMB_X13_Y13_N8
\LessThan0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!\Add1~3_combout\ & ((!\Add1~1_combout\) # (!\Add1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datab => \Add1~1_combout\,
	datad => \Add1~3_combout\,
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X13_Y13_N26
\o_enc~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_enc~0_combout\ = (!\Add1~0_combout\ & ((\Add1~1_combout\) # (!\Add1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~2_combout\,
	datac => \Add1~0_combout\,
	datad => \Add1~1_combout\,
	combout => \o_enc~0_combout\);

-- Location: LCCOMB_X13_Y13_N12
\Equal7~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal7~1_combout\ = (!\Add1~0_combout\ & !\Add1~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~0_combout\,
	datad => \Add1~1_combout\,
	combout => \Equal7~1_combout\);

-- Location: IOIBUF_X8_Y0_N15
\i_y[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_y(0),
	o => \i_y[0]~input_o\);

-- Location: IOIBUF_X25_Y22_N15
\i_y[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_y(1),
	o => \i_y[1]~input_o\);

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

ww_o_res(0) <= \o_res[0]~output_o\;

ww_o_res(1) <= \o_res[1]~output_o\;

ww_o_res(2) <= \o_res[2]~output_o\;

ww_o_res(3) <= \o_res[3]~output_o\;

ww_o_cmp(0) <= \o_cmp[0]~output_o\;

ww_o_cmp(1) <= \o_cmp[1]~output_o\;

ww_o_enc(0) <= \o_enc[0]~output_o\;

ww_o_enc(1) <= \o_enc[1]~output_o\;
END structure;


