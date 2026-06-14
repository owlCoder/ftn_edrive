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

-- DATE "11/29/2021 11:50:24"

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

ENTITY 	automat IS
    PORT (
	iCLK : IN std_logic;
	iRST : IN std_logic;
	iSTOP : IN std_logic;
	iRL : IN std_logic;
	iRR : IN std_logic;
	iSRA : IN std_logic;
	oDATA : OUT std_logic_vector(7 DOWNTO 0)
	);
END automat;

-- Design Ports Information
-- oDATA[0]	=>  Location: PIN_J5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[1]	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[2]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[3]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[4]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[5]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[6]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oDATA[7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRST	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRL	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSTOP	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iRR	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSRA	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF automat IS
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
SIGNAL ww_iRST : std_logic;
SIGNAL ww_iSTOP : std_logic;
SIGNAL ww_iRL : std_logic;
SIGNAL ww_iRR : std_logic;
SIGNAL ww_iSRA : std_logic;
SIGNAL ww_oDATA : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \iCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oDATA[0]~output_o\ : std_logic;
SIGNAL \oDATA[1]~output_o\ : std_logic;
SIGNAL \oDATA[2]~output_o\ : std_logic;
SIGNAL \oDATA[3]~output_o\ : std_logic;
SIGNAL \oDATA[4]~output_o\ : std_logic;
SIGNAL \oDATA[5]~output_o\ : std_logic;
SIGNAL \oDATA[6]~output_o\ : std_logic;
SIGNAL \oDATA[7]~output_o\ : std_logic;
SIGNAL \iCLK~input_o\ : std_logic;
SIGNAL \iCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \iSTOP~input_o\ : std_logic;
SIGNAL \iRL~input_o\ : std_logic;
SIGNAL \iSRA~input_o\ : std_logic;
SIGNAL \iRR~input_o\ : std_logic;
SIGNAL \sNEXT_STATE.IDLE~0_combout\ : std_logic;
SIGNAL \sNEXT_STATE.IDLE~1_combout\ : std_logic;
SIGNAL \iRST~input_o\ : std_logic;
SIGNAL \iRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \sSTATE.IDLE~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \sSTATE.ROT_LEFT~q\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \sSTATE.SHIFT_RIGHT_ARITH~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \sSTATE.ROT_RIGHT~q\ : std_logic;
SIGNAL \SNEXT_DATA~0_combout\ : std_logic;
SIGNAL \Selector9~0_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \Selector3~0_combout\ : std_logic;
SIGNAL \Selector3~1_combout\ : std_logic;
SIGNAL \Selector10~0_combout\ : std_logic;
SIGNAL sDATA : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_iRST~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iCLK <= iCLK;
ww_iRST <= iRST;
ww_iSTOP <= iSTOP;
ww_iRL <= iRL;
ww_iRR <= iRR;
ww_iSRA <= iSRA;
oDATA <= ww_oDATA;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\iRST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iRST~input_o\);

\iCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iCLK~input_o\);
\ALT_INV_iRST~inputclkctrl_outclk\ <= NOT \iRST~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y22_N16
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

-- Location: IOOBUF_X6_Y0_N2
\oDATA[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(0),
	devoe => ww_devoe,
	o => \oDATA[0]~output_o\);

-- Location: IOOBUF_X3_Y0_N9
\oDATA[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(1),
	devoe => ww_devoe,
	o => \oDATA[1]~output_o\);

-- Location: IOOBUF_X6_Y0_N16
\oDATA[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(2),
	devoe => ww_devoe,
	o => \oDATA[2]~output_o\);

-- Location: IOOBUF_X3_Y0_N16
\oDATA[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(3),
	devoe => ww_devoe,
	o => \oDATA[3]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\oDATA[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(4),
	devoe => ww_devoe,
	o => \oDATA[4]~output_o\);

-- Location: IOOBUF_X6_Y0_N9
\oDATA[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(5),
	devoe => ww_devoe,
	o => \oDATA[5]~output_o\);

-- Location: IOOBUF_X8_Y0_N30
\oDATA[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(6),
	devoe => ww_devoe,
	o => \oDATA[6]~output_o\);

-- Location: IOOBUF_X8_Y0_N23
\oDATA[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sDATA(7),
	devoe => ww_devoe,
	o => \oDATA[7]~output_o\);

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

-- Location: IOIBUF_X8_Y0_N15
\iSTOP~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSTOP,
	o => \iSTOP~input_o\);

-- Location: IOIBUF_X6_Y0_N22
\iRL~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iRL,
	o => \iRL~input_o\);

-- Location: IOIBUF_X6_Y0_N29
\iSRA~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iSRA,
	o => \iSRA~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\iRR~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iRR,
	o => \iRR~input_o\);

