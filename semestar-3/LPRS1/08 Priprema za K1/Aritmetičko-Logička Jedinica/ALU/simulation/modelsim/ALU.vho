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

-- DATE "11/27/2021 22:11:48"

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

ENTITY 	alu IS
    PORT (
	iA : IN std_logic_vector(7 DOWNTO 0);
	iB : IN std_logic_vector(7 DOWNTO 0);
	iSEL : IN std_logic_vector(2 DOWNTO 0);
	oY : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END alu;

-- Design Ports Information
-- oY[0]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[1]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[2]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[3]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[4]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[5]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[6]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oY[7]	=>  Location: PIN_H9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[0]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[1]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[2]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iSEL[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[7]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[7]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[6]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[6]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[5]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[5]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[4]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[4]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[3]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF alu IS
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
SIGNAL ww_iB : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_iSEL : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_oY : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oY[0]~output_o\ : std_logic;
SIGNAL \oY[1]~output_o\ : std_logic;
SIGNAL \oY[2]~output_o\ : std_logic;
SIGNAL \oY[3]~output_o\ : std_logic;
SIGNAL \oY[4]~output_o\ : std_logic;
SIGNAL \oY[5]~output_o\ : std_logic;
SIGNAL \oY[6]~output_o\ : std_logic;
SIGNAL \oY[7]~output_o\ : std_logic;
SIGNAL \iSEL[1]~input_o\ : std_logic;
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \sAdd[0]~0_combout\ : std_logic;
SIGNAL \iSEL[0]~input_o\ : std_logic;
SIGNAL \sMux~6_combout\ : std_logic;
SIGNAL \iSEL[2]~input_o\ : std_logic;
SIGNAL \sMux~0_combout\ : std_logic;
SIGNAL \iA[7]~input_o\ : std_logic;
SIGNAL \iB[7]~input_o\ : std_logic;
SIGNAL \iB[6]~input_o\ : std_logic;
SIGNAL \iA[6]~input_o\ : std_logic;
SIGNAL \iA[5]~input_o\ : std_logic;
SIGNAL \iB[5]~input_o\ : std_logic;
SIGNAL \iB[4]~input_o\ : std_logic;
SIGNAL \iA[4]~input_o\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \iB[3]~input_o\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~13_cout\ : std_logic;
SIGNAL \LessThan0~14_combout\ : std_logic;
SIGNAL \sMux~2_combout\ : std_logic;
SIGNAL \sMux~3_combout\ : std_logic;
SIGNAL \sMux~1_combout\ : std_logic;
SIGNAL \sMux~4_combout\ : std_logic;
SIGNAL \sGX[0]~0_combout\ : std_logic;
SIGNAL \sMux~5_combout\ : std_logic;
SIGNAL \sMux~7_combout\ : std_logic;
SIGNAL \sAdd[0]~1\ : std_logic;
SIGNAL \sAdd[1]~2_combout\ : std_logic;
SIGNAL \sMux~11_combout\ : std_logic;
SIGNAL \sMux~8_combout\ : std_logic;
SIGNAL \sMux~9_combout\ : std_logic;
SIGNAL \sFX[0]~1_cout\ : std_logic;
SIGNAL \sFX[1]~2_combout\ : std_logic;
SIGNAL \sGX[0]~1\ : std_logic;
SIGNAL \sGX[1]~2_combout\ : std_logic;
SIGNAL \sMux~10_combout\ : std_logic;
SIGNAL \sMux~12_combout\ : std_logic;
SIGNAL \sAdd[1]~3\ : std_logic;
SIGNAL \sAdd[2]~4_combout\ : std_logic;
SIGNAL \sMux~16_combout\ : std_logic;
SIGNAL \sFX[1]~3\ : std_logic;
SIGNAL \sFX[2]~4_combout\ : std_logic;
SIGNAL \sMux~13_combout\ : std_logic;
SIGNAL \sMux~14_combout\ : std_logic;
SIGNAL \sGX[1]~3\ : std_logic;
SIGNAL \sGX[2]~4_combout\ : std_logic;
SIGNAL \sMux~15_combout\ : std_logic;
SIGNAL \sMux~17_combout\ : std_logic;
SIGNAL \sAdd[2]~5\ : std_logic;
SIGNAL \sAdd[3]~6_combout\ : std_logic;
SIGNAL \sMux~21_combout\ : std_logic;
SIGNAL \sFX[2]~5\ : std_logic;
SIGNAL \sFX[3]~6_combout\ : std_logic;
SIGNAL \sGX[2]~5\ : std_logic;
SIGNAL \sGX[3]~6_combout\ : std_logic;
SIGNAL \sMux~18_combout\ : std_logic;
SIGNAL \sMux~19_combout\ : std_logic;
SIGNAL \sMux~20_combout\ : std_logic;
SIGNAL \sMux~22_combout\ : std_logic;
SIGNAL \sMux~25_combout\ : std_logic;
SIGNAL \sMux~26_combout\ : std_logic;
SIGNAL \sGX[3]~7\ : std_logic;
SIGNAL \sGX[4]~8_combout\ : std_logic;
SIGNAL \sFX[3]~7\ : std_logic;
SIGNAL \sFX[4]~8_combout\ : std_logic;
SIGNAL \sMux~27_combout\ : std_logic;
SIGNAL \sAdd[3]~7\ : std_logic;
SIGNAL \sAdd[4]~8_combout\ : std_logic;
SIGNAL \sMux~23_combout\ : std_logic;
SIGNAL \Equal6~0_combout\ : std_logic;
SIGNAL \sMux~24_combout\ : std_logic;
SIGNAL \sMux~28_combout\ : std_logic;
SIGNAL \sAdd[4]~9\ : std_logic;
SIGNAL \sAdd[5]~10_combout\ : std_logic;
SIGNAL \sMux~31_combout\ : std_logic;
SIGNAL \sDecoder[5]~0_combout\ : std_logic;
SIGNAL \sMux~32_combout\ : std_logic;
SIGNAL \sGX[4]~9\ : std_logic;
SIGNAL \sGX[5]~10_combout\ : std_logic;
SIGNAL \sFX[4]~9\ : std_logic;
SIGNAL \sFX[5]~10_combout\ : std_logic;
SIGNAL \sMux~29_combout\ : std_logic;
SIGNAL \sMux~30_combout\ : std_logic;
SIGNAL \sMux~33_combout\ : std_logic;
SIGNAL \sGX[5]~11\ : std_logic;
SIGNAL \sGX[6]~12_combout\ : std_logic;
SIGNAL \sFX[5]~11\ : std_logic;
SIGNAL \sFX[6]~12_combout\ : std_logic;
SIGNAL \sAdd[5]~11\ : std_logic;
SIGNAL \sAdd[6]~12_combout\ : std_logic;
SIGNAL \sMux~34_combout\ : std_logic;
SIGNAL \sMux~35_combout\ : std_logic;
SIGNAL \Equal6~1_combout\ : std_logic;
SIGNAL \sMux~36_combout\ : std_logic;
SIGNAL \sMux~37_combout\ : std_logic;
SIGNAL \sMux~38_combout\ : std_logic;
SIGNAL \sGX[6]~13\ : std_logic;
SIGNAL \sGX[7]~14_combout\ : std_logic;
SIGNAL \sAdd[6]~13\ : std_logic;
SIGNAL \sAdd[7]~14_combout\ : std_logic;
SIGNAL \sMux~39_combout\ : std_logic;
SIGNAL \Equal6~2_combout\ : std_logic;
SIGNAL \sMux~40_combout\ : std_logic;
SIGNAL \sMux~41_combout\ : std_logic;
SIGNAL \sFX[6]~13\ : std_logic;
SIGNAL \sFX[7]~14_combout\ : std_logic;
SIGNAL \sMux~42_combout\ : std_logic;

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
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
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

-- Location: IOOBUF_X50_Y22_N16
\oY[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~7_combout\,
	devoe => ww_devoe,
	o => \oY[0]~output_o\);

-- Location: IOOBUF_X50_Y22_N2
\oY[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~12_combout\,
	devoe => ww_devoe,
	o => \oY[1]~output_o\);

-- Location: IOOBUF_X50_Y24_N9
\oY[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~17_combout\,
	devoe => ww_devoe,
	o => \oY[2]~output_o\);

-- Location: IOOBUF_X25_Y22_N16
\oY[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~22_combout\,
	devoe => ww_devoe,
	o => \oY[3]~output_o\);

-- Location: IOOBUF_X50_Y15_N23
\oY[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~28_combout\,
	devoe => ww_devoe,
	o => \oY[4]~output_o\);

-- Location: IOOBUF_X50_Y16_N16
\oY[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~33_combout\,
	devoe => ww_devoe,
	o => \oY[5]~output_o\);

-- Location: IOOBUF_X25_Y23_N16
\oY[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~38_combout\,
	devoe => ww_devoe,
	o => \oY[6]~output_o\);

-- Location: IOOBUF_X50_Y11_N24
\oY[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~42_combout\,
	devoe => ww_devoe,
	o => \oY[7]~output_o\);

-- Location: IOIBUF_X50_Y14_N15
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

-- Location: IOIBUF_X50_Y21_N8
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

-- Location: IOIBUF_X25_Y23_N22
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

-- Location: LCCOMB_X46_Y18_N0
\sAdd[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[0]~0_combout\ = (\iA[0]~input_o\ & (\iB[0]~input_o\ $ (VCC))) # (!\iA[0]~input_o\ & (\iB[0]~input_o\ & VCC))
-- \sAdd[0]~1\ = CARRY((\iA[0]~input_o\ & \iB[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[0]~input_o\,
	datab => \iB[0]~input_o\,
	datad => VCC,
	combout => \sAdd[0]~0_combout\,
	cout => \sAdd[0]~1\);

-- Location: IOIBUF_X50_Y25_N22
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

-- Location: LCCOMB_X44_Y19_N16
\sMux~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~6_combout\ = (\iSEL[0]~input_o\ & (!\iA[0]~input_o\)) # (!\iSEL[0]~input_o\ & ((\sAdd[0]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[0]~input_o\,
	datac => \sAdd[0]~0_combout\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~6_combout\);

-- Location: IOIBUF_X50_Y15_N15
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

-- Location: LCCOMB_X44_Y19_N24
\sMux~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~0_combout\ = (\iSEL[1]~input_o\) # (!\iSEL[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datac => \iSEL[2]~input_o\,
	combout => \sMux~0_combout\);

-- Location: IOIBUF_X50_Y11_N15
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

-- Location: IOIBUF_X50_Y21_N1
\iB[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iB(7),
	o => \iB[7]~input_o\);

-- Location: IOIBUF_X50_Y14_N22
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

-- Location: IOIBUF_X50_Y21_N23
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

-- Location: IOIBUF_X50_Y22_N22
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

-- Location: IOIBUF_X50_Y22_N8
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

-- Location: IOIBUF_X50_Y16_N22
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

-- Location: IOIBUF_X21_Y17_N29
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

-- Location: IOIBUF_X50_Y24_N1
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

-- Location: IOIBUF_X50_Y26_N15
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

-- Location: IOIBUF_X50_Y11_N1
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

-- Location: IOIBUF_X50_Y21_N15
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

-- Location: IOIBUF_X50_Y11_N8
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

-- Location: IOIBUF_X50_Y24_N15
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

-- Location: LCCOMB_X46_Y18_N16
\LessThan0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((!\iA[0]~input_o\ & \iB[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[0]~input_o\,
	datab => \iB[0]~input_o\,
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X46_Y18_N18
\LessThan0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((\iB[1]~input_o\ & (\iA[1]~input_o\ & !\LessThan0~1_cout\)) # (!\iB[1]~input_o\ & ((\iA[1]~input_o\) # (!\LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[1]~input_o\,
	datab => \iA[1]~input_o\,
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X46_Y18_N20
\LessThan0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((\iB[2]~input_o\ & ((!\LessThan0~3_cout\) # (!\iA[2]~input_o\))) # (!\iB[2]~input_o\ & (!\iA[2]~input_o\ & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[2]~input_o\,
	datab => \iA[2]~input_o\,
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X46_Y18_N22
\LessThan0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((\iA[3]~input_o\ & ((!\LessThan0~5_cout\) # (!\iB[3]~input_o\))) # (!\iA[3]~input_o\ & (!\iB[3]~input_o\ & !\LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[3]~input_o\,
	datab => \iB[3]~input_o\,
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X46_Y18_N24
\LessThan0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((\iB[4]~input_o\ & ((!\LessThan0~7_cout\) # (!\iA[4]~input_o\))) # (!\iB[4]~input_o\ & (!\iA[4]~input_o\ & !\LessThan0~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[4]~input_o\,
	datab => \iA[4]~input_o\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X46_Y18_N26
\LessThan0~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((\iA[5]~input_o\ & ((!\LessThan0~9_cout\) # (!\iB[5]~input_o\))) # (!\iA[5]~input_o\ & (!\iB[5]~input_o\ & !\LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[5]~input_o\,
	datab => \iB[5]~input_o\,
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X46_Y18_N28
\LessThan0~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~13_cout\ = CARRY((\iB[6]~input_o\ & ((!\LessThan0~11_cout\) # (!\iA[6]~input_o\))) # (!\iB[6]~input_o\ & (!\iA[6]~input_o\ & !\LessThan0~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[6]~input_o\,
	datab => \iA[6]~input_o\,
	datad => VCC,
	cin => \LessThan0~11_cout\,
	cout => \LessThan0~13_cout\);

-- Location: LCCOMB_X46_Y18_N30
\LessThan0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \LessThan0~14_combout\ = (\iA[7]~input_o\ & (\LessThan0~13_cout\ & \iB[7]~input_o\)) # (!\iA[7]~input_o\ & ((\LessThan0~13_cout\) # (\iB[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[7]~input_o\,
	datad => \iB[7]~input_o\,
	cin => \LessThan0~13_cout\,
	combout => \LessThan0~14_combout\);

-- Location: LCCOMB_X47_Y18_N0
\sMux~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~2_combout\ = ((\iSEL[1]~input_o\ & (\LessThan0~14_combout\ $ (\iSEL[0]~input_o\)))) # (!\iSEL[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \LessThan0~14_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \iSEL[2]~input_o\,
	combout => \sMux~2_combout\);

-- Location: LCCOMB_X47_Y18_N10
\sMux~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~3_combout\ = (\iSEL[2]~input_o\ & ((\iSEL[1]~input_o\) # (\iSEL[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datac => \iSEL[0]~input_o\,
	datad => \iSEL[2]~input_o\,
	combout => \sMux~3_combout\);

-- Location: LCCOMB_X44_Y19_N26
\sMux~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~1_combout\ = (!\iA[2]~input_o\ & (!\iA[0]~input_o\ & (!\iA[1]~input_o\ & !\iSEL[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[1]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~1_combout\);

-- Location: LCCOMB_X44_Y19_N4
\sMux~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~4_combout\ = (\sMux~2_combout\ & ((\sMux~3_combout\ & ((\iA[0]~input_o\))) # (!\sMux~3_combout\ & (\sMux~1_combout\)))) # (!\sMux~2_combout\ & (!\sMux~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~2_combout\,
	datab => \sMux~3_combout\,
	datac => \sMux~1_combout\,
	datad => \iA[0]~input_o\,
	combout => \sMux~4_combout\);

-- Location: LCCOMB_X44_Y18_N16
\sGX[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[0]~0_combout\ = \iA[0]~input_o\ $ (VCC)
-- \sGX[0]~1\ = CARRY(\iA[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[0]~input_o\,
	datad => VCC,
	combout => \sGX[0]~0_combout\,
	cout => \sGX[0]~1\);

-- Location: LCCOMB_X44_Y19_N6
\sMux~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~5_combout\ = (\sMux~0_combout\ & (\sMux~4_combout\)) # (!\sMux~0_combout\ & ((\sMux~4_combout\ & ((\iA[0]~input_o\))) # (!\sMux~4_combout\ & (\sGX[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~0_combout\,
	datab => \sMux~4_combout\,
	datac => \sGX[0]~0_combout\,
	datad => \iA[0]~input_o\,
	combout => \sMux~5_combout\);

-- Location: LCCOMB_X44_Y19_N18
\sMux~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~7_combout\ = (\iSEL[1]~input_o\ & (((\sMux~5_combout\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[2]~input_o\ & ((\sMux~5_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sMux~6_combout\,
	datac => \iSEL[2]~input_o\,
	datad => \sMux~5_combout\,
	combout => \sMux~7_combout\);

-- Location: LCCOMB_X46_Y18_N2
\sAdd[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[1]~2_combout\ = (\iB[1]~input_o\ & ((\iA[1]~input_o\ & (\sAdd[0]~1\ & VCC)) # (!\iA[1]~input_o\ & (!\sAdd[0]~1\)))) # (!\iB[1]~input_o\ & ((\iA[1]~input_o\ & (!\sAdd[0]~1\)) # (!\iA[1]~input_o\ & ((\sAdd[0]~1\) # (GND)))))
-- \sAdd[1]~3\ = CARRY((\iB[1]~input_o\ & (!\iA[1]~input_o\ & !\sAdd[0]~1\)) # (!\iB[1]~input_o\ & ((!\sAdd[0]~1\) # (!\iA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[1]~input_o\,
	datab => \iA[1]~input_o\,
	datad => VCC,
	cin => \sAdd[0]~1\,
	combout => \sAdd[1]~2_combout\,
	cout => \sAdd[1]~3\);

-- Location: LCCOMB_X44_Y19_N2
\sMux~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~11_combout\ = (\iSEL[0]~input_o\ & (!\iA[1]~input_o\)) # (!\iSEL[0]~input_o\ & ((\sAdd[1]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[1]~input_o\,
	datac => \sAdd[1]~2_combout\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~11_combout\);

-- Location: LCCOMB_X44_Y19_N12
\sMux~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~8_combout\ = (!\iA[2]~input_o\ & (\iA[0]~input_o\ & (!\iA[1]~input_o\ & !\iSEL[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[1]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~8_combout\);

-- Location: LCCOMB_X44_Y19_N22
\sMux~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~9_combout\ = (\sMux~3_combout\ & (((\iA[1]~input_o\ & \sMux~2_combout\)))) # (!\sMux~3_combout\ & ((\sMux~8_combout\) # ((!\sMux~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~8_combout\,
	datab => \iA[1]~input_o\,
	datac => \sMux~3_combout\,
	datad => \sMux~2_combout\,
	combout => \sMux~9_combout\);

-- Location: LCCOMB_X44_Y18_N0
\sFX[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[0]~1_cout\ = CARRY(!\iA[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[0]~input_o\,
	datad => VCC,
	cout => \sFX[0]~1_cout\);

-- Location: LCCOMB_X44_Y18_N2
\sFX[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[1]~2_combout\ = (\iA[1]~input_o\ & ((\sFX[0]~1_cout\) # (GND))) # (!\iA[1]~input_o\ & (!\sFX[0]~1_cout\))
-- \sFX[1]~3\ = CARRY((\iA[1]~input_o\) # (!\sFX[0]~1_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[1]~input_o\,
	datad => VCC,
	cin => \sFX[0]~1_cout\,
	combout => \sFX[1]~2_combout\,
	cout => \sFX[1]~3\);

-- Location: LCCOMB_X44_Y18_N18
\sGX[1]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[1]~2_combout\ = (\iA[1]~input_o\ & (!\sGX[0]~1\)) # (!\iA[1]~input_o\ & ((\sGX[0]~1\) # (GND)))
-- \sGX[1]~3\ = CARRY((!\sGX[0]~1\) # (!\iA[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[1]~input_o\,
	datad => VCC,
	cin => \sGX[0]~1\,
	combout => \sGX[1]~2_combout\,
	cout => \sGX[1]~3\);

-- Location: LCCOMB_X44_Y19_N0
\sMux~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~10_combout\ = (\sMux~9_combout\ & ((\sFX[1]~2_combout\) # ((\sMux~0_combout\)))) # (!\sMux~9_combout\ & (((\sGX[1]~2_combout\ & !\sMux~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~9_combout\,
	datab => \sFX[1]~2_combout\,
	datac => \sGX[1]~2_combout\,
	datad => \sMux~0_combout\,
	combout => \sMux~10_combout\);

-- Location: LCCOMB_X44_Y19_N20
\sMux~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~12_combout\ = (\iSEL[1]~input_o\ & (((\sMux~10_combout\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[2]~input_o\ & ((\sMux~10_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sMux~11_combout\,
	datac => \iSEL[2]~input_o\,
	datad => \sMux~10_combout\,
	combout => \sMux~12_combout\);

-- Location: LCCOMB_X46_Y18_N4
\sAdd[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[2]~4_combout\ = ((\iB[2]~input_o\ $ (\iA[2]~input_o\ $ (!\sAdd[1]~3\)))) # (GND)
-- \sAdd[2]~5\ = CARRY((\iB[2]~input_o\ & ((\iA[2]~input_o\) # (!\sAdd[1]~3\))) # (!\iB[2]~input_o\ & (\iA[2]~input_o\ & !\sAdd[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[2]~input_o\,
	datab => \iA[2]~input_o\,
	datad => VCC,
	cin => \sAdd[1]~3\,
	combout => \sAdd[2]~4_combout\,
	cout => \sAdd[2]~5\);

-- Location: LCCOMB_X44_Y19_N28
\sMux~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~16_combout\ = (\iSEL[0]~input_o\ & (!\iA[2]~input_o\)) # (!\iSEL[0]~input_o\ & ((\sAdd[2]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \sAdd[2]~4_combout\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~16_combout\);

-- Location: LCCOMB_X44_Y18_N4
\sFX[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[2]~4_combout\ = (\iA[2]~input_o\ & (!\sFX[1]~3\ & VCC)) # (!\iA[2]~input_o\ & (\sFX[1]~3\ $ (GND)))
-- \sFX[2]~5\ = CARRY((!\iA[2]~input_o\ & !\sFX[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[2]~input_o\,
	datad => VCC,
	cin => \sFX[1]~3\,
	combout => \sFX[2]~4_combout\,
	cout => \sFX[2]~5\);

-- Location: LCCOMB_X44_Y19_N14
\sMux~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~13_combout\ = (!\iA[2]~input_o\ & (!\iA[0]~input_o\ & (\iA[1]~input_o\ & !\iSEL[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[0]~input_o\,
	datac => \iA[1]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~13_combout\);

-- Location: LCCOMB_X44_Y19_N8
\sMux~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~14_combout\ = (\sMux~2_combout\ & ((\sMux~3_combout\ & ((\iA[2]~input_o\))) # (!\sMux~3_combout\ & (\sMux~13_combout\)))) # (!\sMux~2_combout\ & (!\sMux~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~2_combout\,
	datab => \sMux~3_combout\,
	datac => \sMux~13_combout\,
	datad => \iA[2]~input_o\,
	combout => \sMux~14_combout\);

-- Location: LCCOMB_X44_Y18_N20
\sGX[2]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[2]~4_combout\ = (\iA[2]~input_o\ & ((GND) # (!\sGX[1]~3\))) # (!\iA[2]~input_o\ & (\sGX[1]~3\ $ (GND)))
-- \sGX[2]~5\ = CARRY((\iA[2]~input_o\) # (!\sGX[1]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[2]~input_o\,
	datad => VCC,
	cin => \sGX[1]~3\,
	combout => \sGX[2]~4_combout\,
	cout => \sGX[2]~5\);

-- Location: LCCOMB_X44_Y19_N10
\sMux~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~15_combout\ = (\sMux~14_combout\ & ((\sFX[2]~4_combout\) # ((\sMux~0_combout\)))) # (!\sMux~14_combout\ & (((\sGX[2]~4_combout\ & !\sMux~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sFX[2]~4_combout\,
	datab => \sMux~14_combout\,
	datac => \sGX[2]~4_combout\,
	datad => \sMux~0_combout\,
	combout => \sMux~15_combout\);

-- Location: LCCOMB_X44_Y19_N30
\sMux~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~17_combout\ = (\iSEL[1]~input_o\ & (((\sMux~15_combout\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[2]~input_o\ & ((\sMux~15_combout\))) # (!\iSEL[2]~input_o\ & (\sMux~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sMux~16_combout\,
	datac => \iSEL[2]~input_o\,
	datad => \sMux~15_combout\,
	combout => \sMux~17_combout\);

-- Location: LCCOMB_X46_Y18_N6
\sAdd[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[3]~6_combout\ = (\iA[3]~input_o\ & ((\iB[3]~input_o\ & (\sAdd[2]~5\ & VCC)) # (!\iB[3]~input_o\ & (!\sAdd[2]~5\)))) # (!\iA[3]~input_o\ & ((\iB[3]~input_o\ & (!\sAdd[2]~5\)) # (!\iB[3]~input_o\ & ((\sAdd[2]~5\) # (GND)))))
-- \sAdd[3]~7\ = CARRY((\iA[3]~input_o\ & (!\iB[3]~input_o\ & !\sAdd[2]~5\)) # (!\iA[3]~input_o\ & ((!\sAdd[2]~5\) # (!\iB[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[3]~input_o\,
	datab => \iB[3]~input_o\,
	datad => VCC,
	cin => \sAdd[2]~5\,
	combout => \sAdd[3]~6_combout\,
	cout => \sAdd[3]~7\);

-- Location: LCCOMB_X43_Y18_N22
\sMux~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~21_combout\ = (\iSEL[0]~input_o\ & (!\iA[3]~input_o\)) # (!\iSEL[0]~input_o\ & ((\sAdd[3]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[3]~input_o\,
	datac => \sAdd[3]~6_combout\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~21_combout\);

-- Location: LCCOMB_X44_Y18_N6
\sFX[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[3]~6_combout\ = (\iA[3]~input_o\ & ((\sFX[2]~5\) # (GND))) # (!\iA[3]~input_o\ & (!\sFX[2]~5\))
-- \sFX[3]~7\ = CARRY((\iA[3]~input_o\) # (!\sFX[2]~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[3]~input_o\,
	datad => VCC,
	cin => \sFX[2]~5\,
	combout => \sFX[3]~6_combout\,
	cout => \sFX[3]~7\);

-- Location: LCCOMB_X44_Y18_N22
\sGX[3]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[3]~6_combout\ = (\iA[3]~input_o\ & (!\sGX[2]~5\)) # (!\iA[3]~input_o\ & ((\sGX[2]~5\) # (GND)))
-- \sGX[3]~7\ = CARRY((!\sGX[2]~5\) # (!\iA[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[3]~input_o\,
	datad => VCC,
	cin => \sGX[2]~5\,
	combout => \sGX[3]~6_combout\,
	cout => \sGX[3]~7\);

-- Location: LCCOMB_X43_Y18_N24
\sMux~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~18_combout\ = (!\iA[2]~input_o\ & (\iA[1]~input_o\ & (\iA[0]~input_o\ & !\iSEL[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[1]~input_o\,
	datac => \iA[0]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~18_combout\);

-- Location: LCCOMB_X43_Y18_N18
\sMux~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~19_combout\ = (\sMux~2_combout\ & ((\sMux~3_combout\ & ((\iA[3]~input_o\))) # (!\sMux~3_combout\ & (\sMux~18_combout\)))) # (!\sMux~2_combout\ & (((!\sMux~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~2_combout\,
	datab => \sMux~18_combout\,
	datac => \sMux~3_combout\,
	datad => \iA[3]~input_o\,
	combout => \sMux~19_combout\);

-- Location: LCCOMB_X43_Y18_N20
\sMux~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~20_combout\ = (\sMux~0_combout\ & (((\sMux~19_combout\)))) # (!\sMux~0_combout\ & ((\sMux~19_combout\ & (\sFX[3]~6_combout\)) # (!\sMux~19_combout\ & ((\sGX[3]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sFX[3]~6_combout\,
	datab => \sGX[3]~6_combout\,
	datac => \sMux~0_combout\,
	datad => \sMux~19_combout\,
	combout => \sMux~20_combout\);

-- Location: LCCOMB_X43_Y18_N8
\sMux~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~22_combout\ = (\iSEL[2]~input_o\ & (((\sMux~20_combout\)))) # (!\iSEL[2]~input_o\ & ((\iSEL[1]~input_o\ & ((\sMux~20_combout\))) # (!\iSEL[1]~input_o\ & (\sMux~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~21_combout\,
	datab => \iSEL[2]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \sMux~20_combout\,
	combout => \sMux~22_combout\);

-- Location: LCCOMB_X47_Y18_N26
\sMux~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~25_combout\ = (\iSEL[1]~input_o\ & (\LessThan0~14_combout\ $ (((\iSEL[0]~input_o\) # (!\iSEL[2]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \LessThan0~14_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \iSEL[2]~input_o\,
	combout => \sMux~25_combout\);

-- Location: LCCOMB_X47_Y18_N20
\sMux~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~26_combout\ = (\iA[4]~input_o\ & \sMux~25_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[4]~input_o\,
	datac => \sMux~25_combout\,
	combout => \sMux~26_combout\);

-- Location: LCCOMB_X44_Y18_N24
\sGX[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[4]~8_combout\ = (\iA[4]~input_o\ & (\sGX[3]~7\ $ (GND))) # (!\iA[4]~input_o\ & (!\sGX[3]~7\ & VCC))
-- \sGX[4]~9\ = CARRY((\iA[4]~input_o\ & !\sGX[3]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[4]~input_o\,
	datad => VCC,
	cin => \sGX[3]~7\,
	combout => \sGX[4]~8_combout\,
	cout => \sGX[4]~9\);

-- Location: LCCOMB_X44_Y18_N8
\sFX[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[4]~8_combout\ = (\iA[4]~input_o\ & (!\sFX[3]~7\ & VCC)) # (!\iA[4]~input_o\ & (\sFX[3]~7\ $ (GND)))
-- \sFX[4]~9\ = CARRY((!\iA[4]~input_o\ & !\sFX[3]~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[4]~input_o\,
	datad => VCC,
	cin => \sFX[3]~7\,
	combout => \sFX[4]~8_combout\,
	cout => \sFX[4]~9\);

-- Location: LCCOMB_X43_Y18_N2
\sMux~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~27_combout\ = (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & (\sGX[4]~8_combout\)) # (!\iSEL[0]~input_o\ & ((\sFX[4]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sGX[4]~8_combout\,
	datac => \sFX[4]~8_combout\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~27_combout\);

-- Location: LCCOMB_X46_Y18_N8
\sAdd[4]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[4]~8_combout\ = ((\iB[4]~input_o\ $ (\iA[4]~input_o\ $ (!\sAdd[3]~7\)))) # (GND)
-- \sAdd[4]~9\ = CARRY((\iB[4]~input_o\ & ((\iA[4]~input_o\) # (!\sAdd[3]~7\))) # (!\iB[4]~input_o\ & (\iA[4]~input_o\ & !\sAdd[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[4]~input_o\,
	datab => \iA[4]~input_o\,
	datad => VCC,
	cin => \sAdd[3]~7\,
	combout => \sAdd[4]~8_combout\,
	cout => \sAdd[4]~9\);

-- Location: LCCOMB_X47_Y18_N6
\sMux~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~23_combout\ = (\iSEL[1]~input_o\ & (((\iSEL[0]~input_o\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & ((!\iA[4]~input_o\))) # (!\iSEL[0]~input_o\ & (\sAdd[4]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \sAdd[4]~8_combout\,
	datac => \iSEL[0]~input_o\,
	datad => \iA[4]~input_o\,
	combout => \sMux~23_combout\);

-- Location: LCCOMB_X47_Y18_N28
\Equal6~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~0_combout\ = (\iA[2]~input_o\ & (!\iA[0]~input_o\ & !\iA[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[0]~input_o\,
	datad => \iA[1]~input_o\,
	combout => \Equal6~0_combout\);

-- Location: LCCOMB_X47_Y18_N24
\sMux~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~24_combout\ = (\sMux~23_combout\ & (((\iA[0]~input_o\) # (!\iSEL[1]~input_o\)))) # (!\sMux~23_combout\ & (\Equal6~0_combout\ & (\iSEL[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~23_combout\,
	datab => \Equal6~0_combout\,
	datac => \iSEL[1]~input_o\,
	datad => \iA[0]~input_o\,
	combout => \sMux~24_combout\);

-- Location: LCCOMB_X47_Y18_N14
\sMux~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~28_combout\ = (\iSEL[2]~input_o\ & ((\sMux~26_combout\) # ((\sMux~27_combout\)))) # (!\iSEL[2]~input_o\ & (((\sMux~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \sMux~26_combout\,
	datac => \sMux~27_combout\,
	datad => \sMux~24_combout\,
	combout => \sMux~28_combout\);

-- Location: LCCOMB_X46_Y18_N10
\sAdd[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[5]~10_combout\ = (\iA[5]~input_o\ & ((\iB[5]~input_o\ & (\sAdd[4]~9\ & VCC)) # (!\iB[5]~input_o\ & (!\sAdd[4]~9\)))) # (!\iA[5]~input_o\ & ((\iB[5]~input_o\ & (!\sAdd[4]~9\)) # (!\iB[5]~input_o\ & ((\sAdd[4]~9\) # (GND)))))
-- \sAdd[5]~11\ = CARRY((\iA[5]~input_o\ & (!\iB[5]~input_o\ & !\sAdd[4]~9\)) # (!\iA[5]~input_o\ & ((!\sAdd[4]~9\) # (!\iB[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[5]~input_o\,
	datab => \iB[5]~input_o\,
	datad => VCC,
	cin => \sAdd[4]~9\,
	combout => \sAdd[5]~10_combout\,
	cout => \sAdd[5]~11\);

-- Location: LCCOMB_X47_Y18_N30
\sMux~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~31_combout\ = (\iSEL[0]~input_o\ & (((\iSEL[1]~input_o\) # (!\iA[5]~input_o\)))) # (!\iSEL[0]~input_o\ & (\sAdd[5]~10_combout\ & (!\iSEL[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sAdd[5]~10_combout\,
	datab => \iSEL[0]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \iA[5]~input_o\,
	combout => \sMux~31_combout\);

-- Location: LCCOMB_X47_Y18_N12
\sDecoder[5]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sDecoder[5]~0_combout\ = (\iA[2]~input_o\ & (\iA[0]~input_o\ & !\iA[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[0]~input_o\,
	datad => \iA[1]~input_o\,
	combout => \sDecoder[5]~0_combout\);

-- Location: LCCOMB_X47_Y18_N16
\sMux~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~32_combout\ = (\sMux~31_combout\ & ((\iA[1]~input_o\) # ((!\iSEL[1]~input_o\)))) # (!\sMux~31_combout\ & (((\iSEL[1]~input_o\ & \sDecoder[5]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~31_combout\,
	datab => \iA[1]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \sDecoder[5]~0_combout\,
	combout => \sMux~32_combout\);

-- Location: LCCOMB_X44_Y18_N26
\sGX[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[5]~10_combout\ = (\iA[5]~input_o\ & (!\sGX[4]~9\)) # (!\iA[5]~input_o\ & ((\sGX[4]~9\) # (GND)))
-- \sGX[5]~11\ = CARRY((!\sGX[4]~9\) # (!\iA[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[5]~input_o\,
	datad => VCC,
	cin => \sGX[4]~9\,
	combout => \sGX[5]~10_combout\,
	cout => \sGX[5]~11\);

-- Location: LCCOMB_X44_Y18_N10
\sFX[5]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[5]~10_combout\ = (\iA[5]~input_o\ & ((\sFX[4]~9\) # (GND))) # (!\iA[5]~input_o\ & (!\sFX[4]~9\))
-- \sFX[5]~11\ = CARRY((\iA[5]~input_o\) # (!\sFX[4]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[5]~input_o\,
	datad => VCC,
	cin => \sFX[4]~9\,
	combout => \sFX[5]~10_combout\,
	cout => \sFX[5]~11\);

-- Location: LCCOMB_X47_Y18_N8
\sMux~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~29_combout\ = (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & (\sGX[5]~10_combout\)) # (!\iSEL[0]~input_o\ & ((\sFX[5]~10_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[1]~input_o\,
	datab => \iSEL[0]~input_o\,
	datac => \sGX[5]~10_combout\,
	datad => \sFX[5]~10_combout\,
	combout => \sMux~29_combout\);

-- Location: LCCOMB_X47_Y18_N18
\sMux~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~30_combout\ = (\iSEL[2]~input_o\ & ((\sMux~29_combout\) # ((\sMux~25_combout\ & \iA[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \sMux~29_combout\,
	datac => \sMux~25_combout\,
	datad => \iA[5]~input_o\,
	combout => \sMux~30_combout\);

-- Location: LCCOMB_X47_Y18_N2
\sMux~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~33_combout\ = (\sMux~30_combout\) # ((!\iSEL[2]~input_o\ & \sMux~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iSEL[2]~input_o\,
	datab => \sMux~32_combout\,
	datad => \sMux~30_combout\,
	combout => \sMux~33_combout\);

-- Location: LCCOMB_X44_Y18_N28
\sGX[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[6]~12_combout\ = (\iA[6]~input_o\ & (\sGX[5]~11\ $ (GND))) # (!\iA[6]~input_o\ & (!\sGX[5]~11\ & VCC))
-- \sGX[6]~13\ = CARRY((\iA[6]~input_o\ & !\sGX[5]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[6]~input_o\,
	datad => VCC,
	cin => \sGX[5]~11\,
	combout => \sGX[6]~12_combout\,
	cout => \sGX[6]~13\);

-- Location: LCCOMB_X44_Y18_N12
\sFX[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[6]~12_combout\ = (\iA[6]~input_o\ & (!\sFX[5]~11\ & VCC)) # (!\iA[6]~input_o\ & (\sFX[5]~11\ $ (GND)))
-- \sFX[6]~13\ = CARRY((!\iA[6]~input_o\ & !\sFX[5]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[6]~input_o\,
	datad => VCC,
	cin => \sFX[5]~11\,
	combout => \sFX[6]~12_combout\,
	cout => \sFX[6]~13\);

-- Location: LCCOMB_X46_Y18_N12
\sAdd[6]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[6]~12_combout\ = ((\iB[6]~input_o\ $ (\iA[6]~input_o\ $ (!\sAdd[5]~11\)))) # (GND)
-- \sAdd[6]~13\ = CARRY((\iB[6]~input_o\ & ((\iA[6]~input_o\) # (!\sAdd[5]~11\))) # (!\iB[6]~input_o\ & (\iA[6]~input_o\ & !\sAdd[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iB[6]~input_o\,
	datab => \iA[6]~input_o\,
	datad => VCC,
	cin => \sAdd[5]~11\,
	combout => \sAdd[6]~12_combout\,
	cout => \sAdd[6]~13\);

-- Location: LCCOMB_X43_Y18_N6
\sMux~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~34_combout\ = (\iSEL[1]~input_o\ & (((\iSEL[0]~input_o\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & ((!\iA[6]~input_o\))) # (!\iSEL[0]~input_o\ & (\sAdd[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sAdd[6]~12_combout\,
	datab => \iA[6]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~34_combout\);

-- Location: LCCOMB_X43_Y18_N0
\sMux~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~35_combout\ = (\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\) # ((\iA[2]~input_o\ & \iA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[1]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~35_combout\);

-- Location: LCCOMB_X43_Y18_N4
\Equal6~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~1_combout\ = (\iA[1]~input_o\ & !\iA[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \iA[1]~input_o\,
	datad => \iA[0]~input_o\,
	combout => \Equal6~1_combout\);

-- Location: LCCOMB_X43_Y18_N26
\sMux~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~36_combout\ = (\sMux~35_combout\ & (\iA[2]~input_o\ & ((\sMux~34_combout\) # (\Equal6~1_combout\)))) # (!\sMux~35_combout\ & (\sMux~34_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~34_combout\,
	datab => \sMux~35_combout\,
	datac => \Equal6~1_combout\,
	datad => \iA[2]~input_o\,
	combout => \sMux~36_combout\);

-- Location: LCCOMB_X43_Y18_N28
\sMux~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~37_combout\ = (\sMux~2_combout\ & ((\sMux~3_combout\ & ((\iA[6]~input_o\))) # (!\sMux~3_combout\ & (\sMux~36_combout\)))) # (!\sMux~2_combout\ & (!\sMux~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~2_combout\,
	datab => \sMux~3_combout\,
	datac => \sMux~36_combout\,
	datad => \iA[6]~input_o\,
	combout => \sMux~37_combout\);

-- Location: LCCOMB_X43_Y18_N30
\sMux~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~38_combout\ = (\sMux~0_combout\ & (((\sMux~37_combout\)))) # (!\sMux~0_combout\ & ((\sMux~37_combout\ & ((\sFX[6]~12_combout\))) # (!\sMux~37_combout\ & (\sGX[6]~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sGX[6]~12_combout\,
	datab => \sFX[6]~12_combout\,
	datac => \sMux~0_combout\,
	datad => \sMux~37_combout\,
	combout => \sMux~38_combout\);

-- Location: LCCOMB_X44_Y18_N30
\sGX[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sGX[7]~14_combout\ = \iA[7]~input_o\ $ (\sGX[6]~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[7]~input_o\,
	cin => \sGX[6]~13\,
	combout => \sGX[7]~14_combout\);

-- Location: LCCOMB_X46_Y18_N14
\sAdd[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sAdd[7]~14_combout\ = \iA[7]~input_o\ $ (\sAdd[6]~13\ $ (\iB[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \iA[7]~input_o\,
	datad => \iB[7]~input_o\,
	cin => \sAdd[6]~13\,
	combout => \sAdd[7]~14_combout\);

-- Location: LCCOMB_X43_Y18_N10
\sMux~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~39_combout\ = (\iSEL[1]~input_o\ & (((\iSEL[0]~input_o\)))) # (!\iSEL[1]~input_o\ & ((\iSEL[0]~input_o\ & ((!\iA[7]~input_o\))) # (!\iSEL[0]~input_o\ & (\sAdd[7]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sAdd[7]~14_combout\,
	datab => \iA[7]~input_o\,
	datac => \iSEL[1]~input_o\,
	datad => \iSEL[0]~input_o\,
	combout => \sMux~39_combout\);

-- Location: LCCOMB_X43_Y18_N16
\Equal6~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal6~2_combout\ = (\iA[2]~input_o\ & (!\iA[0]~input_o\ & \iA[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[0]~input_o\,
	datad => \iA[1]~input_o\,
	combout => \Equal6~2_combout\);

-- Location: LCCOMB_X43_Y18_N12
\sMux~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~40_combout\ = (\sMux~39_combout\ & (((\iA[3]~input_o\) # (!\sMux~35_combout\)))) # (!\sMux~39_combout\ & (!\Equal6~2_combout\ & ((\sMux~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~39_combout\,
	datab => \Equal6~2_combout\,
	datac => \iA[3]~input_o\,
	datad => \sMux~35_combout\,
	combout => \sMux~40_combout\);

-- Location: LCCOMB_X43_Y18_N14
\sMux~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~41_combout\ = (\sMux~3_combout\ & (((\iA[7]~input_o\ & \sMux~2_combout\)))) # (!\sMux~3_combout\ & ((\sMux~40_combout\) # ((!\sMux~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~40_combout\,
	datab => \iA[7]~input_o\,
	datac => \sMux~3_combout\,
	datad => \sMux~2_combout\,
	combout => \sMux~41_combout\);

-- Location: LCCOMB_X44_Y18_N14
\sFX[7]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sFX[7]~14_combout\ = \iA[7]~input_o\ $ (!\sFX[6]~13\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \iA[7]~input_o\,
	cin => \sFX[6]~13\,
	combout => \sFX[7]~14_combout\);

-- Location: LCCOMB_X44_Y17_N0
\sMux~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~42_combout\ = (\sMux~41_combout\ & (((\sMux~0_combout\) # (\sFX[7]~14_combout\)))) # (!\sMux~41_combout\ & (\sGX[7]~14_combout\ & (!\sMux~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sGX[7]~14_combout\,
	datab => \sMux~41_combout\,
	datac => \sMux~0_combout\,
	datad => \sFX[7]~14_combout\,
	combout => \sMux~42_combout\);

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

ww_oY(4) <= \oY[4]~output_o\;

ww_oY(5) <= \oY[5]~output_o\;

ww_oY(6) <= \oY[6]~output_o\;

ww_oY(7) <= \oY[7]~output_o\;
END structure;


