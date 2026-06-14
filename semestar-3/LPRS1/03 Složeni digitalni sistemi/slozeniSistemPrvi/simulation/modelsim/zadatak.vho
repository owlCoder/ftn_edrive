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

-- DATE "11/01/2021 15:34:57"

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

ENTITY 	zadatak IS
    PORT (
	iA : IN std_logic_vector(7 DOWNTO 0);
	iB : IN std_logic_vector(2 DOWNTO 0);
	iSEL : IN std_logic_vector(1 DOWNTO 0);
	oY : OUT std_logic_vector(3 DOWNTO 0);
	oZERO : OUT std_logic
	);
END zadatak;

-- Design Ports Information
-- iA[0]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[0]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[1]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[2]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[3]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oZERO	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[4]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[5]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[6]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[7]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_H3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[0]	=>  Location: PIN_G4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF zadatak IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iB : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_iSEL : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_oY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_oZERO : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oY[0]~output_o\ : std_logic;
SIGNAL \oY[1]~output_o\ : std_logic;
SIGNAL \oY[2]~output_o\ : std_logic;
SIGNAL \oY[3]~output_o\ : std_logic;
SIGNAL \oZERO~output_o\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \sMUX~0_combout\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \iA[6]~input_o\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \iA[4]~input_o\ : std_logic;
SIGNAL \sCODER[0]~2_combout\ : std_logic;
SIGNAL \iA[5]~input_o\ : std_logic;
SIGNAL \iA[7]~input_o\ : std_logic;
SIGNAL \sCODER[0]~3_combout\ : std_logic;
SIGNAL \sMUX~1_combout\ : std_logic;
SIGNAL \sC[2]~0_combout\ : std_logic;
SIGNAL \sCODER[1]~0_combout\ : std_logic;
SIGNAL \sCODER[1]~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Add0~1_combout\ : std_logic;
SIGNAL \sMUX~2_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \sMUX~3_combout\ : std_logic;
SIGNAL \sMUX~4_combout\ : std_logic;
SIGNAL \sMUX~5_combout\ : std_logic;
SIGNAL \sMUX~7_combout\ : std_logic;
SIGNAL \sMUX~6_combout\ : std_logic;
SIGNAL \sMUX~8_combout\ : std_logic;
SIGNAL \sMUX~9_combout\ : std_logic;
SIGNAL \sMUX~10_combout\ : std_logic;
SIGNAL \sMUX~11_combout\ : std_logic;
SIGNAL \Equal10~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iA <= iA;
ww_iB <= iB;
ww_iSEL <= iSEL;
oY <= ww_oY;
oZERO <= ww_oZERO;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
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

-- Location: IOOBUF_X0_Y12_N16
\oY[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX~2_combout\,
	devoe => ww_devoe,
	o => \oY[0]~output_o\);

-- Location: IOOBUF_X8_Y17_N23
\oY[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX~5_combout\,
	devoe => ww_devoe,
	o => \oY[1]~output_o\);

-- Location: IOOBUF_X0_Y9_N2
\oY[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX~9_combout\,
	devoe => ww_devoe,
	o => \oY[2]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\oY[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMUX~11_combout\,
	devoe => ww_devoe,
	o => \oY[3]~output_o\);

-- Location: IOOBUF_X10_Y17_N2
\oZERO~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal10~0_combout\,
	devoe => ww_devoe,
	o => \oZERO~output_o\);

-- Location: IOIBUF_X8_Y17_N1
\iSEL[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(1),
	o => \iSEL[1]~input_o\);

-- Location: IOIBUF_X0_Y12_N22
\iSEL[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(0),
	o => \iSEL[0]~input_o\);

-- Location: IOIBUF_X12_Y17_N8
\iB[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(2),
	o => \iB[2]~input_o\);

