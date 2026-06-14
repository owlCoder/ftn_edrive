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

-- DATE "11/28/2021 12:53:46"

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

ENTITY 	DS2 IS
    PORT (
	iA : IN std_logic_vector(2 DOWNTO 0);
	iB : IN std_logic_vector(6 DOWNTO 0);
	iC : IN std_logic_vector(6 DOWNTO 0);
	iSEL : IN std_logic_vector(3 DOWNTO 0);
	oRESULT : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END DS2;

-- Design Ports Information
-- iSEL[0]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[0]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[1]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[2]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[3]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[4]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[5]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[7]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[0]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[3]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[2]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[0]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[1]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[2]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[3]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[3]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[4]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[4]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[5]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[5]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iC[6]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[6]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DS2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_iA : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_iB : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_iC : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_iSEL : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_oRESULT : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oRESULT[0]~output_o\ : std_logic;
SIGNAL \oRESULT[1]~output_o\ : std_logic;
SIGNAL \oRESULT[2]~output_o\ : std_logic;
SIGNAL \oRESULT[3]~output_o\ : std_logic;
SIGNAL \oRESULT[4]~output_o\ : std_logic;
SIGNAL \oRESULT[5]~output_o\ : std_logic;
SIGNAL \oRESULT[6]~output_o\ : std_logic;
SIGNAL \oRESULT[7]~output_o\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \iSEL[3]~input_o\ : std_logic;
SIGNAL \iSEL[2]~input_o\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \sCoder[0]~0_combout\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \sMux~0_combout\ : std_logic;
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \sMux~1_combout\ : std_logic;
SIGNAL \iC[0]~input_o\ : std_logic;
SIGNAL \sAdd[0]~0_combout\ : std_logic;
SIGNAL \sMux~2_combout\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \sMux~3_combout\ : std_logic;
SIGNAL \iC[1]~input_o\ : std_logic;
SIGNAL \sAdd[0]~1\ : std_logic;
SIGNAL \sAdd[1]~2_combout\ : std_logic;
SIGNAL \sMux~4_combout\ : std_logic;
SIGNAL \sMux~6_combout\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \sMux~5_combout\ : std_logic;
SIGNAL \sMux~7_combout\ : std_logic;
SIGNAL \iC[2]~input_o\ : std_logic;
SIGNAL \sAdd[1]~3\ : std_logic;
SIGNAL \sAdd[2]~4_combout\ : std_logic;
SIGNAL \sMux~8_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \iB[3]~input_o\ : std_logic;
SIGNAL \iC[3]~input_o\ : std_logic;
SIGNAL \sAdd[2]~5\ : std_logic;
SIGNAL \sAdd[3]~6_combout\ : std_logic;
SIGNAL \sMux~9_combout\ : std_logic;
SIGNAL \sMux~10_combout\ : std_logic;
SIGNAL \Equal6~1_combout\ : std_logic;
SIGNAL \sMux~11_combout\ : std_logic;
SIGNAL \iB[4]~input_o\ : std_logic;
SIGNAL \iC[4]~input_o\ : std_logic;
SIGNAL \sAdd[3]~7\ : std_logic;
SIGNAL \sAdd[4]~8_combout\ : std_logic;
SIGNAL \sMux~12_combout\ : std_logic;
SIGNAL \sDecoder[5]~0_combout\ : std_logic;
SIGNAL \iB[5]~input_o\ : std_logic;
SIGNAL \iC[5]~input_o\ : std_logic;
SIGNAL \sAdd[4]~9\ : std_logic;
SIGNAL \sAdd[5]~10_combout\ : std_logic;
SIGNAL \sMux~13_combout\ : std_logic;
SIGNAL \sMux~14_combout\ : std_logic;
SIGNAL \Equal6~2_combout\ : std_logic;
SIGNAL \sMux~15_combout\ : std_logic;
SIGNAL \iB[6]~input_o\ : std_logic;
SIGNAL \iC[6]~input_o\ : std_logic;
SIGNAL \sAdd[5]~11\ : std_logic;
SIGNAL \sAdd[6]~12_combout\ : std_logic;
SIGNAL \sMux~16_combout\ : std_logic;
SIGNAL \sMux~17_combout\ : std_logic;
SIGNAL \sAdd[6]~13\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \sMux~18_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_iA <= iA;
ww_iB <= iB;
ww_iC <= iC;
ww_iSEL <= iSEL;
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

-- Location: IOOBUF_X25_Y22_N16
\oRESULT[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~2_combout\,
	devoe => ww_devoe,
	o => \oRESULT[0]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\oRESULT[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~4_combout\,
	devoe => ww_devoe,
	o => \oRESULT[1]~output_o\);

-- Location: IOOBUF_X50_Y16_N23
\oRESULT[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~8_combout\,
	devoe => ww_devoe,
	o => \oRESULT[2]~output_o\);

-- Location: IOOBUF_X50_Y15_N16
\oRESULT[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~10_combout\,
	devoe => ww_devoe,
	o => \oRESULT[3]~output_o\);

-- Location: IOOBUF_X50_Y10_N2
\oRESULT[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~12_combout\,
	devoe => ww_devoe,
	o => \oRESULT[4]~output_o\);

-- Location: IOOBUF_X21_Y17_N30
\oRESULT[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~14_combout\,
	devoe => ww_devoe,
	o => \oRESULT[5]~output_o\);

-- Location: IOOBUF_X50_Y16_N16
\oRESULT[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~16_combout\,
	devoe => ww_devoe,
	o => \oRESULT[6]~output_o\);

-- Location: IOOBUF_X50_Y11_N16
\oRESULT[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~18_combout\,
	devoe => ww_devoe,
	o => \oRESULT[7]~output_o\);

-- Location: IOIBUF_X50_Y11_N1
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

-- Location: IOIBUF_X50_Y21_N15
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

-- Location: IOIBUF_X50_Y21_N8
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

-- Location: IOIBUF_X50_Y14_N22
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

-- Location: IOIBUF_X50_Y25_N22
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

-- Location: LCCOMB_X47_Y19_N16
\sCoder[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sCoder[0]~0_combout\ = (\iSEL[3]~input_o\) # ((!\iSEL[2]~input_o\ & \iSEL[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[3]~input_o\,
	datac => \iSEL[2]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \sCoder[0]~0_combout\);

-- Location: IOIBUF_X50_Y26_N22
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

-- Location: LCCOMB_X44_Y19_N24
\sMux~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~0_combout\ = (!\iA[1]~input_o\ & (!\sCoder[0]~0_combout\ & !\iA[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datac => \sCoder[0]~0_combout\,
	datad => \iA[2]~input_o\,
	combout => \sMux~0_combout\);

-- Location: IOIBUF_X50_Y24_N22
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

-- Location: LCCOMB_X44_Y19_N2
\sMux~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~1_combout\ = (\iB[0]~input_o\ & ((\sCoder[0]~0_combout\) # ((\sMux~0_combout\ & !\iA[0]~input_o\)))) # (!\iB[0]~input_o\ & (\sMux~0_combout\ & ((!\iA[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datab => \sMux~0_combout\,
	datac => \sCoder[0]~0_combout\,
	datad => \iA[0]~input_o\,
	combout => \sMux~1_combout\);

-- Location: IOIBUF_X25_Y23_N22
\iC[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(0),
	o => \iC[0]~input_o\);

-- Location: LCCOMB_X49_Y19_N12
\sAdd[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[0]~0_combout\ = (\iB[0]~input_o\ & (\iC[0]~input_o\ $ (VCC))) # (!\iB[0]~input_o\ & (\iC[0]~input_o\ & VCC))
-- \sAdd[0]~1\ = CARRY((\iB[0]~input_o\ & \iC[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datab => \iC[0]~input_o\,
	datad => VCC,
	combout => \sAdd[0]~0_combout\,
	cout => \sAdd[0]~1\);

-- Location: LCCOMB_X44_Y19_N20
\sMux~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~2_combout\ = (!\iSEL[3]~input_o\ & ((\iSEL[2]~input_o\ & ((\sAdd[0]~0_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~1_combout\,
	datab => \sAdd[0]~0_combout\,
	datac => \iSEL[2]~input_o\,
	datad => \iSEL[3]~input_o\,
	combout => \sMux~2_combout\);

-- Location: IOIBUF_X50_Y14_N15
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

-- Location: LCCOMB_X44_Y19_N6
\sMux~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~3_combout\ = (\sCoder[0]~0_combout\ & ((\iB[1]~input_o\) # ((\sMux~0_combout\ & \iA[0]~input_o\)))) # (!\sCoder[0]~0_combout\ & (\sMux~0_combout\ & ((\iA[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCoder[0]~0_combout\,
	datab => \sMux~0_combout\,
	datac => \iB[1]~input_o\,
	datad => \iA[0]~input_o\,
	combout => \sMux~3_combout\);

-- Location: IOIBUF_X50_Y21_N23
\iC[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(1),
	o => \iC[1]~input_o\);

-- Location: LCCOMB_X49_Y19_N14
\sAdd[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[1]~2_combout\ = (\iC[1]~input_o\ & ((\iB[1]~input_o\ & (\sAdd[0]~1\ & VCC)) # (!\iB[1]~input_o\ & (!\sAdd[0]~1\)))) # (!\iC[1]~input_o\ & ((\iB[1]~input_o\ & (!\sAdd[0]~1\)) # (!\iB[1]~input_o\ & ((\sAdd[0]~1\) # (GND)))))
-- \sAdd[1]~3\ = CARRY((\iC[1]~input_o\ & (!\iB[1]~input_o\ & !\sAdd[0]~1\)) # (!\iC[1]~input_o\ & ((!\sAdd[0]~1\) # (!\iB[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iC[1]~input_o\,
	datab => \iB[1]~input_o\,
	datad => VCC,
	cin => \sAdd[0]~1\,
	combout => \sAdd[1]~2_combout\,
	cout => \sAdd[1]~3\);

-- Location: LCCOMB_X44_Y19_N0
\sMux~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~4_combout\ = (!\iSEL[3]~input_o\ & ((\iSEL[2]~input_o\ & ((\sAdd[1]~2_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~3_combout\,
	datab => \iSEL[2]~input_o\,
	datac => \sAdd[1]~2_combout\,
	datad => \iSEL[3]~input_o\,
	combout => \sMux~4_combout\);

-- Location: LCCOMB_X47_Y19_N12
\sMux~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~6_combout\ = (\iA[1]~input_o\ & (!\iA[0]~input_o\ & (!\iA[2]~input_o\ & !\iSEL[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[2]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \sMux~6_combout\);

-- Location: IOIBUF_X50_Y22_N8
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

-- Location: LCCOMB_X47_Y19_N26
\sMux~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~5_combout\ = (!\iSEL[3]~input_o\ & !\iSEL[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[3]~input_o\,
	datac => \iSEL[2]~input_o\,
	combout => \sMux~5_combout\);

-- Location: LCCOMB_X47_Y19_N30
\sMux~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~7_combout\ = (\sMux~5_combout\ & ((\sMux~6_combout\) # ((\iB[2]~input_o\ & \iSEL[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~6_combout\,
	datab => \iB[2]~input_o\,
	datac => \sMux~5_combout\,
	datad => \iSEL[1]~input_o\,
	combout => \sMux~7_combout\);

-- Location: IOIBUF_X50_Y15_N22
\iC[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(2),
	o => \iC[2]~input_o\);

-- Location: LCCOMB_X49_Y19_N16
\sAdd[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[2]~4_combout\ = ((\iC[2]~input_o\ $ (\iB[2]~input_o\ $ (!\sAdd[1]~3\)))) # (GND)
-- \sAdd[2]~5\ = CARRY((\iC[2]~input_o\ & ((\iB[2]~input_o\) # (!\sAdd[1]~3\))) # (!\iC[2]~input_o\ & (\iB[2]~input_o\ & !\sAdd[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iC[2]~input_o\,
	datab => \iB[2]~input_o\,
	datad => VCC,
	cin => \sAdd[1]~3\,
	combout => \sAdd[2]~4_combout\,
	cout => \sAdd[2]~5\);

-- Location: LCCOMB_X47_Y19_N8
\sMux~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~8_combout\ = (\sMux~7_combout\) # ((!\iSEL[3]~input_o\ & (\iSEL[2]~input_o\ & \sAdd[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[3]~input_o\,
	datab => \sMux~7_combout\,
	datac => \iSEL[2]~input_o\,
	datad => \sAdd[2]~4_combout\,
	combout => \sMux~8_combout\);

-- Location: LCCOMB_X47_Y19_N10
\Equal6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (\iA[1]~input_o\ & (\iA[0]~input_o\ & !\iA[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[2]~input_o\,
	combout => \Equal6~0_combout\);

-- Location: IOIBUF_X50_Y22_N22
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

-- Location: IOIBUF_X50_Y24_N8
\iC[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(3),
	o => \iC[3]~input_o\);

-- Location: LCCOMB_X49_Y19_N18
\sAdd[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[3]~6_combout\ = (\iB[3]~input_o\ & ((\iC[3]~input_o\ & (\sAdd[2]~5\ & VCC)) # (!\iC[3]~input_o\ & (!\sAdd[2]~5\)))) # (!\iB[3]~input_o\ & ((\iC[3]~input_o\ & (!\sAdd[2]~5\)) # (!\iC[3]~input_o\ & ((\sAdd[2]~5\) # (GND)))))
-- \sAdd[3]~7\ = CARRY((\iB[3]~input_o\ & (!\iC[3]~input_o\ & !\sAdd[2]~5\)) # (!\iB[3]~input_o\ & ((!\sAdd[2]~5\) # (!\iC[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => \iC[3]~input_o\,
	datad => VCC,
	cin => \sAdd[2]~5\,
	combout => \sAdd[3]~6_combout\,
	cout => \sAdd[3]~7\);

-- Location: LCCOMB_X47_Y19_N20
\sMux~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~9_combout\ = (\sCoder[0]~0_combout\ & (((!\sMux~5_combout\)))) # (!\sCoder[0]~0_combout\ & ((\sMux~5_combout\ & (\Equal6~0_combout\)) # (!\sMux~5_combout\ & ((\sAdd[3]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~0_combout\,
	datab => \sCoder[0]~0_combout\,
	datac => \sMux~5_combout\,
	datad => \sAdd[3]~6_combout\,
	combout => \sMux~9_combout\);

-- Location: LCCOMB_X47_Y19_N22
\sMux~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~10_combout\ = (\sMux~9_combout\ & ((\iC[1]~input_o\) # ((!\sCoder[0]~0_combout\)))) # (!\sMux~9_combout\ & (((\sCoder[0]~0_combout\ & \iB[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iC[1]~input_o\,
	datab => \sMux~9_combout\,
	datac => \sCoder[0]~0_combout\,
	datad => \iB[3]~input_o\,
	combout => \sMux~10_combout\);

-- Location: LCCOMB_X47_Y19_N0
\Equal6~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~1_combout\ = (!\iA[1]~input_o\ & (!\iA[0]~input_o\ & \iA[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[2]~input_o\,
	combout => \Equal6~1_combout\);

-- Location: LCCOMB_X44_Y19_N10
\sMux~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~11_combout\ = (\sCoder[0]~0_combout\ & ((\iB[0]~input_o\) # ((!\sMux~5_combout\)))) # (!\sCoder[0]~0_combout\ & (((\Equal6~1_combout\ & \sMux~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[0]~input_o\,
	datab => \Equal6~1_combout\,
	datac => \sCoder[0]~0_combout\,
	datad => \sMux~5_combout\,
	combout => \sMux~11_combout\);

-- Location: IOIBUF_X50_Y22_N1
\iB[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(4),
	o => \iB[4]~input_o\);

-- Location: IOIBUF_X50_Y10_N8
\iC[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(4),
	o => \iC[4]~input_o\);

-- Location: LCCOMB_X49_Y19_N20
\sAdd[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[4]~8_combout\ = ((\iB[4]~input_o\ $ (\iC[4]~input_o\ $ (!\sAdd[3]~7\)))) # (GND)
-- \sAdd[4]~9\ = CARRY((\iB[4]~input_o\ & ((\iC[4]~input_o\) # (!\sAdd[3]~7\))) # (!\iB[4]~input_o\ & (\iC[4]~input_o\ & !\sAdd[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[4]~input_o\,
	datab => \iC[4]~input_o\,
	datad => VCC,
	cin => \sAdd[3]~7\,
	combout => \sAdd[4]~8_combout\,
	cout => \sAdd[4]~9\);

-- Location: LCCOMB_X44_Y19_N12
\sMux~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~12_combout\ = (\sMux~11_combout\ & ((\sMux~5_combout\) # ((\iC[2]~input_o\)))) # (!\sMux~11_combout\ & (!\sMux~5_combout\ & ((\sAdd[4]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~11_combout\,
	datab => \sMux~5_combout\,
	datac => \iC[2]~input_o\,
	datad => \sAdd[4]~8_combout\,
	combout => \sMux~12_combout\);

-- Location: LCCOMB_X47_Y19_N18
\sDecoder[5]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sDecoder[5]~0_combout\ = (!\iA[1]~input_o\ & (\iA[0]~input_o\ & \iA[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[2]~input_o\,
	combout => \sDecoder[5]~0_combout\);

-- Location: IOIBUF_X50_Y24_N1
\iB[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(5),
	o => \iB[5]~input_o\);

-- Location: IOIBUF_X25_Y23_N15
\iC[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(5),
	o => \iC[5]~input_o\);

-- Location: LCCOMB_X49_Y19_N22
\sAdd[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[5]~10_combout\ = (\iB[5]~input_o\ & ((\iC[5]~input_o\ & (\sAdd[4]~9\ & VCC)) # (!\iC[5]~input_o\ & (!\sAdd[4]~9\)))) # (!\iB[5]~input_o\ & ((\iC[5]~input_o\ & (!\sAdd[4]~9\)) # (!\iC[5]~input_o\ & ((\sAdd[4]~9\) # (GND)))))
-- \sAdd[5]~11\ = CARRY((\iB[5]~input_o\ & (!\iC[5]~input_o\ & !\sAdd[4]~9\)) # (!\iB[5]~input_o\ & ((!\sAdd[4]~9\) # (!\iC[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[5]~input_o\,
	datab => \iC[5]~input_o\,
	datad => VCC,
	cin => \sAdd[4]~9\,
	combout => \sAdd[5]~10_combout\,
	cout => \sAdd[5]~11\);

-- Location: LCCOMB_X47_Y19_N28
\sMux~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~13_combout\ = (\sMux~5_combout\ & (\sDecoder[5]~0_combout\ & (!\sCoder[0]~0_combout\))) # (!\sMux~5_combout\ & (((\sCoder[0]~0_combout\) # (\sAdd[5]~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~5_combout\,
	datab => \sDecoder[5]~0_combout\,
	datac => \sCoder[0]~0_combout\,
	datad => \sAdd[5]~10_combout\,
	combout => \sMux~13_combout\);

-- Location: LCCOMB_X44_Y19_N14
\sMux~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~14_combout\ = (\sCoder[0]~0_combout\ & ((\sMux~13_combout\ & ((\iC[3]~input_o\))) # (!\sMux~13_combout\ & (\iB[1]~input_o\)))) # (!\sCoder[0]~0_combout\ & (\sMux~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sCoder[0]~0_combout\,
	datab => \sMux~13_combout\,
	datac => \iB[1]~input_o\,
	datad => \iC[3]~input_o\,
	combout => \sMux~14_combout\);

-- Location: LCCOMB_X47_Y19_N6
\Equal6~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~2_combout\ = (\iA[1]~input_o\ & \iA[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[1]~input_o\,
	datac => \iA[2]~input_o\,
	combout => \Equal6~2_combout\);

-- Location: LCCOMB_X47_Y19_N24
\sMux~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~15_combout\ = (\iSEL[1]~input_o\ & (((\iB[2]~input_o\)))) # (!\iSEL[1]~input_o\ & (\Equal6~2_combout\ & ((!\iA[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~2_combout\,
	datab => \iB[2]~input_o\,
	datac => \iA[0]~input_o\,
	datad => \iSEL[1]~input_o\,
	combout => \sMux~15_combout\);

-- Location: IOIBUF_X50_Y21_N1
\iB[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(6),
	o => \iB[6]~input_o\);

-- Location: IOIBUF_X50_Y24_N15
\iC[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iC(6),
	o => \iC[6]~input_o\);

-- Location: LCCOMB_X49_Y19_N24
\sAdd[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[6]~12_combout\ = ((\iB[6]~input_o\ $ (\iC[6]~input_o\ $ (!\sAdd[5]~11\)))) # (GND)
-- \sAdd[6]~13\ = CARRY((\iB[6]~input_o\ & ((\iC[6]~input_o\) # (!\sAdd[5]~11\))) # (!\iB[6]~input_o\ & (\iC[6]~input_o\ & !\sAdd[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[6]~input_o\,
	datab => \iC[6]~input_o\,
	datad => VCC,
	cin => \sAdd[5]~11\,
	combout => \sAdd[6]~12_combout\,
	cout => \sAdd[6]~13\);

-- Location: LCCOMB_X47_Y19_N2
\sMux~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~16_combout\ = (!\iSEL[3]~input_o\ & ((\iSEL[2]~input_o\ & ((\sAdd[6]~12_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[3]~input_o\,
	datab => \sMux~15_combout\,
	datac => \iSEL[2]~input_o\,
	datad => \sAdd[6]~12_combout\,
	combout => \sMux~16_combout\);

-- Location: LCCOMB_X47_Y19_N4
\sMux~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~17_combout\ = (\sCoder[0]~0_combout\ & (((\iB[3]~input_o\)))) # (!\sCoder[0]~0_combout\ & (\Equal6~2_combout\ & (\iA[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal6~2_combout\,
	datab => \sCoder[0]~0_combout\,
	datac => \iA[0]~input_o\,
	datad => \iB[3]~input_o\,
	combout => \sMux~17_combout\);

-- Location: LCCOMB_X49_Y19_N26
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \sAdd[6]~13\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \sAdd[6]~13\,
	combout => \Add0~0_combout\);

-- Location: LCCOMB_X47_Y19_N14
\sMux~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~18_combout\ = (!\iSEL[3]~input_o\ & ((\iSEL[2]~input_o\ & ((\Add0~0_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \sMux~17_combout\,
	datac => \iSEL[3]~input_o\,
	datad => \Add0~0_combout\,
	combout => \sMux~18_combout\);

-- Location: IOIBUF_X50_Y8_N1
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

ww_oRESULT(3) <= \oRESULT[3]~output_o\;

ww_oRESULT(4) <= \oRESULT[4]~output_o\;

ww_oRESULT(5) <= \oRESULT[5]~output_o\;

ww_oRESULT(6) <= \oRESULT[6]~output_o\;

ww_oRESULT(7) <= \oRESULT[7]~output_o\;
END structure;


