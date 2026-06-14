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

-- DATE "12/04/2021 20:23:46"

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

ENTITY 	DS IS
    PORT (
	iCLK : IN std_logic;
	inRST : IN std_logic;
	iD : IN std_logic;
	iEN : IN std_logic;
	iSEL : IN std_logic_vector(1 DOWNTO 0);
	oQ : BUFFER std_logic_vector(4 DOWNTO 0)
	);
END DS;

-- Design Ports Information
-- oQ[0]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[1]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[2]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[3]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oQ[4]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[0]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iCLK	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inRST	=>  Location: PIN_H4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iEN	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iD	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DS IS
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
SIGNAL ww_inRST : std_logic;
SIGNAL ww_iD : std_logic;
SIGNAL ww_iEN : std_logic;
SIGNAL ww_iSEL : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_oQ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inRST~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \iD~input_o\ : std_logic;
SIGNAL \inRST~input_o\ : std_logic;
SIGNAL \inRST~inputclkctrl_outclk\ : std_logic;
SIGNAL \iEN~input_o\ : std_logic;
SIGNAL \sMUX[0]~0_combout\ : std_logic;
SIGNAL \sMUX~1_combout\ : std_logic;
SIGNAL \sMUX~2_combout\ : std_logic;
SIGNAL \sMUX[0]~3_combout\ : std_logic;
SIGNAL \s_cnt1[0]~3_combout\ : std_logic;
SIGNAL \s_cnt1[2]~0_combout\ : std_logic;
SIGNAL \s_cnt1~2_combout\ : std_logic;
SIGNAL \s_cnt1~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \sMUX[1]~4_combout\ : std_logic;
SIGNAL \sMUX[1]~5_combout\ : std_logic;
SIGNAL \sMUX[2]~6_combout\ : std_logic;
SIGNAL \sMUX[2]~7_combout\ : std_logic;
SIGNAL \sMUX[3]~8_combout\ : std_logic;
SIGNAL \sMUX[3]~9_combout\ : std_logic;
SIGNAL \sMUX[4]~10_combout\ : std_logic;
SIGNAL sREG : std_logic_vector(4 DOWNTO 0);
SIGNAL sDATA : std_logic_vector(9 DOWNTO 0);
SIGNAL s_cnt1 : std_logic_vector(3 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iCLK <= iCLK;
ww_inRST <= inRST;
ww_iD <= iD;
ww_iEN <= iEN;
ww_iSEL <= iSEL;
oQ <= ww_oQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\inRST~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inRST~input_o\);

\iCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \iCLK~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X26_Y19_N12
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

-- Location: IOOBUF_X16_Y17_N9
\oQ[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG(0),
	devoe => ww_devoe,
	o => \oQ[0]~output_o\);

-- Location: IOOBUF_X19_Y17_N9
\oQ[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG(1),
	devoe => ww_devoe,
	o => \oQ[1]~output_o\);

-- Location: IOOBUF_X19_Y17_N2
\oQ[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG(2),
	devoe => ww_devoe,
	o => \oQ[2]~output_o\);

-- Location: IOOBUF_X25_Y22_N16
\oQ[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG(3),
	devoe => ww_devoe,
	o => \oQ[3]~output_o\);

-- Location: IOOBUF_X21_Y17_N30
\oQ[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => sREG(4),
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

-- Location: IOIBUF_X19_Y17_N29
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

-- Location: IOIBUF_X19_Y17_N22
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

-- Location: IOIBUF_X19_Y17_N15
\iD~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iD,
	o => \iD~input_o\);

-- Location: IOIBUF_X0_Y8_N22
\inRST~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inRST,
	o => \inRST~input_o\);

-- Location: CLKCTRL_G4
\inRST~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inRST~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inRST~inputclkctrl_outclk\);

-- Location: IOIBUF_X16_Y17_N22
\iEN~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iEN,
	o => \iEN~input_o\);

-- Location: FF_X26_Y17_N31
\sDATA[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => \iD~input_o\,
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(9));

