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

-- DATE "12/09/2021 19:42:37"

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

ENTITY 	DS1 IS
    PORT (
	iCLK : IN std_logic;
	inRESET : IN std_logic;
	iSEL : IN std_logic_vector(5 DOWNTO 0);
	iD : IN std_logic_vector(3 DOWNTO 0);
	iWE : IN std_logic;
	oQ : OUT std_logic_vector(4 DOWNTO 0)
	);
END DS1;

-- Design Ports Information
-- oQ[0]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[1]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[2]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[3]	=>  Location: PIN_E5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[4]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[4]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[5]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[2]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[3]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inRESET	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[0]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[0]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iWE	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[1]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[2]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD[3]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DS1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iCLK : std_logic;
SIGNAL ww_inRESET : std_logic;
SIGNAL ww_iSEL : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_iD : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_iWE : std_logic;
SIGNAL ww_oQ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oQ[0]~output_o\ : std_logic;
SIGNAL \oQ[1]~output_o\ : std_logic;
SIGNAL \oQ[2]~output_o\ : std_logic;
SIGNAL \oQ[3]~output_o\ : std_logic;
SIGNAL \oQ[4]~output_o\ : std_logic;
SIGNAL \iCLK~input_o\ : std_logic;
SIGNAL \iCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \iSEL[2]~input_o\ : std_logic;
SIGNAL \inRESET~input_o\ : std_logic;
SIGNAL \iD[0]~input_o\ : std_logic;
SIGNAL \sR0~0_combout\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \iWE~input_o\ : std_logic;
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \sR1[3]~0_combout\ : std_logic;
SIGNAL \sR3[0]~feeder_combout\ : std_logic;
SIGNAL \sR3[3]~0_combout\ : std_logic;
SIGNAL \iSEL[3]~input_o\ : std_logic;
SIGNAL \sR2[0]~feeder_combout\ : std_logic;
SIGNAL \sR2[3]~0_combout\ : std_logic;
SIGNAL \sR0[3]~1_combout\ : std_logic;
SIGNAL \sA[0]~0_combout\ : std_logic;
SIGNAL \sA[0]~1_combout\ : std_logic;
SIGNAL \iSEL[4]~input_o\ : std_logic;
SIGNAL \iSEL[5]~input_o\ : std_logic;
SIGNAL \sB[0]~0_combout\ : std_logic;
SIGNAL \sB[0]~1_combout\ : std_logic;
SIGNAL \sREG_OUT[0]~5_combout\ : std_logic;
SIGNAL \iD[1]~input_o\ : std_logic;
SIGNAL \sR0~2_combout\ : std_logic;
SIGNAL \sR0[1]~feeder_combout\ : std_logic;
SIGNAL \sR1[1]~feeder_combout\ : std_logic;
SIGNAL \sB[1]~2_combout\ : std_logic;
SIGNAL \sB[1]~3_combout\ : std_logic;
SIGNAL \sA[1]~2_combout\ : std_logic;
SIGNAL \sA[1]~3_combout\ : std_logic;
SIGNAL \sREG_OUT[0]~6\ : std_logic;
SIGNAL \sREG_OUT[1]~7_combout\ : std_logic;
SIGNAL \iD[2]~input_o\ : std_logic;
SIGNAL \sR0~3_combout\ : std_logic;
SIGNAL \sR1[2]~feeder_combout\ : std_logic;
SIGNAL \sR0[2]~feeder_combout\ : std_logic;
SIGNAL \sB[2]~4_combout\ : std_logic;
SIGNAL \sB[2]~5_combout\ : std_logic;
SIGNAL \sA[2]~4_combout\ : std_logic;
SIGNAL \sA[2]~5_combout\ : std_logic;
SIGNAL \sREG_OUT[1]~8\ : std_logic;
SIGNAL \sREG_OUT[2]~9_combout\ : std_logic;
SIGNAL \iD[3]~input_o\ : std_logic;
SIGNAL \sR0~4_combout\ : std_logic;
SIGNAL \sR1[3]~feeder_combout\ : std_logic;
SIGNAL \sR0[3]~feeder_combout\ : std_logic;
SIGNAL \sB[3]~6_combout\ : std_logic;
SIGNAL \sB[3]~7_combout\ : std_logic;
SIGNAL \sA[3]~6_combout\ : std_logic;
SIGNAL \sA[3]~7_combout\ : std_logic;
SIGNAL \sREG_OUT[2]~10\ : std_logic;
SIGNAL \sREG_OUT[3]~11_combout\ : std_logic;
SIGNAL \sREG_OUT[3]~12\ : std_logic;
SIGNAL \sREG_OUT[4]~13_combout\ : std_logic;
SIGNAL sREG_OUT : std_logic_vector(4 DOWNTO 0);
SIGNAL sR1 : std_logic_vector(3 DOWNTO 0);
SIGNAL sR2 : std_logic_vector(3 DOWNTO 0);
SIGNAL sR0 : std_logic_vector(3 DOWNTO 0);
SIGNAL sR3 : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_inRESET~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iCLK <= iCLK;
ww_inRESET <= inRESET;
ww_iSEL <= iSEL;
ww_iD <= iD;
ww_iWE <= iWE;
oQ <= ww_oQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\iCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iCLK~input_o\);
\ALT_INV_inRESET~input_o\ <= NOT \inRESET~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y26_N20
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