-- Location: LCCOMB_X7_Y4_N10
\sNEXT_STATE.IDLE~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sNEXT_STATE.IDLE~0_combout\ = (\sSTATE.IDLE~q\ & (!\iSTOP~input_o\)) # (!\sSTATE.IDLE~q\ & (((\iRR~input_o\) # (\iRL~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSTOP~input_o\,
	datab => \iRR~input_o\,
	datac => \iRL~input_o\,
	datad => \sSTATE.IDLE~q\,
	combout => \sNEXT_STATE.IDLE~0_combout\);

-- Location: LCCOMB_X7_Y4_N0
\sNEXT_STATE.IDLE~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sNEXT_STATE.IDLE~1_combout\ = (\sNEXT_STATE.IDLE~0_combout\) # ((\iSRA~input_o\ & !\sSTATE.IDLE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSRA~input_o\,
	datac => \sSTATE.IDLE~q\,
	datad => \sNEXT_STATE.IDLE~0_combout\,
	combout => \sNEXT_STATE.IDLE~1_combout\);

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

-- Location: FF_X7_Y4_N1
\sSTATE.IDLE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sNEXT_STATE.IDLE~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.IDLE~q\);

-- Location: LCCOMB_X7_Y4_N26
\Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\iSTOP~input_o\ & (\iRL~input_o\ & ((!\sSTATE.IDLE~q\)))) # (!\iSTOP~input_o\ & ((\sSTATE.ROT_LEFT~q\) # ((\iRL~input_o\ & !\sSTATE.IDLE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSTOP~input_o\,
	datab => \iRL~input_o\,
	datac => \sSTATE.ROT_LEFT~q\,
	datad => \sSTATE.IDLE~q\,
	combout => \Selector0~0_combout\);

-- Location: FF_X7_Y4_N27
\sSTATE.ROT_LEFT\ : dffeas
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
	q => \sSTATE.ROT_LEFT~q\);

-- Location: LCCOMB_X7_Y4_N24
\Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\iSRA~input_o\ & (!\iRR~input_o\ & (!\iRL~input_o\ & !\sSTATE.IDLE~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSRA~input_o\,
	datab => \iRR~input_o\,
	datac => \iRL~input_o\,
	datad => \sSTATE.IDLE~q\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X7_Y4_N14
\Selector2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\Selector2~0_combout\) # ((!\iSTOP~input_o\ & \sSTATE.SHIFT_RIGHT_ARITH~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSTOP~input_o\,
	datac => \sSTATE.SHIFT_RIGHT_ARITH~q\,
	datad => \Selector2~0_combout\,
	combout => \Selector2~1_combout\);

-- Location: FF_X7_Y4_N15
\sSTATE.SHIFT_RIGHT_ARITH\ : dffeas
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
	q => \sSTATE.SHIFT_RIGHT_ARITH~q\);

-- Location: LCCOMB_X7_Y4_N18
\Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!\iSTOP~input_o\ & \sSTATE.ROT_RIGHT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSTOP~input_o\,
	datad => \sSTATE.ROT_RIGHT~q\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X7_Y4_N16
\Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\Selector1~0_combout\) # ((!\iRL~input_o\ & (!\sSTATE.IDLE~q\ & \iRR~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iRL~input_o\,
	datab => \sSTATE.IDLE~q\,
	datac => \iRR~input_o\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~1_combout\);

-- Location: FF_X7_Y4_N17
\sSTATE.ROT_RIGHT\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector1~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sSTATE.ROT_RIGHT~q\);

-- Location: LCCOMB_X7_Y4_N20
\SNEXT_DATA~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \SNEXT_DATA~0_combout\ = (\sSTATE.SHIFT_RIGHT_ARITH~q\) # (\sSTATE.ROT_RIGHT~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sSTATE.SHIFT_RIGHT_ARITH~q\,
	datad => \sSTATE.ROT_RIGHT~q\,
	combout => \SNEXT_DATA~0_combout\);

-- Location: LCCOMB_X7_Y4_N30
\Selector9~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector9~0_combout\ = (\SNEXT_DATA~0_combout\ & (((sDATA(2))))) # (!\SNEXT_DATA~0_combout\ & (((sDATA(0))) # (!\sSTATE.ROT_LEFT~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sSTATE.ROT_LEFT~q\,
	datab => sDATA(0),
	datac => sDATA(2),
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector9~0_combout\);

-- Location: FF_X7_Y4_N31
\sDATA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector9~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(1));

