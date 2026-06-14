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

-- DATE "11/28/2021 15:48:38"

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

ENTITY 	BarelovPomerac IS
    PORT (
	iA : IN std_logic_vector(7 DOWNTO 0);
	iB : IN std_logic_vector(2 DOWNTO 0);
	oRESULT : OUT std_logic_vector(2 DOWNTO 0)
	);
END BarelovPomerac;

-- Design Ports Information
-- oRESULT[0]	=>  Location: PIN_M3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[1]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[2]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[4]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[5]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[6]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[0]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BarelovPomerac IS
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
SIGNAL ww_oRESULT : std_logic_vector(2 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oRESULT[0]~output_o\ : std_logic;
SIGNAL \oRESULT[1]~output_o\ : std_logic;
SIGNAL \oRESULT[2]~output_o\ : std_logic;
SIGNAL \iA[7]~input_o\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \sMux3[4]~1_combout\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \sMux3[6]~0_combout\ : std_logic;
SIGNAL \iA[5]~input_o\ : std_logic;
SIGNAL \iA[4]~input_o\ : std_logic;
SIGNAL \sLogickoLevo2[7]~0_combout\ : std_logic;
SIGNAL \iA[6]~input_o\ : std_logic;
SIGNAL \sMux3[7]~2_combout\ : std_logic;
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \sLogickoLevo2[3]~2_combout\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \sLogickoLevo2[5]~1_combout\ : std_logic;
SIGNAL \sLogickoLevo4[7]~0_combout\ : std_logic;
SIGNAL \sMux3[7]~3_combout\ : std_logic;
SIGNAL \sMux3[4]~4_combout\ : std_logic;
SIGNAL \sLogickoLevo2[6]~3_combout\ : std_logic;
SIGNAL \sMux3[4]~5_combout\ : std_logic;
SIGNAL \sMux3[4]~6_combout\ : std_logic;
SIGNAL \sCoder~0_combout\ : std_logic;
SIGNAL \sLogickoLevo4[6]~1_combout\ : std_logic;
SIGNAL \sCoder~1_combout\ : std_logic;
SIGNAL \sMux3[5]~7_combout\ : std_logic;
SIGNAL \sMux3[5]~8_combout\ : std_logic;
SIGNAL \sMux3[6]~9_combout\ : std_logic;
SIGNAL \sMux3[6]~10_combout\ : std_logic;
SIGNAL \sCoder~2_combout\ : std_logic;
SIGNAL \sCoder~3_combout\ : std_logic;
SIGNAL \sCoder~4_combout\ : std_logic;
SIGNAL \sMux3[4]~11_combout\ : std_logic;
SIGNAL \sCoder~5_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iA <= iA;
ww_iB <= iB;
oRESULT <= ww_oRESULT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y27_N24
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

-- Location: IOOBUF_X0_Y3_N16
\oRESULT[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sCoder~2_combout\,
	devoe => ww_devoe,
	o => \oRESULT[0]~output_o\);

-- Location: IOOBUF_X6_Y0_N16
\oRESULT[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sCoder~4_combout\,
	devoe => ww_devoe,
	o => \oRESULT[1]~output_o\);

-- Location: IOOBUF_X0_Y3_N9
\oRESULT[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sCoder~5_combout\,
	devoe => ww_devoe,
	o => \oRESULT[2]~output_o\);

-- Location: IOIBUF_X8_Y0_N22
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

-- Location: IOIBUF_X6_Y0_N22
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

-- Location: IOIBUF_X14_Y0_N15
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

-- Location: LCCOMB_X9_Y1_N10
\sMux3[4]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[4]~1_combout\ = (!\iB[2]~input_o\ & !\iB[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iB[2]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sMux3[4]~1_combout\);

-- Location: IOIBUF_X14_Y0_N8
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

-- Location: LCCOMB_X9_Y1_N0
\sMux3[6]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[6]~0_combout\ = (\iB[2]~input_o\) # ((!\iB[0]~input_o\ & !\iB[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iB[0]~input_o\,
	datac => \iB[2]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sMux3[6]~0_combout\);

-- Location: IOIBUF_X8_Y0_N15
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

-- Location: IOIBUF_X0_Y3_N1
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

-- Location: LCCOMB_X8_Y1_N16
\sLogickoLevo2[7]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sLogickoLevo2[7]~0_combout\ = (\iB[0]~input_o\ & ((\iA[4]~input_o\))) # (!\iB[0]~input_o\ & (\iA[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[5]~input_o\,
	datab => \iA[4]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \sLogickoLevo2[7]~0_combout\);

-- Location: IOIBUF_X16_Y0_N1
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

-- Location: LCCOMB_X9_Y1_N28
\sMux3[7]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[7]~2_combout\ = (\sMux3[4]~1_combout\ & (!\sMux3[6]~0_combout\ & ((\iA[6]~input_o\)))) # (!\sMux3[4]~1_combout\ & ((\sMux3[6]~0_combout\) # ((\sLogickoLevo2[7]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[4]~1_combout\,
	datab => \sMux3[6]~0_combout\,
	datac => \sLogickoLevo2[7]~0_combout\,
	datad => \iA[6]~input_o\,
	combout => \sMux3[7]~2_combout\);

