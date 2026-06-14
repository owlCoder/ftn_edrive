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

-- DATE "11/01/2021 15:20:38"

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


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	coder IS
    PORT (
	iX : IN std_logic_vector(7 DOWNTO 0);
	oY_uslovna : OUT std_logic_vector(2 DOWNTO 0);
	oY_if : OUT std_logic_vector(2 DOWNTO 0);
	oY_case : OUT std_logic_vector(2 DOWNTO 0)
	);
END coder;

-- Design Ports Information
-- oY_uslovna[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_uslovna[1]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_uslovna[2]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_if[0]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_if[1]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_if[2]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_case[0]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_case[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY_case[2]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[7]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[3]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[1]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[2]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[4]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[5]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[6]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iX[0]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF coder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iX : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_oY_uslovna : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_oY_if : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_oY_case : std_logic_vector(2 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oY_uslovna[0]~output_o\ : std_logic;
SIGNAL \oY_uslovna[1]~output_o\ : std_logic;
SIGNAL \oY_uslovna[2]~output_o\ : std_logic;
SIGNAL \oY_if[0]~output_o\ : std_logic;
SIGNAL \oY_if[1]~output_o\ : std_logic;
SIGNAL \oY_if[2]~output_o\ : std_logic;
SIGNAL \oY_case[0]~output_o\ : std_logic;
SIGNAL \oY_case[1]~output_o\ : std_logic;
SIGNAL \oY_case[2]~output_o\ : std_logic;
SIGNAL \iX[7]~input_o\ : std_logic;
SIGNAL \iX[3]~input_o\ : std_logic;
SIGNAL \iX[2]~input_o\ : std_logic;
SIGNAL \iX[1]~input_o\ : std_logic;
SIGNAL \iX[4]~input_o\ : std_logic;
SIGNAL \oY_uslovna~0_combout\ : std_logic;
SIGNAL \iX[6]~input_o\ : std_logic;
SIGNAL \iX[5]~input_o\ : std_logic;
SIGNAL \oY_uslovna~1_combout\ : std_logic;
SIGNAL \oY_uslovna~2_combout\ : std_logic;
SIGNAL \oY_uslovna~3_combout\ : std_logic;
SIGNAL \oY_uslovna~4_combout\ : std_logic;
SIGNAL \Mux2~1_combout\ : std_logic;
SIGNAL \iX[0]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux2~0_combout\ : std_logic;
SIGNAL \Mux2~2_combout\ : std_logic;
SIGNAL \Mux1~1_combout\ : std_logic;
SIGNAL \Mux1~0_combout\ : std_logic;
SIGNAL \Mux1~2_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \Mux0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux0~3_combout\ : std_logic;
SIGNAL \ALT_INV_Mux1~2_combout\ : std_logic;
SIGNAL \ALT_INV_Mux2~2_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iX <= iX;
oY_uslovna <= ww_oY_uslovna;
oY_if <= ww_oY_if;
oY_case <= ww_oY_case;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
\ALT_INV_Mux0~3_combout\ <= NOT \Mux0~3_combout\;
\ALT_INV_Mux1~2_combout\ <= NOT \Mux1~2_combout\;
\ALT_INV_Mux2~2_combout\ <= NOT \Mux2~2_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y20_N16
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

-- Location: IOOBUF_X12_Y17_N9
\oY_uslovna[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oY_uslovna~1_combout\,
	devoe => ww_devoe,
	o => \oY_uslovna[0]~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\oY_uslovna[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oY_uslovna~3_combout\,
	devoe => ww_devoe,
	o => \oY_uslovna[1]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\oY_uslovna[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oY_uslovna~4_combout\,
	devoe => ww_devoe,
	o => \oY_uslovna[2]~output_o\);

-- Location: IOOBUF_X12_Y17_N2
\oY_if[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oY_uslovna~1_combout\,
	devoe => ww_devoe,
	o => \oY_if[0]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\oY_if[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oY_uslovna~3_combout\,
	devoe => ww_devoe,
	o => \oY_if[1]~output_o\);

-- Location: IOOBUF_X0_Y12_N23
\oY_if[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oY_uslovna~4_combout\,
	devoe => ww_devoe,
	o => \oY_if[2]~output_o\);

-- Location: IOOBUF_X8_Y17_N16
\oY_case[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux2~2_combout\,
	devoe => ww_devoe,
	o => \oY_case[0]~output_o\);

-- Location: IOOBUF_X8_Y17_N2
\oY_case[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux1~2_combout\,
	devoe => ww_devoe,
	o => \oY_case[1]~output_o\);

-- Location: IOOBUF_X12_Y17_N23
\oY_case[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Mux0~3_combout\,
	devoe => ww_devoe,
	o => \oY_case[2]~output_o\);

-- Location: IOIBUF_X10_Y17_N1
\iX[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(7),
	o => \iX[7]~input_o\);

-- Location: IOIBUF_X10_Y17_N15
\iX[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(3),
	o => \iX[3]~input_o\);

-- Location: IOIBUF_X0_Y15_N22
\iX[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(2),
	o => \iX[2]~input_o\);

-- Location: IOIBUF_X8_Y17_N22
\iX[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(1),
	o => \iX[1]~input_o\);

-- Location: IOIBUF_X12_Y17_N15
\iX[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(4),
	o => \iX[4]~input_o\);

-- Location: LCCOMB_X9_Y15_N8
\oY_uslovna~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oY_uslovna~0_combout\ = (!\iX[4]~input_o\ & ((\iX[3]~input_o\) # ((!\iX[2]~input_o\ & \iX[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[3]~input_o\,
	datab => \iX[2]~input_o\,
	datac => \iX[1]~input_o\,
	datad => \iX[4]~input_o\,
	combout => \oY_uslovna~0_combout\);

-- Location: IOIBUF_X14_Y17_N22
\iX[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(6),
	o => \iX[6]~input_o\);

-- Location: IOIBUF_X10_Y17_N8
\iX[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(5),
	o => \iX[5]~input_o\);

-- Location: LCCOMB_X9_Y15_N18
\oY_uslovna~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oY_uslovna~1_combout\ = (\iX[7]~input_o\) # ((!\iX[6]~input_o\ & ((\oY_uslovna~0_combout\) # (\iX[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[7]~input_o\,
	datab => \oY_uslovna~0_combout\,
	datac => \iX[6]~input_o\,
	datad => \iX[5]~input_o\,
	combout => \oY_uslovna~1_combout\);

-- Location: LCCOMB_X9_Y15_N4
\oY_uslovna~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oY_uslovna~2_combout\ = (!\iX[5]~input_o\ & (!\iX[4]~input_o\ & ((\iX[2]~input_o\) # (\iX[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[2]~input_o\,
	datab => \iX[5]~input_o\,
	datac => \iX[3]~input_o\,
	datad => \iX[4]~input_o\,
	combout => \oY_uslovna~2_combout\);

-- Location: LCCOMB_X9_Y15_N14
\oY_uslovna~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oY_uslovna~3_combout\ = (\oY_uslovna~2_combout\) # ((\iX[6]~input_o\) # (\iX[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \oY_uslovna~2_combout\,
	datac => \iX[6]~input_o\,
	datad => \iX[7]~input_o\,
	combout => \oY_uslovna~3_combout\);

-- Location: LCCOMB_X9_Y15_N16
\oY_uslovna~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oY_uslovna~4_combout\ = (\iX[7]~input_o\) # ((\iX[5]~input_o\) # ((\iX[6]~input_o\) # (\iX[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[7]~input_o\,
	datab => \iX[5]~input_o\,
	datac => \iX[6]~input_o\,
	datad => \iX[4]~input_o\,
	combout => \oY_uslovna~4_combout\);

-- Location: LCCOMB_X9_Y15_N30
\Mux2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~1_combout\ = (!\iX[6]~input_o\ & ((\iX[1]~input_o\ & (!\iX[5]~input_o\ & !\iX[7]~input_o\)) # (!\iX[1]~input_o\ & (\iX[5]~input_o\ $ (\iX[7]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[1]~input_o\,
	datab => \iX[5]~input_o\,
	datac => \iX[6]~input_o\,
	datad => \iX[7]~input_o\,
	combout => \Mux2~1_combout\);

-- Location: IOIBUF_X12_Y17_N29
\iX[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iX(0),
	o => \iX[0]~input_o\);

-- Location: LCCOMB_X9_Y15_N2
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\iX[1]~input_o\) # ((\iX[5]~input_o\) # ((\iX[6]~input_o\) # (\iX[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[1]~input_o\,
	datab => \iX[5]~input_o\,
	datac => \iX[6]~input_o\,
	datad => \iX[7]~input_o\,
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X9_Y15_N12
\Mux2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~0_combout\ = (!\iX[0]~input_o\ & (!\iX[4]~input_o\ & ((!\iX[3]~input_o\) # (!\Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[0]~input_o\,
	datab => \Mux0~0_combout\,
	datac => \iX[3]~input_o\,
	datad => \iX[4]~input_o\,
	combout => \Mux2~0_combout\);

-- Location: LCCOMB_X9_Y15_N24
\Mux2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux2~2_combout\ = (\iX[2]~input_o\) # (((!\Mux2~1_combout\ & !\iX[3]~input_o\)) # (!\Mux2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~1_combout\,
	datab => \iX[2]~input_o\,
	datac => \iX[3]~input_o\,
	datad => \Mux2~0_combout\,
	combout => \Mux2~2_combout\);

-- Location: LCCOMB_X9_Y15_N20
\Mux1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~1_combout\ = (\iX[3]~input_o\ & (\iX[2]~input_o\)) # (!\iX[3]~input_o\ & ((\iX[2]~input_o\ & ((\iX[6]~input_o\) # (\iX[7]~input_o\))) # (!\iX[2]~input_o\ & (\iX[6]~input_o\ $ (!\iX[7]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[3]~input_o\,
	datab => \iX[2]~input_o\,
	datac => \iX[6]~input_o\,
	datad => \iX[7]~input_o\,
	combout => \Mux1~1_combout\);

-- Location: LCCOMB_X9_Y15_N10
\Mux1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~0_combout\ = (!\iX[3]~input_o\ & ((\iX[5]~input_o\) # (\iX[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[3]~input_o\,
	datab => \iX[5]~input_o\,
	datac => \iX[1]~input_o\,
	combout => \Mux1~0_combout\);

-- Location: LCCOMB_X9_Y15_N6
\Mux1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux1~2_combout\ = ((\Mux1~1_combout\) # (\Mux1~0_combout\)) # (!\Mux2~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Mux2~0_combout\,
	datab => \Mux1~1_combout\,
	datad => \Mux1~0_combout\,
	combout => \Mux1~2_combout\);

-- Location: LCCOMB_X9_Y15_N0
\Mux0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\iX[0]~input_o\) # ((\iX[2]~input_o\) # (\iX[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[0]~input_o\,
	datab => \iX[2]~input_o\,
	datac => \iX[3]~input_o\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X9_Y15_N26
\Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (!\iX[1]~input_o\ & ((\iX[5]~input_o\ & (!\iX[6]~input_o\ & !\iX[7]~input_o\)) # (!\iX[5]~input_o\ & (\iX[6]~input_o\ $ (\iX[7]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[1]~input_o\,
	datab => \iX[5]~input_o\,
	datac => \iX[6]~input_o\,
	datad => \iX[7]~input_o\,
	combout => \Mux0~2_combout\);

-- Location: LCCOMB_X9_Y15_N28
\Mux0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~3_combout\ = (\Mux0~1_combout\) # ((\iX[4]~input_o\ & ((\Mux0~0_combout\))) # (!\iX[4]~input_o\ & (!\Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iX[4]~input_o\,
	datab => \Mux0~1_combout\,
	datac => \Mux0~2_combout\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~3_combout\);

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

ww_oY_uslovna(0) <= \oY_uslovna[0]~output_o\;

ww_oY_uslovna(1) <= \oY_uslovna[1]~output_o\;

ww_oY_uslovna(2) <= \oY_uslovna[2]~output_o\;

ww_oY_if(0) <= \oY_if[0]~output_o\;

ww_oY_if(1) <= \oY_if[1]~output_o\;

ww_oY_if(2) <= \oY_if[2]~output_o\;

ww_oY_case(0) <= \oY_case[0]~output_o\;

ww_oY_case(1) <= \oY_case[1]~output_o\;

ww_oY_case(2) <= \oY_case[2]~output_o\;
END structure;