-- Location: FF_X26_Y17_N13
\sDATA[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(9),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(8));

-- Location: FF_X26_Y17_N17
\sDATA[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(8),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(7));

-- Location: FF_X26_Y17_N15
\sDATA[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(7),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(6));

-- Location: FF_X26_Y17_N19
\sDATA[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(6),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(5));

-- Location: LCCOMB_X26_Y17_N18
\sMUX[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[0]~0_combout\ = (\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & ((sDATA(7)))) # (!\iSEL[0]~input_o\ & (sDATA(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[0]~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => sDATA(5),
	datad => sDATA(7),
	combout => \sMUX[0]~0_combout\);

-- Location: FF_X26_Y17_N27
\sDATA[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(5),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(4));

-- Location: FF_X26_Y17_N25
\sDATA[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(4),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(3));

-- Location: FF_X26_Y17_N5
\sDATA[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(3),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(2));

-- Location: FF_X26_Y17_N3
\sDATA[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(2),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(1));

-- Location: FF_X26_Y17_N21
\sDATA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	asdata => sDATA(1),
	clrn => \inRST~inputclkctrl_outclk\,
	sload => VCC,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sDATA(0));

-- Location: LCCOMB_X26_Y17_N10
\sMUX~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~1_combout\ = (sDATA(4) & ((sDATA(0)) # ((sDATA(2)) # (sDATA(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(4),
	datab => sDATA(0),
	datac => sDATA(2),
	datad => sDATA(1),
	combout => \sMUX~1_combout\);

-- Location: LCCOMB_X26_Y17_N24
\sMUX~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX~2_combout\ = (\iSEL[1]~input_o\) # ((!\iSEL[0]~input_o\ & (sDATA(3) & \sMUX~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[0]~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => sDATA(3),
	datad => \sMUX~1_combout\,
	combout => \sMUX~2_combout\);

-- Location: LCCOMB_X26_Y17_N22
\sMUX[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[0]~3_combout\ = (\sMUX[0]~0_combout\) # ((sDATA(0) & !\sMUX~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sMUX[0]~0_combout\,
	datac => sDATA(0),
	datad => \sMUX~2_combout\,
	combout => \sMUX[0]~3_combout\);

-- Location: LCCOMB_X27_Y17_N26
\s_cnt1[0]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1[0]~3_combout\ = !s_cnt1(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_cnt1(0),
	combout => \s_cnt1[0]~3_combout\);

-- Location: FF_X27_Y17_N27
\s_cnt1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_cnt1[0]~3_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(0));