-- Location: IOOBUF_X8_Y17_N2
\oQ[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG_OUT(0),
	devoe => ww_devoe,
	o => \oQ[0]~output_o\);

-- Location: IOOBUF_X8_Y17_N16
\oQ[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG_OUT(1),
	devoe => ww_devoe,
	o => \oQ[1]~output_o\);

-- Location: IOOBUF_X14_Y17_N2
\oQ[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG_OUT(2),
	devoe => ww_devoe,
	o => \oQ[2]~output_o\);

-- Location: IOOBUF_X0_Y15_N23
\oQ[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG_OUT(3),
	devoe => ww_devoe,
	o => \oQ[3]~output_o\);

-- Location: IOOBUF_X16_Y17_N23
\oQ[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG_OUT(4),
	devoe => ww_devoe,
	o => \oQ[4]~output_o\);

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

-- Location: IOIBUF_X8_Y17_N22
\iSEL[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(2),
	o => \iSEL[2]~input_o\);

-- Location: IOIBUF_X12_Y17_N29
\inRESET~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inRESET,
	o => \inRESET~input_o\);

-- Location: IOIBUF_X12_Y17_N8
\iD[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(0),
	o => \iD[0]~input_o\);

-- Location: LCCOMB_X12_Y16_N8
\sR0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0~0_combout\ = (\inRESET~input_o\ & \iD[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inRESET~input_o\,
	datac => \iD[0]~input_o\,
	combout => \sR0~0_combout\);

-- Location: IOIBUF_X12_Y17_N22
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

-- Location: IOIBUF_X12_Y17_N1
\iWE~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iWE,
	o => \iWE~input_o\);

-- Location: IOIBUF_X14_Y17_N22
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

-- Location: LCCOMB_X12_Y16_N10
\sR1[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR1[3]~0_combout\ = ((!\iSEL[1]~input_o\ & (\iWE~input_o\ & \iSEL[0]~input_o\))) # (!\inRESET~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inRESET~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => \iWE~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sR1[3]~0_combout\);

-- Location: FF_X10_Y16_N5
\sR1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~0_combout\,
	sload => VCC,
	ena => \sR1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR1(0));

-- Location: LCCOMB_X11_Y16_N30
\sR3[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR3[0]~feeder_combout\ = \sR0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~0_combout\,
	combout => \sR3[0]~feeder_combout\);

-- Location: LCCOMB_X12_Y16_N0
\sR3[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR3[3]~0_combout\ = ((\iSEL[1]~input_o\ & (\iWE~input_o\ & \iSEL[0]~input_o\))) # (!\inRESET~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inRESET~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => \iWE~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sR3[3]~0_combout\);

-- Location: FF_X11_Y16_N31
\sR3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR3[0]~feeder_combout\,
	ena => \sR3[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR3(0));

-- Location: IOIBUF_X10_Y17_N8
\iSEL[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(3),
	o => \iSEL[3]~input_o\);

-- Location: LCCOMB_X11_Y16_N4
\sR2[0]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR2[0]~feeder_combout\ = \sR0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~0_combout\,
	combout => \sR2[0]~feeder_combout\);

-- Location: LCCOMB_X12_Y16_N24
\sR2[3]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR2[3]~0_combout\ = ((\iSEL[1]~input_o\ & (\iWE~input_o\ & !\iSEL[0]~input_o\))) # (!\inRESET~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inRESET~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => \iWE~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sR2[3]~0_combout\);

-- Location: FF_X11_Y16_N5
\sR2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR2[0]~feeder_combout\,
	ena => \sR2[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR2(0));