-- Location: LCCOMB_X7_Y11_N26
\sMUX~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~0_combout\ = \iSEL[0]~input_o\ $ (((\iSEL[1]~input_o\ & \iB[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datac => \iSEL[0]~input_o\,
	datad => \iB[2]~input_o\,
	combout => \sMUX~0_combout\);

-- Location: IOIBUF_X0_Y11_N22
\iB[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(0),
	o => \iB[0]~input_o\);

-- Location: IOIBUF_X8_Y17_N15
\iB[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(1),
	o => \iB[1]~input_o\);

-- Location: IOIBUF_X0_Y9_N15
\iA[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(6),
	o => \iA[6]~input_o\);

-- Location: IOIBUF_X0_Y9_N8
\iA[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(2),
	o => \iA[2]~input_o\);

-- Location: IOIBUF_X0_Y8_N15
\iA[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(3),
	o => \iA[3]~input_o\);

-- Location: IOIBUF_X10_Y17_N15
\iA[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(1),
	o => \iA[1]~input_o\);

-- Location: IOIBUF_X0_Y14_N1
\iA[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(4),
	o => \iA[4]~input_o\);

-- Location: LCCOMB_X6_Y11_N4
\sCODER[0]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCODER[0]~2_combout\ = (!\iA[4]~input_o\ & ((\iA[3]~input_o\) # ((!\iA[2]~input_o\ & \iA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[3]~input_o\,
	datac => \iA[1]~input_o\,
	datad => \iA[4]~input_o\,
	combout => \sCODER[0]~2_combout\);

-- Location: IOIBUF_X10_Y17_N8
\iA[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(5),
	o => \iA[5]~input_o\);

-- Location: IOIBUF_X0_Y9_N22
\iA[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(7),
	o => \iA[7]~input_o\);

-- Location: LCCOMB_X6_Y11_N14
\sCODER[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCODER[0]~3_combout\ = (\iA[7]~input_o\) # ((!\iA[6]~input_o\ & ((\sCODER[0]~2_combout\) # (\iA[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[6]~input_o\,
	datab => \sCODER[0]~2_combout\,
	datac => \iA[5]~input_o\,
	datad => \iA[7]~input_o\,
	combout => \sCODER[0]~3_combout\);

-- Location: LCCOMB_X7_Y11_N12
\sMUX~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~1_combout\ = (\sMUX~0_combout\ & ((\iB[0]~input_o\) # ((\iB[1]~input_o\)))) # (!\sMUX~0_combout\ & (\iB[0]~input_o\ $ (((\sCODER[0]~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX~0_combout\,
	datab => \iB[0]~input_o\,
	datac => \iB[1]~input_o\,
	datad => \sCODER[0]~3_combout\,
	combout => \sMUX~1_combout\);

-- Location: LCCOMB_X6_Y11_N24
\sC[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sC[2]~0_combout\ = (\iA[6]~input_o\) # ((\iA[7]~input_o\) # ((\iA[5]~input_o\) # (\iA[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[6]~input_o\,
	datab => \iA[7]~input_o\,
	datac => \iA[5]~input_o\,
	datad => \iA[4]~input_o\,
	combout => \sC[2]~0_combout\);

-- Location: LCCOMB_X6_Y11_N0
\sCODER[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCODER[1]~0_combout\ = (!\iA[5]~input_o\ & (!\iA[4]~input_o\ & ((\iA[2]~input_o\) # (\iA[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[3]~input_o\,
	datac => \iA[5]~input_o\,
	datad => \iA[4]~input_o\,
	combout => \sCODER[1]~0_combout\);

-- Location: LCCOMB_X6_Y11_N2
\sCODER[1]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCODER[1]~1_combout\ = (\iA[6]~input_o\) # ((\iA[7]~input_o\) # (\sCODER[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[6]~input_o\,
	datac => \iA[7]~input_o\,
	datad => \sCODER[1]~0_combout\,
	combout => \sCODER[1]~1_combout\);

-- Location: LCCOMB_X7_Y11_N24
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\sCODER[1]~1_combout\ & ((\iB[1]~input_o\) # ((\iB[0]~input_o\ & \sCODER[0]~3_combout\)))) # (!\sCODER[1]~1_combout\ & (\iB[0]~input_o\ & (\iB[1]~input_o\ & \sCODER[0]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCODER[1]~1_combout\,
	datab => \iB[0]~input_o\,
	datac => \iB[1]~input_o\,
	datad => \sCODER[0]~3_combout\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X6_Y11_N10
\Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~1_combout\ = \sC[2]~0_combout\ $ (\iB[2]~input_o\ $ (\Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sC[2]~0_combout\,
	datac => \iB[2]~input_o\,
	datad => \Add0~0_combout\,
	combout => \Add0~1_combout\);

-- Location: LCCOMB_X7_Y11_N6
\sMUX~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~2_combout\ = (\sMUX~0_combout\ & ((\iSEL[1]~input_o\ & (!\sMUX~1_combout\)) # (!\iSEL[1]~input_o\ & ((\Add0~1_combout\))))) # (!\sMUX~0_combout\ & (\sMUX~1_combout\ & ((!\iSEL[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX~1_combout\,
	datab => \Add0~1_combout\,
	datac => \sMUX~0_combout\,
	datad => \iSEL[1]~input_o\,
	combout => \sMUX~2_combout\);

-- Location: LCCOMB_X6_Y11_N12
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\sC[2]~0_combout\ & ((\iB[2]~input_o\) # (!\Add0~0_combout\))) # (!\sC[2]~0_combout\ & (\iB[2]~input_o\ & !\Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sC[2]~0_combout\,
	datac => \iB[2]~input_o\,
	datad => \Add0~0_combout\,
	combout => \Add0~2_combout\);

-- Location: LCCOMB_X7_Y11_N16
\Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \sCODER[1]~1_combout\ $ (\iB[1]~input_o\ $ (((\iB[0]~input_o\) # (\sCODER[0]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCODER[1]~1_combout\,
	datab => \iB[0]~input_o\,
	datac => \iB[1]~input_o\,
	datad => \sCODER[0]~3_combout\,
	combout => \Add1~0_combout\);

-- Location: LCCOMB_X7_Y11_N10
\sMUX~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~3_combout\ = (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & (\Add0~2_combout\)) # (!\iSEL[0]~input_o\ & ((\Add1~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \Add1~0_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \sMUX~3_combout\);

-- Location: LCCOMB_X7_Y11_N28
\sMUX~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~4_combout\ = (\iSEL[1]~input_o\ & (\iB[0]~input_o\ & (\iSEL[0]~input_o\ $ (\iB[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \iB[0]~input_o\,
	datac => \iSEL[0]~input_o\,
	datad => \iB[2]~input_o\,
	combout => \sMUX~4_combout\);

-- Location: LCCOMB_X7_Y11_N30
\sMUX~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~5_combout\ = (\sMUX~3_combout\) # ((\sMUX~4_combout\ & !\iB[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX~3_combout\,
	datab => \sMUX~4_combout\,
	datac => \iB[1]~input_o\,
	combout => \sMUX~5_combout\);

-- Location: LCCOMB_X7_Y11_N18
\sMUX~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~7_combout\ = (\iSEL[1]~input_o\ & (!\iB[0]~input_o\ & (\iSEL[0]~input_o\ $ (\iB[2]~input_o\)))) # (!\iSEL[1]~input_o\ & (((\iSEL[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \iB[0]~input_o\,
	datac => \iSEL[0]~input_o\,
	datad => \iB[2]~input_o\,
	combout => \sMUX~7_combout\);

-- Location: LCCOMB_X7_Y11_N8
\sMUX~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~6_combout\ = (\iB[0]~input_o\ & (\sCODER[0]~3_combout\ & (\sCODER[1]~1_combout\ $ (\iB[1]~input_o\)))) # (!\iB[0]~input_o\ & (!\sCODER[0]~3_combout\ & (\sCODER[1]~1_combout\ $ (!\iB[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCODER[1]~1_combout\,
	datab => \iB[0]~input_o\,
	datac => \iB[1]~input_o\,
	datad => \sCODER[0]~3_combout\,
	combout => \sMUX~6_combout\);

-- Location: LCCOMB_X7_Y11_N20
\sMUX~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~8_combout\ = (\sMUX~7_combout\ & ((\iSEL[1]~input_o\ & ((\iB[1]~input_o\))) # (!\iSEL[1]~input_o\ & (\Add0~2_combout\)))) # (!\sMUX~7_combout\ & (((\iSEL[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~2_combout\,
	datab => \sMUX~7_combout\,
	datac => \iB[1]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \sMUX~8_combout\);

-- Location: LCCOMB_X7_Y11_N22
\sMUX~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~9_combout\ = (\sMUX~7_combout\ & (((\sMUX~8_combout\)))) # (!\sMUX~7_combout\ & (!\sMUX~8_combout\ & (\Add0~1_combout\ $ (!\sMUX~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \sMUX~7_combout\,
	datac => \sMUX~6_combout\,
	datad => \sMUX~8_combout\,
	combout => \sMUX~9_combout\);

-- Location: LCCOMB_X7_Y11_N0
\sMUX~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~10_combout\ = \Add0~2_combout\ $ (((\iSEL[0]~input_o\) # ((!\Add0~1_combout\ & \sMUX~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~1_combout\,
	datab => \sMUX~6_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \Add0~2_combout\,
	combout => \sMUX~10_combout\);

-- Location: LCCOMB_X7_Y11_N2
\sMUX~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~11_combout\ = (\iSEL[1]~input_o\ & (((\iB[1]~input_o\ & \sMUX~4_combout\)))) # (!\iSEL[1]~input_o\ & (((\iB[1]~input_o\ & \sMUX~4_combout\)) # (!\sMUX~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sMUX~10_combout\,
	datac => \iB[1]~input_o\,
	datad => \sMUX~4_combout\,
	combout => \sMUX~11_combout\);

-- Location: LCCOMB_X7_Y11_N4
\Equal10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal10~0_combout\ = (!\sMUX~5_combout\ & (!\sMUX~2_combout\ & (!\sMUX~9_combout\ & !\sMUX~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX~5_combout\,
	datab => \sMUX~2_combout\,
	datac => \sMUX~9_combout\,
	datad => \sMUX~11_combout\,
	combout => \Equal10~0_combout\);

-- Location: IOIBUF_X0_Y3_N15
\iA[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(0),
	o => \iA[0]~input_o\);

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

ww_oY(0) <= \oY[0]~output_o\;

ww_oY(1) <= \oY[1]~output_o\;

ww_oY(2) <= \oY[2]~output_o\;

ww_oY(3) <= \oY[3]~output_o\;

ww_oZERO <= \oZERO~output_o\;
END structure;