-- Location: IOIBUF_X6_Y0_N29
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

-- Location: IOIBUF_X8_Y0_N29
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

-- Location: LCCOMB_X9_Y1_N30
\sLogickoLevo2[3]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sLogickoLevo2[3]~2_combout\ = (\iB[0]~input_o\ & (\iA[0]~input_o\)) # (!\iB[0]~input_o\ & ((\iA[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[0]~input_o\,
	datac => \iB[0]~input_o\,
	datad => \iA[1]~input_o\,
	combout => \sLogickoLevo2[3]~2_combout\);

-- Location: IOIBUF_X3_Y0_N8
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

-- Location: IOIBUF_X8_Y0_N8
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

-- Location: LCCOMB_X8_Y1_N26
\sLogickoLevo2[5]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sLogickoLevo2[5]~1_combout\ = (\iB[0]~input_o\ & ((\iA[2]~input_o\))) # (!\iB[0]~input_o\ & (\iA[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[3]~input_o\,
	datac => \iA[2]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \sLogickoLevo2[5]~1_combout\);

-- Location: LCCOMB_X9_Y1_N24
\sLogickoLevo4[7]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sLogickoLevo4[7]~0_combout\ = (\iB[1]~input_o\ & (!\sLogickoLevo2[3]~2_combout\)) # (!\iB[1]~input_o\ & ((!\sLogickoLevo2[5]~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sLogickoLevo2[3]~2_combout\,
	datac => \sLogickoLevo2[5]~1_combout\,
	datad => \iB[1]~input_o\,
	combout => \sLogickoLevo4[7]~0_combout\);