-- Location: LCCOMB_X27_Y17_N28
\s_cnt1[2]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1[2]~0_combout\ = s_cnt1(2) $ (((\iEN~input_o\ & (s_cnt1(0) & s_cnt1(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iEN~input_o\,
	datab => s_cnt1(0),
	datac => s_cnt1(2),
	datad => s_cnt1(1),
	combout => \s_cnt1[2]~0_combout\);

-- Location: FF_X27_Y17_N29
\s_cnt1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_cnt1[2]~0_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(2));

-- Location: LCCOMB_X27_Y17_N20
\s_cnt1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1~2_combout\ = (s_cnt1(2) & (s_cnt1(3) $ (((s_cnt1(0) & s_cnt1(1)))))) # (!s_cnt1(2) & (s_cnt1(3) & ((s_cnt1(1)) # (!s_cnt1(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt1(2),
	datab => s_cnt1(0),
	datac => s_cnt1(3),
	datad => s_cnt1(1),
	combout => \s_cnt1~2_combout\);

-- Location: FF_X27_Y17_N21
\s_cnt1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_cnt1~2_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(3));

-- Location: LCCOMB_X27_Y17_N30
\s_cnt1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt1~1_combout\ = (s_cnt1(0) & (!s_cnt1(1) & ((s_cnt1(2)) # (!s_cnt1(3))))) # (!s_cnt1(0) & (((s_cnt1(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt1(2),
	datab => s_cnt1(0),
	datac => s_cnt1(1),
	datad => s_cnt1(3),
	combout => \s_cnt1~1_combout\);

-- Location: FF_X27_Y17_N31
\s_cnt1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \s_cnt1~1_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \iEN~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt1(1));

-- Location: LCCOMB_X27_Y17_N24
\Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (!s_cnt1(1) & (!s_cnt1(3) & (!s_cnt1(0) & !s_cnt1(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt1(1),
	datab => s_cnt1(3),
	datac => s_cnt1(0),
	datad => s_cnt1(2),
	combout => \Equal1~0_combout\);

-- Location: FF_X26_Y17_N23
\sREG[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sMUX[0]~3_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG(0));

-- Location: LCCOMB_X26_Y17_N14
\sMUX[1]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[1]~4_combout\ = (\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & (sDATA(8))) # (!\iSEL[0]~input_o\ & ((sDATA(6))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[0]~input_o\,
	datab => sDATA(8),
	datac => sDATA(6),
	datad => \iSEL[1]~input_o\,
	combout => \sMUX[1]~4_combout\);

-- Location: LCCOMB_X26_Y17_N8
\sMUX[1]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[1]~5_combout\ = (\sMUX[1]~4_combout\) # ((sDATA(1) & !\sMUX~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMUX[1]~4_combout\,
	datac => sDATA(1),
	datad => \sMUX~2_combout\,
	combout => \sMUX[1]~5_combout\);

-- Location: FF_X26_Y17_N9
\sREG[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sMUX[1]~5_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG(1));

-- Location: LCCOMB_X26_Y17_N16
\sMUX[2]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[2]~6_combout\ = (\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & ((sDATA(9)))) # (!\iSEL[0]~input_o\ & (sDATA(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[0]~input_o\,
	datab => \iSEL[1]~input_o\,
	datac => sDATA(7),
	datad => sDATA(9),
	combout => \sMUX[2]~6_combout\);

-- Location: LCCOMB_X26_Y17_N28
\sMUX[2]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[2]~7_combout\ = (\sMUX[2]~6_combout\) # ((sDATA(2) & !\sMUX~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \sMUX[2]~6_combout\,
	datac => sDATA(2),
	datad => \sMUX~2_combout\,
	combout => \sMUX[2]~7_combout\);

-- Location: FF_X26_Y17_N29
\sREG[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sMUX[2]~7_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG(2));

-- Location: LCCOMB_X26_Y17_N12
\sMUX[3]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[3]~8_combout\ = (\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & (sDATA(9))) # (!\iSEL[0]~input_o\ & ((sDATA(8))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => sDATA(9),
	datab => \iSEL[1]~input_o\,
	datac => sDATA(8),
	datad => \iSEL[0]~input_o\,
	combout => \sMUX[3]~8_combout\);

-- Location: LCCOMB_X26_Y17_N0
\sMUX[3]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[3]~9_combout\ = (\sMUX[3]~8_combout\) # ((!\iSEL[1]~input_o\ & sDATA(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iSEL[1]~input_o\,
	datac => sDATA(3),
	datad => \sMUX[3]~8_combout\,
	combout => \sMUX[3]~9_combout\);

-- Location: FF_X26_Y17_N1
\sREG[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sMUX[3]~9_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG(3));

-- Location: LCCOMB_X26_Y17_N6
\sMUX[4]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMUX[4]~10_combout\ = (\iSEL[1]~input_o\ & ((sDATA(9)))) # (!\iSEL[1]~input_o\ & (sDATA(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iSEL[1]~input_o\,
	datac => sDATA(4),
	datad => sDATA(9),
	combout => \sMUX[4]~10_combout\);

-- Location: FF_X26_Y17_N7
\sREG[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \iCLK~inputclkctrl_outclk\,
	d => \sMUX[4]~10_combout\,
	clrn => \inRST~inputclkctrl_outclk\,
	ena => \Equal1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => sREG(4));

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