-- Location: LCCOMB_X7_Y4_N8
\Selector8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (sDATA(1) & ((\sSTATE.ROT_LEFT~q\) # ((sDATA(3) & \SNEXT_DATA~0_combout\)))) # (!sDATA(1) & (((sDATA(3) & \SNEXT_DATA~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(1),
	datab => \sSTATE.ROT_LEFT~q\,
	datac => sDATA(3),
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector8~0_combout\);

-- Location: FF_X7_Y4_N9
\sDATA[2]\ : dffeas
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
	q => sDATA(2));

-- Location: LCCOMB_X7_Y4_N22
\Selector7~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (sDATA(4) & ((\SNEXT_DATA~0_combout\) # ((\sSTATE.ROT_LEFT~q\ & sDATA(2))))) # (!sDATA(4) & (\sSTATE.ROT_LEFT~q\ & (sDATA(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(4),
	datab => \sSTATE.ROT_LEFT~q\,
	datac => sDATA(2),
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector7~0_combout\);

-- Location: FF_X7_Y4_N23
\sDATA[3]\ : dffeas
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
	q => sDATA(3));

-- Location: LCCOMB_X7_Y4_N4
\Selector6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\SNEXT_DATA~0_combout\ & (((sDATA(5))))) # (!\SNEXT_DATA~0_combout\ & ((sDATA(3)) # ((!\sSTATE.ROT_LEFT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(3),
	datab => \sSTATE.ROT_LEFT~q\,
	datac => sDATA(5),
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector6~0_combout\);

-- Location: FF_X7_Y4_N5
\sDATA[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector6~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(4));

-- Location: LCCOMB_X7_Y4_N6
\Selector5~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\SNEXT_DATA~0_combout\ & (((sDATA(6))))) # (!\SNEXT_DATA~0_combout\ & ((sDATA(4)) # ((!\sSTATE.ROT_LEFT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(4),
	datab => \sSTATE.ROT_LEFT~q\,
	datac => sDATA(6),
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector5~0_combout\);

-- Location: FF_X7_Y4_N7
\sDATA[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector5~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(5));

-- Location: LCCOMB_X8_Y4_N20
\Selector4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (sDATA(5) & ((\sSTATE.ROT_LEFT~q\) # ((sDATA(7) & \SNEXT_DATA~0_combout\)))) # (!sDATA(5) & (sDATA(7) & ((\SNEXT_DATA~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(5),
	datab => sDATA(7),
	datac => \sSTATE.ROT_LEFT~q\,
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector4~0_combout\);

-- Location: FF_X8_Y4_N21
\sDATA[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector4~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(6));

-- Location: LCCOMB_X7_Y4_N2
\Selector3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~0_combout\ = (sDATA(7) & ((\sSTATE.SHIFT_RIGHT_ARITH~q\) # ((\sSTATE.ROT_RIGHT~q\ & sDATA(0))))) # (!sDATA(7) & (\sSTATE.ROT_RIGHT~q\ & (sDATA(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(7),
	datab => \sSTATE.ROT_RIGHT~q\,
	datac => sDATA(0),
	datad => \sSTATE.SHIFT_RIGHT_ARITH~q\,
	combout => \Selector3~0_combout\);

-- Location: LCCOMB_X7_Y4_N12
\Selector3~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector3~1_combout\ = (\Selector3~0_combout\) # ((\sSTATE.ROT_LEFT~q\ & sDATA(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sSTATE.ROT_LEFT~q\,
	datac => sDATA(6),
	datad => \Selector3~0_combout\,
	combout => \Selector3~1_combout\);

-- Location: FF_X7_Y4_N13
\sDATA[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector3~1_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(7));

-- Location: LCCOMB_X7_Y4_N28
\Selector10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector10~0_combout\ = (\SNEXT_DATA~0_combout\ & (((sDATA(1))))) # (!\SNEXT_DATA~0_combout\ & ((sDATA(7)) # ((!\sSTATE.ROT_LEFT~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(7),
	datab => \sSTATE.ROT_LEFT~q\,
	datac => sDATA(1),
	datad => \SNEXT_DATA~0_combout\,
	combout => \Selector10~0_combout\);

-- Location: FF_X7_Y4_N29
\sDATA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \Selector10~0_combout\,
	clrn => \ALT_INV_iRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(0));

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

ww_oDATA(0) <= \oDATA[0]~output_o\;

ww_oDATA(1) <= \oDATA[1]~output_o\;

ww_oDATA(2) <= \oDATA[2]~output_o\;

ww_oDATA(3) <= \oDATA[3]~output_o\;

ww_oDATA(4) <= \oDATA[4]~output_o\;

ww_oDATA(5) <= \oDATA[5]~output_o\;

ww_oDATA(6) <= \oDATA[6]~output_o\;

ww_oDATA(7) <= \oDATA[7]~output_o\;
END structure;


