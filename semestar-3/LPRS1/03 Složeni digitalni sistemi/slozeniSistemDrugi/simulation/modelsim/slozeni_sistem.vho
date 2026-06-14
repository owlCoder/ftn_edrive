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

-- DATE "11/01/2021 15:57:07"

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

ENTITY 	slozeni_sistem_2 IS
    PORT (
	iA : IN std_logic_vector(3 DOWNTO 0);
	iB : IN std_logic_vector(3 DOWNTO 0);
	iSEL : IN std_logic_vector(1 DOWNTO 0);
	oC : OUT std_logic_vector(3 DOWNTO 0)
	);
END slozeni_sistem_2;

-- Design Ports Information
-- oC[0]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oC[1]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oC[2]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oC[3]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[0]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[0]	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[3]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_H6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF slozeni_sistem_2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iA : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iB : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iSEL : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_oC : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oC[0]~output_o\ : std_logic;
SIGNAL \oC[1]~output_o\ : std_logic;
SIGNAL \oC[2]~output_o\ : std_logic;
SIGNAL \oC[3]~output_o\ : std_logic;
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \oC~0_combout\ : std_logic;
SIGNAL \oC~1_combout\ : std_logic;
SIGNAL \iB[3]~input_o\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \oC~2_combout\ : std_logic;
SIGNAL \sB[1]~0_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \oC~3_combout\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \Add1~1_combout\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \sB[2]~1_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \oC~4_combout\ : std_logic;
SIGNAL \oC~5_combout\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \sB[3]~2_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \oC~6_combout\ : std_logic;
SIGNAL \oC~7_combout\ : std_logic;

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
oC <= ww_oC;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y24_N16
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