-- Location: LCCOMB_X12_Y16_N6
\sR0[3]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0[3]~1_combout\ = ((!\iSEL[1]~input_o\ & (\iWE~input_o\ & !\iSEL[0]~input_o\))) # (!\inRESET~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inRESET~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => \iWE~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sR0[3]~1_combout\);

-- Location: FF_X10_Y16_N19
\sR0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~0_combout\,
	sload => VCC,
	ena => \sR0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR0(0));

-- Location: LCCOMB_X11_Y16_N0
\sA[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[0]~0_combout\ = (\iSEL[2]~input_o\ & (\iSEL[3]~input_o\)) # (!\iSEL[2]~input_o\ & ((\iSEL[3]~input_o\ & (sR2(0))) # (!\iSEL[3]~input_o\ & ((sR0(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \iSEL[3]~input_o\,
	datac => sR2(0),
	datad => sR0(0),
	combout => \sA[0]~0_combout\);

-- Location: LCCOMB_X11_Y16_N10
\sA[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[0]~1_combout\ = (\iSEL[2]~input_o\ & ((\sA[0]~0_combout\ & ((sR3(0)))) # (!\sA[0]~0_combout\ & (sR1(0))))) # (!\iSEL[2]~input_o\ & (((\sA[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => sR1(0),
	datac => sR3(0),
	datad => \sA[0]~0_combout\,
	combout => \sA[0]~1_combout\);

-- Location: IOIBUF_X10_Y17_N15
\iSEL[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(4),
	o => \iSEL[4]~input_o\);

-- Location: IOIBUF_X10_Y17_N1
\iSEL[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSEL(5),
	o => \iSEL[5]~input_o\);

-- Location: LCCOMB_X10_Y16_N16
\sB[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[0]~0_combout\ = (\iSEL[4]~input_o\ & (((\iSEL[5]~input_o\)))) # (!\iSEL[4]~input_o\ & ((\iSEL[5]~input_o\ & ((sR2(0)))) # (!\iSEL[5]~input_o\ & (sR0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[4]~input_o\,
	datab => sR0(0),
	datac => \iSEL[5]~input_o\,
	datad => sR2(0),
	combout => \sB[0]~0_combout\);

-- Location: LCCOMB_X10_Y16_N2
\sB[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[0]~1_combout\ = (\iSEL[4]~input_o\ & ((\sB[0]~0_combout\ & ((sR3(0)))) # (!\sB[0]~0_combout\ & (sR1(0))))) # (!\iSEL[4]~input_o\ & (((\sB[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[4]~input_o\,
	datab => sR1(0),
	datac => sR3(0),
	datad => \sB[0]~0_combout\,
	combout => \sB[0]~1_combout\);

-- Location: LCCOMB_X12_Y16_N14
\sREG_OUT[0]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sREG_OUT[0]~5_combout\ = (\sA[0]~1_combout\ & (\sB[0]~1_combout\ $ (VCC))) # (!\sA[0]~1_combout\ & (\sB[0]~1_combout\ & VCC))
-- \sREG_OUT[0]~6\ = CARRY((\sA[0]~1_combout\ & \sB[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sA[0]~1_combout\,
	datab => \sB[0]~1_combout\,
	datad => VCC,
	combout => \sREG_OUT[0]~5_combout\,
	cout => \sREG_OUT[0]~6\);

-- Location: FF_X12_Y16_N15
\sREG_OUT[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sREG_OUT[0]~5_combout\,
	sclr => \ALT_INV_inRESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG_OUT(0));

-- Location: IOIBUF_X12_Y17_N15
\iD[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(1),
	o => \iD[1]~input_o\);

-- Location: LCCOMB_X12_Y16_N26
\sR0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0~2_combout\ = (\inRESET~input_o\ & \iD[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inRESET~input_o\,
	datac => \iD[1]~input_o\,
	combout => \sR0~2_combout\);

-- Location: FF_X11_Y16_N13
\sR2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~2_combout\,
	sload => VCC,
	ena => \sR2[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR2(1));

-- Location: FF_X11_Y16_N27
\sR3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~2_combout\,
	sload => VCC,
	ena => \sR3[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR3(1));

-- Location: LCCOMB_X10_Y16_N14
\sR0[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0[1]~feeder_combout\ = \sR0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~2_combout\,
	combout => \sR0[1]~feeder_combout\);

-- Location: FF_X10_Y16_N15
\sR0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR0[1]~feeder_combout\,
	ena => \sR0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR0(1));

-- Location: LCCOMB_X10_Y16_N0
\sR1[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR1[1]~feeder_combout\ = \sR0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~2_combout\,
	combout => \sR1[1]~feeder_combout\);

-- Location: FF_X10_Y16_N1
\sR1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR1[1]~feeder_combout\,
	ena => \sR1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR1(1));

-- Location: LCCOMB_X10_Y16_N8
\sB[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[1]~2_combout\ = (\iSEL[4]~input_o\ & ((\iSEL[5]~input_o\) # ((sR1(1))))) # (!\iSEL[4]~input_o\ & (!\iSEL[5]~input_o\ & (sR0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[4]~input_o\,
	datab => \iSEL[5]~input_o\,
	datac => sR0(1),
	datad => sR1(1),
	combout => \sB[1]~2_combout\);

-- Location: LCCOMB_X11_Y16_N8
\sB[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[1]~3_combout\ = (\iSEL[5]~input_o\ & ((\sB[1]~2_combout\ & ((sR3(1)))) # (!\sB[1]~2_combout\ & (sR2(1))))) # (!\iSEL[5]~input_o\ & (((\sB[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sR2(1),
	datab => \iSEL[5]~input_o\,
	datac => sR3(1),
	datad => \sB[1]~2_combout\,
	combout => \sB[1]~3_combout\);

-- Location: LCCOMB_X10_Y16_N10
\sA[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[1]~2_combout\ = (\iSEL[2]~input_o\ & ((\iSEL[3]~input_o\) # ((sR1(1))))) # (!\iSEL[2]~input_o\ & (!\iSEL[3]~input_o\ & (sR0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \iSEL[3]~input_o\,
	datac => sR0(1),
	datad => sR1(1),
	combout => \sA[1]~2_combout\);

-- Location: LCCOMB_X11_Y16_N6
\sA[1]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[1]~3_combout\ = (\iSEL[3]~input_o\ & ((\sA[1]~2_combout\ & ((sR3(1)))) # (!\sA[1]~2_combout\ & (sR2(1))))) # (!\iSEL[3]~input_o\ & (((\sA[1]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sR2(1),
	datab => \iSEL[3]~input_o\,
	datac => sR3(1),
	datad => \sA[1]~2_combout\,
	combout => \sA[1]~3_combout\);

-- Location: LCCOMB_X12_Y16_N16
\sREG_OUT[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sREG_OUT[1]~7_combout\ = (\sB[1]~3_combout\ & ((\sA[1]~3_combout\ & (\sREG_OUT[0]~6\ & VCC)) # (!\sA[1]~3_combout\ & (!\sREG_OUT[0]~6\)))) # (!\sB[1]~3_combout\ & ((\sA[1]~3_combout\ & (!\sREG_OUT[0]~6\)) # (!\sA[1]~3_combout\ & ((\sREG_OUT[0]~6\) # 
-- (GND)))))
-- \sREG_OUT[1]~8\ = CARRY((\sB[1]~3_combout\ & (!\sA[1]~3_combout\ & !\sREG_OUT[0]~6\)) # (!\sB[1]~3_combout\ & ((!\sREG_OUT[0]~6\) # (!\sA[1]~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sB[1]~3_combout\,
	datab => \sA[1]~3_combout\,
	datad => VCC,
	cin => \sREG_OUT[0]~6\,
	combout => \sREG_OUT[1]~7_combout\,
	cout => \sREG_OUT[1]~8\);

-- Location: FF_X12_Y16_N17
\sREG_OUT[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sREG_OUT[1]~7_combout\,
	sclr => \ALT_INV_inRESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG_OUT(1));

-- Location: IOIBUF_X16_Y17_N1
\iD[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(2),
	o => \iD[2]~input_o\);

-- Location: LCCOMB_X12_Y16_N28
\sR0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0~3_combout\ = (\inRESET~input_o\ & \iD[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inRESET~input_o\,
	datad => \iD[2]~input_o\,
	combout => \sR0~3_combout\);

-- Location: LCCOMB_X10_Y16_N24
\sR1[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR1[2]~feeder_combout\ = \sR0~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~3_combout\,
	combout => \sR1[2]~feeder_combout\);

-- Location: FF_X10_Y16_N25
\sR1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR1[2]~feeder_combout\,
	ena => \sR1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR1(2));

-- Location: FF_X11_Y16_N23
\sR3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~3_combout\,
	sload => VCC,
	ena => \sR3[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR3(2));

-- Location: LCCOMB_X10_Y16_N22
\sR0[2]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0[2]~feeder_combout\ = \sR0~3_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~3_combout\,
	combout => \sR0[2]~feeder_combout\);

-- Location: FF_X10_Y16_N23
\sR0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR0[2]~feeder_combout\,
	ena => \sR0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR0(2));

-- Location: FF_X11_Y16_N25
\sR2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~3_combout\,
	sload => VCC,
	ena => \sR2[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR2(2));

-- Location: LCCOMB_X10_Y16_N12
\sB[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[2]~4_combout\ = (\iSEL[4]~input_o\ & (\iSEL[5]~input_o\)) # (!\iSEL[4]~input_o\ & ((\iSEL[5]~input_o\ & ((sR2(2)))) # (!\iSEL[5]~input_o\ & (sR0(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[4]~input_o\,
	datab => \iSEL[5]~input_o\,
	datac => sR0(2),
	datad => sR2(2),
	combout => \sB[2]~4_combout\);

-- Location: LCCOMB_X11_Y16_N16
\sB[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[2]~5_combout\ = (\iSEL[4]~input_o\ & ((\sB[2]~4_combout\ & ((sR3(2)))) # (!\sB[2]~4_combout\ & (sR1(2))))) # (!\iSEL[4]~input_o\ & (((\sB[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[4]~input_o\,
	datab => sR1(2),
	datac => sR3(2),
	datad => \sB[2]~4_combout\,
	combout => \sB[2]~5_combout\);

-- Location: LCCOMB_X11_Y16_N2
\sA[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[2]~4_combout\ = (\iSEL[3]~input_o\ & ((sR2(2)) # ((\iSEL[2]~input_o\)))) # (!\iSEL[3]~input_o\ & (((!\iSEL[2]~input_o\ & sR0(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[3]~input_o\,
	datab => sR2(2),
	datac => \iSEL[2]~input_o\,
	datad => sR0(2),
	combout => \sA[2]~4_combout\);

-- Location: LCCOMB_X11_Y16_N20
\sA[2]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[2]~5_combout\ = (\iSEL[2]~input_o\ & ((\sA[2]~4_combout\ & ((sR3(2)))) # (!\sA[2]~4_combout\ & (sR1(2))))) # (!\iSEL[2]~input_o\ & (((\sA[2]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => sR1(2),
	datac => sR3(2),
	datad => \sA[2]~4_combout\,
	combout => \sA[2]~5_combout\);

-- Location: LCCOMB_X12_Y16_N18
\sREG_OUT[2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sREG_OUT[2]~9_combout\ = ((\sB[2]~5_combout\ $ (\sA[2]~5_combout\ $ (!\sREG_OUT[1]~8\)))) # (GND)
-- \sREG_OUT[2]~10\ = CARRY((\sB[2]~5_combout\ & ((\sA[2]~5_combout\) # (!\sREG_OUT[1]~8\))) # (!\sB[2]~5_combout\ & (\sA[2]~5_combout\ & !\sREG_OUT[1]~8\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sB[2]~5_combout\,
	datab => \sA[2]~5_combout\,
	datad => VCC,
	cin => \sREG_OUT[1]~8\,
	combout => \sREG_OUT[2]~9_combout\,
	cout => \sREG_OUT[2]~10\);

-- Location: FF_X12_Y16_N19
\sREG_OUT[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sREG_OUT[2]~9_combout\,
	sclr => \ALT_INV_inRESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG_OUT(2));

-- Location: IOIBUF_X14_Y17_N29
\iD[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD(3),
	o => \iD[3]~input_o\);

-- Location: LCCOMB_X12_Y16_N12
\sR0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0~4_combout\ = (\inRESET~input_o\ & \iD[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inRESET~input_o\,
	datad => \iD[3]~input_o\,
	combout => \sR0~4_combout\);

-- Location: FF_X11_Y16_N29
\sR3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~4_combout\,
	sload => VCC,
	ena => \sR3[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR3(3));

-- Location: FF_X11_Y16_N15
\sR2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \sR0~4_combout\,
	sload => VCC,
	ena => \sR2[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR2(3));

-- Location: LCCOMB_X10_Y16_N26
\sR1[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR1[3]~feeder_combout\ = \sR0~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~4_combout\,
	combout => \sR1[3]~feeder_combout\);

-- Location: FF_X10_Y16_N27
\sR1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR1[3]~feeder_combout\,
	ena => \sR1[3]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR1(3));

-- Location: LCCOMB_X10_Y16_N28
\sR0[3]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sR0[3]~feeder_combout\ = \sR0~4_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \sR0~4_combout\,
	combout => \sR0[3]~feeder_combout\);

-- Location: FF_X10_Y16_N29
\sR0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sR0[3]~feeder_combout\,
	ena => \sR0[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sR0(3));

-- Location: LCCOMB_X10_Y16_N30
\sB[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[3]~6_combout\ = (\iSEL[4]~input_o\ & ((\iSEL[5]~input_o\) # ((sR1(3))))) # (!\iSEL[4]~input_o\ & (!\iSEL[5]~input_o\ & ((sR0(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[4]~input_o\,
	datab => \iSEL[5]~input_o\,
	datac => sR1(3),
	datad => sR0(3),
	combout => \sB[3]~6_combout\);

-- Location: LCCOMB_X11_Y16_N14
\sB[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sB[3]~7_combout\ = (\iSEL[5]~input_o\ & ((\sB[3]~6_combout\ & (sR3(3))) # (!\sB[3]~6_combout\ & ((sR2(3)))))) # (!\iSEL[5]~input_o\ & (((\sB[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[5]~input_o\,
	datab => sR3(3),
	datac => sR2(3),
	datad => \sB[3]~6_combout\,
	combout => \sB[3]~7_combout\);

-- Location: LCCOMB_X10_Y16_N20
\sA[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[3]~6_combout\ = (\iSEL[2]~input_o\ & ((\iSEL[3]~input_o\) # ((sR1(3))))) # (!\iSEL[2]~input_o\ & (!\iSEL[3]~input_o\ & ((sR0(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \iSEL[3]~input_o\,
	datac => sR1(3),
	datad => sR0(3),
	combout => \sA[3]~6_combout\);

-- Location: LCCOMB_X11_Y16_N18
\sA[3]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sA[3]~7_combout\ = (\iSEL[3]~input_o\ & ((\sA[3]~6_combout\ & (sR3(3))) # (!\sA[3]~6_combout\ & ((sR2(3)))))) # (!\iSEL[3]~input_o\ & (((\sA[3]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[3]~input_o\,
	datab => sR3(3),
	datac => sR2(3),
	datad => \sA[3]~6_combout\,
	combout => \sA[3]~7_combout\);

-- Location: LCCOMB_X12_Y16_N20
\sREG_OUT[3]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sREG_OUT[3]~11_combout\ = (\sB[3]~7_combout\ & ((\sA[3]~7_combout\ & (\sREG_OUT[2]~10\ & VCC)) # (!\sA[3]~7_combout\ & (!\sREG_OUT[2]~10\)))) # (!\sB[3]~7_combout\ & ((\sA[3]~7_combout\ & (!\sREG_OUT[2]~10\)) # (!\sA[3]~7_combout\ & ((\sREG_OUT[2]~10\) # 
-- (GND)))))
-- \sREG_OUT[3]~12\ = CARRY((\sB[3]~7_combout\ & (!\sA[3]~7_combout\ & !\sREG_OUT[2]~10\)) # (!\sB[3]~7_combout\ & ((!\sREG_OUT[2]~10\) # (!\sA[3]~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \sB[3]~7_combout\,
	datab => \sA[3]~7_combout\,
	datad => VCC,
	cin => \sREG_OUT[2]~10\,
	combout => \sREG_OUT[3]~11_combout\,
	cout => \sREG_OUT[3]~12\);

-- Location: FF_X12_Y16_N21
\sREG_OUT[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sREG_OUT[3]~11_combout\,
	sclr => \ALT_INV_inRESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG_OUT(3));

-- Location: LCCOMB_X12_Y16_N22
\sREG_OUT[4]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sREG_OUT[4]~13_combout\ = !\sREG_OUT[3]~12\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \sREG_OUT[3]~12\,
	combout => \sREG_OUT[4]~13_combout\);

-- Location: FF_X12_Y16_N23
\sREG_OUT[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sREG_OUT[4]~13_combout\,
	sclr => \ALT_INV_inRESET~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG_OUT(4));

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

ww_oQ(0) <= \oQ[0]~output_o\;

ww_oQ(1) <= \oQ[1]~output_o\;

ww_oQ(2) <= \oQ[2]~output_o\;

ww_oQ(3) <= \oQ[3]~output_o\;

ww_oQ(4) <= \oQ[4]~output_o\;
END structure;