-- Location: LCCOMB_X8_Y1_N12
\sMux3[7]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[7]~3_combout\ = (\sMux3[7]~2_combout\ & (((!\sLogickoLevo4[7]~0_combout\) # (!\sMux3[6]~0_combout\)))) # (!\sMux3[7]~2_combout\ & (\iA[7]~input_o\ & (\sMux3[6]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[7]~input_o\,
	datab => \sMux3[7]~2_combout\,
	datac => \sMux3[6]~0_combout\,
	datad => \sLogickoLevo4[7]~0_combout\,
	combout => \sMux3[7]~3_combout\);

-- Location: LCCOMB_X9_Y1_N26
\sMux3[4]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[4]~4_combout\ = (!\iB[0]~input_o\ & (\iA[0]~input_o\ & (\iB[2]~input_o\ & !\iB[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iB[2]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sMux3[4]~4_combout\);

-- Location: LCCOMB_X8_Y1_N8
\sLogickoLevo2[6]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sLogickoLevo2[6]~3_combout\ = (\iB[0]~input_o\ & (\iA[3]~input_o\)) # (!\iB[0]~input_o\ & ((\iA[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[3]~input_o\,
	datab => \iA[4]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \sLogickoLevo2[6]~3_combout\);

-- Location: LCCOMB_X8_Y1_N14
\sMux3[4]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[4]~5_combout\ = (\iB[0]~input_o\ & (\iA[1]~input_o\)) # (!\iB[0]~input_o\ & ((\iA[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[1]~input_o\,
	datac => \iA[2]~input_o\,
	datad => \iB[0]~input_o\,
	combout => \sMux3[4]~5_combout\);

-- Location: LCCOMB_X9_Y1_N4
\sMux3[4]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[4]~6_combout\ = (!\iB[2]~input_o\ & ((\iB[1]~input_o\ & ((\sMux3[4]~5_combout\))) # (!\iB[1]~input_o\ & (\sLogickoLevo2[6]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sLogickoLevo2[6]~3_combout\,
	datab => \iB[1]~input_o\,
	datac => \iB[2]~input_o\,
	datad => \sMux3[4]~5_combout\,
	combout => \sMux3[4]~6_combout\);

-- Location: LCCOMB_X9_Y1_N22
\sCoder~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder~0_combout\ = (!\sMux3[4]~4_combout\ & (!\sMux3[4]~6_combout\ & !\iB[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[4]~4_combout\,
	datab => \sMux3[4]~6_combout\,
	datac => \iB[2]~input_o\,
	combout => \sCoder~0_combout\);

-- Location: LCCOMB_X9_Y1_N8
\sLogickoLevo4[6]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sLogickoLevo4[6]~1_combout\ = (\iB[1]~input_o\ & (((!\iB[0]~input_o\ & \iA[0]~input_o\)))) # (!\iB[1]~input_o\ & (\sMux3[4]~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[4]~5_combout\,
	datab => \iB[0]~input_o\,
	datac => \iA[0]~input_o\,
	datad => \iB[1]~input_o\,
	combout => \sLogickoLevo4[6]~1_combout\);

-- Location: LCCOMB_X9_Y1_N18
\sCoder~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder~1_combout\ = (\sCoder~0_combout\ & (((!\sLogickoLevo4[6]~1_combout\ & \sLogickoLevo2[3]~2_combout\)) # (!\sLogickoLevo4[7]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCoder~0_combout\,
	datab => \sLogickoLevo4[6]~1_combout\,
	datac => \sLogickoLevo2[3]~2_combout\,
	datad => \sLogickoLevo4[7]~0_combout\,
	combout => \sCoder~1_combout\);

-- Location: LCCOMB_X9_Y1_N12
\sMux3[5]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[5]~7_combout\ = (!\iB[2]~input_o\ & ((\iB[1]~input_o\ & (\sLogickoLevo2[5]~1_combout\)) # (!\iB[1]~input_o\ & ((\sLogickoLevo2[7]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sLogickoLevo2[5]~1_combout\,
	datab => \iB[2]~input_o\,
	datac => \sLogickoLevo2[7]~0_combout\,
	datad => \iB[1]~input_o\,
	combout => \sMux3[5]~7_combout\);

-- Location: LCCOMB_X9_Y1_N14
\sMux3[5]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[5]~8_combout\ = (\sMux3[5]~7_combout\) # ((\sLogickoLevo2[3]~2_combout\ & (!\iB[1]~input_o\ & \iB[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sLogickoLevo2[3]~2_combout\,
	datab => \iB[1]~input_o\,
	datac => \iB[2]~input_o\,
	datad => \sMux3[5]~7_combout\,
	combout => \sMux3[5]~8_combout\);

-- Location: LCCOMB_X9_Y1_N16
\sMux3[6]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[6]~9_combout\ = (\sMux3[4]~1_combout\ & ((\sMux3[6]~0_combout\ & ((\iA[6]~input_o\))) # (!\sMux3[6]~0_combout\ & (\iA[5]~input_o\)))) # (!\sMux3[4]~1_combout\ & (((\sMux3[6]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[4]~1_combout\,
	datab => \iA[5]~input_o\,
	datac => \sMux3[6]~0_combout\,
	datad => \iA[6]~input_o\,
	combout => \sMux3[6]~9_combout\);

-- Location: LCCOMB_X9_Y1_N2
\sMux3[6]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[6]~10_combout\ = (\sMux3[6]~9_combout\ & (((\sLogickoLevo4[6]~1_combout\) # (\sMux3[4]~1_combout\)))) # (!\sMux3[6]~9_combout\ & (\sLogickoLevo2[6]~3_combout\ & ((!\sMux3[4]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sLogickoLevo2[6]~3_combout\,
	datab => \sMux3[6]~9_combout\,
	datac => \sLogickoLevo4[6]~1_combout\,
	datad => \sMux3[4]~1_combout\,
	combout => \sMux3[6]~10_combout\);

-- Location: LCCOMB_X8_Y1_N2
\sCoder~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder~2_combout\ = (\sMux3[7]~3_combout\) # ((!\sMux3[6]~10_combout\ & ((\sCoder~1_combout\) # (\sMux3[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[7]~3_combout\,
	datab => \sCoder~1_combout\,
	datac => \sMux3[5]~8_combout\,
	datad => \sMux3[6]~10_combout\,
	combout => \sCoder~2_combout\);

-- Location: LCCOMB_X9_Y1_N20
\sCoder~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder~3_combout\ = (\sCoder~0_combout\ & (!\sMux3[5]~8_combout\ & ((\sLogickoLevo4[6]~1_combout\) # (!\sLogickoLevo4[7]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCoder~0_combout\,
	datab => \sLogickoLevo4[6]~1_combout\,
	datac => \sMux3[5]~8_combout\,
	datad => \sLogickoLevo4[7]~0_combout\,
	combout => \sCoder~3_combout\);

-- Location: LCCOMB_X7_Y3_N24
\sCoder~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder~4_combout\ = (\sCoder~3_combout\) # ((\sMux3[7]~3_combout\) # (\sMux3[6]~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCoder~3_combout\,
	datab => \sMux3[7]~3_combout\,
	datac => \sMux3[6]~10_combout\,
	combout => \sCoder~4_combout\);

-- Location: LCCOMB_X7_Y1_N0
\sMux3[4]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux3[4]~11_combout\ = (\sMux3[4]~6_combout\) # (\sMux3[4]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[4]~6_combout\,
	datad => \sMux3[4]~4_combout\,
	combout => \sMux3[4]~11_combout\);

-- Location: LCCOMB_X7_Y3_N2
\sCoder~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder~5_combout\ = (\sMux3[6]~10_combout\) # ((\sMux3[4]~11_combout\) # ((\sMux3[7]~3_combout\) # (\sMux3[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux3[6]~10_combout\,
	datab => \sMux3[4]~11_combout\,
	datac => \sMux3[7]~3_combout\,
	datad => \sMux3[5]~8_combout\,
	combout => \sCoder~5_combout\);

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

ww_oRESULT(0) <= \oRESULT[0]~output_o\;

ww_oRESULT(1) <= \oRESULT[1]~output_o\;

ww_oRESULT(2) <= \oRESULT[2]~output_o\;
END structure;