-- Location: IOOBUF_X0_Y9_N2
\oC[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oC~1_combout\,
	devoe => ww_devoe,
	o => \oC[0]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\oC[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oC~3_combout\,
	devoe => ww_devoe,
	o => \oC[1]~output_o\);

-- Location: IOOBUF_X12_Y17_N23
\oC[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oC~5_combout\,
	devoe => ww_devoe,
	o => \oC[2]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\oC[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \oC~7_combout\,
	devoe => ww_devoe,
	o => \oC[3]~output_o\);

-- Location: IOIBUF_X0_Y9_N8
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

-- Location: IOIBUF_X8_Y17_N22
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

-- Location: LCCOMB_X1_Y9_N16
\Add2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = (\iB[0]~input_o\ & (\iA[0]~input_o\ $ (VCC))) # (!\iB[0]~input_o\ & (\iA[0]~input_o\ & VCC))
-- \Add2~1\ = CARRY((\iB[0]~input_o\ & \iA[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datab => \iA[0]~input_o\,
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

-- Location: IOIBUF_X0_Y14_N1
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

-- Location: IOIBUF_X0_Y8_N22
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

-- Location: LCCOMB_X1_Y9_N24
\oC~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~0_combout\ = \iSEL[1]~input_o\ $ (((\iSEL[0]~input_o\ & \iB[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[0]~input_o\,
	datac => \iB[0]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \oC~0_combout\);

-- Location: LCCOMB_X1_Y9_N2
\oC~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~1_combout\ = (\iSEL[0]~input_o\ & (((\oC~0_combout\)))) # (!\iSEL[0]~input_o\ & ((\oC~0_combout\ & ((\Add2~0_combout\))) # (!\oC~0_combout\ & (\iA[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[0]~input_o\,
	datab => \Add2~0_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \oC~0_combout\,
	combout => \oC~1_combout\);

-- Location: IOIBUF_X0_Y7_N1
\iB[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(3),
	o => \iB[3]~input_o\);

-- Location: IOIBUF_X10_Y17_N8
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

-- Location: LCCOMB_X1_Y9_N8
\Add1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \iB[1]~input_o\ $ (((\iB[0]~input_o\ & !\iB[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datac => \iB[3]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \Add1~0_combout\);

-- Location: IOIBUF_X0_Y8_N8
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

-- Location: LCCOMB_X1_Y9_N30
\oC~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~2_combout\ = (\iSEL[1]~input_o\ & (((\iSEL[0]~input_o\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & ((\iB[1]~input_o\))) # (!\iSEL[0]~input_o\ & (\iA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \iA[1]~input_o\,
	datac => \iSEL[0]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \oC~2_combout\);

-- Location: LCCOMB_X1_Y9_N12
\sB[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[1]~0_combout\ = \iB[1]~input_o\ $ (((\iB[0]~input_o\ & \iB[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datac => \iB[3]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sB[1]~0_combout\);

-- Location: LCCOMB_X1_Y9_N18
\Add2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (\sB[1]~0_combout\ & ((\iA[1]~input_o\ & (\Add2~1\ & VCC)) # (!\iA[1]~input_o\ & (!\Add2~1\)))) # (!\sB[1]~0_combout\ & ((\iA[1]~input_o\ & (!\Add2~1\)) # (!\iA[1]~input_o\ & ((\Add2~1\) # (GND)))))
-- \Add2~3\ = CARRY((\sB[1]~0_combout\ & (!\iA[1]~input_o\ & !\Add2~1\)) # (!\sB[1]~0_combout\ & ((!\Add2~1\) # (!\iA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sB[1]~0_combout\,
	datab => \iA[1]~input_o\,
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

-- Location: LCCOMB_X1_Y9_N26
\oC~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~3_combout\ = (\iSEL[1]~input_o\ & ((\oC~2_combout\ & (\Add1~0_combout\)) # (!\oC~2_combout\ & ((\Add2~2_combout\))))) # (!\iSEL[1]~input_o\ & (((\oC~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \Add1~0_combout\,
	datac => \oC~2_combout\,
	datad => \Add2~2_combout\,
	combout => \oC~3_combout\);

-- Location: IOIBUF_X0_Y12_N15
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

-- Location: LCCOMB_X6_Y13_N24
\Add1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~1_combout\ = \iB[2]~input_o\ $ (((\iB[1]~input_o\ & ((\iB[0]~input_o\) # (\iB[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datab => \iB[3]~input_o\,
	datac => \iB[2]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \Add1~1_combout\);

-- Location: IOIBUF_X0_Y11_N15
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

-- Location: LCCOMB_X1_Y9_N4
\sB[2]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[2]~1_combout\ = \iB[2]~input_o\ $ (((\iB[3]~input_o\ & ((\iB[0]~input_o\) # (\iB[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => \iB[2]~input_o\,
	datac => \iB[0]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sB[2]~1_combout\);

-- Location: LCCOMB_X1_Y9_N20
\Add2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = ((\iA[2]~input_o\ $ (\sB[2]~1_combout\ $ (!\Add2~3\)))) # (GND)
-- \Add2~5\ = CARRY((\iA[2]~input_o\ & ((\sB[2]~1_combout\) # (!\Add2~3\))) # (!\iA[2]~input_o\ & (\sB[2]~1_combout\ & !\Add2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \sB[2]~1_combout\,
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

-- Location: LCCOMB_X1_Y9_N6
\oC~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~4_combout\ = (\iSEL[0]~input_o\ & (((\iSEL[1]~input_o\)))) # (!\iSEL[0]~input_o\ & ((\iSEL[1]~input_o\ & ((\Add2~4_combout\))) # (!\iSEL[1]~input_o\ & (\iA[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \Add2~4_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \oC~4_combout\);

-- Location: LCCOMB_X6_Y13_N2
\oC~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~5_combout\ = (\iSEL[0]~input_o\ & ((\oC~4_combout\ & ((\Add1~1_combout\))) # (!\oC~4_combout\ & (\iB[2]~input_o\)))) # (!\iSEL[0]~input_o\ & (((\oC~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[2]~input_o\,
	datab => \Add1~1_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \oC~4_combout\,
	combout => \oC~5_combout\);

-- Location: LCCOMB_X1_Y9_N28
\Add1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\iB[3]~input_o\ & ((\iB[2]~input_o\) # ((\iB[1]~input_o\)))) # (!\iB[3]~input_o\ & (\iB[2]~input_o\ & (\iB[0]~input_o\ & \iB[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => \iB[2]~input_o\,
	datac => \iB[0]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \Add1~2_combout\);

-- Location: IOIBUF_X0_Y9_N22
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

-- Location: LCCOMB_X1_Y9_N0
\sB[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[3]~2_combout\ = (\iB[3]~input_o\ & ((\iB[2]~input_o\) # ((\iB[0]~input_o\) # (\iB[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => \iB[2]~input_o\,
	datac => \iB[0]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sB[3]~2_combout\);

-- Location: LCCOMB_X1_Y9_N22
\Add2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = \iA[3]~input_o\ $ (\Add2~5\ $ (\sB[3]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[3]~input_o\,
	datad => \sB[3]~2_combout\,
	cin => \Add2~5\,
	combout => \Add2~6_combout\);

-- Location: LCCOMB_X1_Y9_N10
\oC~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~6_combout\ = (\iSEL[0]~input_o\ & ((\iB[3]~input_o\) # ((\iSEL[1]~input_o\)))) # (!\iSEL[0]~input_o\ & (((\iA[3]~input_o\ & !\iSEL[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => \iA[3]~input_o\,
	datac => \iSEL[0]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \oC~6_combout\);

-- Location: LCCOMB_X1_Y9_N14
\oC~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \oC~7_combout\ = (\iSEL[1]~input_o\ & ((\oC~6_combout\ & (\Add1~2_combout\)) # (!\oC~6_combout\ & ((\Add2~6_combout\))))) # (!\iSEL[1]~input_o\ & (((\oC~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \Add1~2_combout\,
	datac => \Add2~6_combout\,
	datad => \oC~6_combout\,
	combout => \oC~7_combout\);

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

ww_oC(0) <= \oC[0]~output_o\;

ww_oC(1) <= \oC[1]~output_o\;

ww_oC(2) <= \oC[2]~output_o\;

ww_oC(3) <= \oC[3]~output_o\;
END structure;


