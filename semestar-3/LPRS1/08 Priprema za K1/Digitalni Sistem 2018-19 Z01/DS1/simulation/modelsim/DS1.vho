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

-- DATE "11/28/2021 10:32:59"

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

ENTITY 	DS1 IS
    PORT (
	iA : IN std_logic_vector(15 DOWNTO 0);
	iB : IN std_logic_vector(3 DOWNTO 0);
	oRESULT : OUT std_logic_vector(3 DOWNTO 0)
	);
END DS1;

-- Design Ports Information
-- iA[0]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[1]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[0]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[1]	=>  Location: PIN_K7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[0]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[1]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[2]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- oRESULT[3]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[12]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[13]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[3]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iB[2]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[14]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[15]	=>  Location: PIN_E3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[8]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[10]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[11]	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[9]	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[6]	=>  Location: PIN_E4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[7]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[4]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[5]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[2]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- iA[3]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_iA : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_iB : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_oRESULT : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \iA[0]~input_o\ : std_logic;
SIGNAL \iA[1]~input_o\ : std_logic;
SIGNAL \iB[0]~input_o\ : std_logic;
SIGNAL \iB[1]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \oRESULT[0]~output_o\ : std_logic;
SIGNAL \oRESULT[1]~output_o\ : std_logic;
SIGNAL \oRESULT[2]~output_o\ : std_logic;
SIGNAL \oRESULT[3]~output_o\ : std_logic;
SIGNAL \iA[13]~input_o\ : std_logic;
SIGNAL \iA[8]~input_o\ : std_logic;
SIGNAL \iA[7]~input_o\ : std_logic;
SIGNAL \iA[9]~input_o\ : std_logic;
SIGNAL \iA[2]~input_o\ : std_logic;
SIGNAL \iA[3]~input_o\ : std_logic;
SIGNAL \iA[4]~input_o\ : std_logic;
SIGNAL \iA[5]~input_o\ : std_logic;
SIGNAL \sMux~3_combout\ : std_logic;
SIGNAL \iA[6]~input_o\ : std_logic;
SIGNAL \sMux~4_combout\ : std_logic;
SIGNAL \iA[11]~input_o\ : std_logic;
SIGNAL \iA[10]~input_o\ : std_logic;
SIGNAL \sMux~5_combout\ : std_logic;
SIGNAL \iA[12]~input_o\ : std_logic;
SIGNAL \iB[3]~input_o\ : std_logic;
SIGNAL \iB[2]~input_o\ : std_logic;
SIGNAL \iA[15]~input_o\ : std_logic;
SIGNAL \iA[14]~input_o\ : std_logic;
SIGNAL \sMux~2_combout\ : std_logic;
SIGNAL \sMux~6_combout\ : std_logic;
SIGNAL \sMux~9_combout\ : std_logic;
SIGNAL \sMux~8_combout\ : std_logic;
SIGNAL \sMux~7_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \sMux~10_combout\ : std_logic;
SIGNAL \sMux~11_combout\ : std_logic;
SIGNAL \ALT_INV_sMux~10_combout\ : std_logic;
SIGNAL \ALT_INV_sMux~6_combout\ : std_logic;

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
\ALT_INV_sMux~10_combout\ <= NOT \sMux~10_combout\;
\ALT_INV_sMux~6_combout\ <= NOT \sMux~6_combout\;
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

-- Location: IOOBUF_X50_Y21_N24
\oRESULT[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_sMux~6_combout\,
	devoe => ww_devoe,
	o => \oRESULT[0]~output_o\);

-- Location: IOOBUF_X50_Y21_N9
\oRESULT[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_sMux~10_combout\,
	devoe => ww_devoe,
	o => \oRESULT[1]~output_o\);

-- Location: IOOBUF_X50_Y21_N2
\oRESULT[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sMux~11_combout\,
	devoe => ww_devoe,
	o => \oRESULT[2]~output_o\);

-- Location: IOOBUF_X50_Y15_N23
\oRESULT[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \oRESULT[3]~output_o\);

-- Location: IOIBUF_X25_Y25_N15
\iA[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(13),
	o => \iA[13]~input_o\);

-- Location: IOIBUF_X19_Y17_N29
\iA[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(8),
	o => \iA[8]~input_o\);

-- Location: IOIBUF_X19_Y17_N1
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

-- Location: IOIBUF_X25_Y22_N22
\iA[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(9),
	o => \iA[9]~input_o\);

-- Location: IOIBUF_X50_Y22_N1
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

-- Location: IOIBUF_X50_Y22_N15
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

-- Location: IOIBUF_X50_Y22_N8
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

-- Location: LCCOMB_X49_Y22_N24
\sMux~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~3_combout\ = (\iA[4]~input_o\) # ((\iA[5]~input_o\) # ((!\iA[2]~input_o\ & !\iA[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[2]~input_o\,
	datab => \iA[3]~input_o\,
	datac => \iA[4]~input_o\,
	datad => \iA[5]~input_o\,
	combout => \sMux~3_combout\);

-- Location: IOIBUF_X25_Y24_N22
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

-- Location: LCCOMB_X31_Y21_N18
\sMux~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~4_combout\ = (\iA[9]~input_o\) # ((!\iA[7]~input_o\ & (\sMux~3_combout\ & !\iA[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[7]~input_o\,
	datab => \iA[9]~input_o\,
	datac => \sMux~3_combout\,
	datad => \iA[6]~input_o\,
	combout => \sMux~4_combout\);

-- Location: IOIBUF_X25_Y23_N15
\iA[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(11),
	o => \iA[11]~input_o\);

-- Location: IOIBUF_X50_Y21_N15
\iA[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(10),
	o => \iA[10]~input_o\);

-- Location: LCCOMB_X31_Y21_N20
\sMux~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~5_combout\ = (!\iA[11]~input_o\ & (!\iA[10]~input_o\ & ((\iA[8]~input_o\) # (\sMux~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[8]~input_o\,
	datab => \sMux~4_combout\,
	datac => \iA[11]~input_o\,
	datad => \iA[10]~input_o\,
	combout => \sMux~5_combout\);

-- Location: IOIBUF_X25_Y25_N22
\iA[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(12),
	o => \iA[12]~input_o\);

-- Location: IOIBUF_X25_Y22_N15
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

-- Location: IOIBUF_X25_Y23_N22
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

-- Location: IOIBUF_X25_Y24_N15
\iA[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(15),
	o => \iA[15]~input_o\);

-- Location: IOIBUF_X21_Y17_N29
\iA[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_iA(14),
	o => \iA[14]~input_o\);

-- Location: LCCOMB_X31_Y21_N0
\sMux~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~2_combout\ = (!\iA[15]~input_o\ & (!\iA[14]~input_o\ & ((\iB[3]~input_o\) # (!\iB[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iB[3]~input_o\,
	datab => \iB[2]~input_o\,
	datac => \iA[15]~input_o\,
	datad => \iA[14]~input_o\,
	combout => \sMux~2_combout\);

-- Location: LCCOMB_X31_Y21_N22
\sMux~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~6_combout\ = (\sMux~2_combout\ & ((\iA[13]~input_o\) # ((\sMux~5_combout\) # (\iA[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[13]~input_o\,
	datab => \sMux~5_combout\,
	datac => \iA[12]~input_o\,
	datad => \sMux~2_combout\,
	combout => \sMux~6_combout\);

-- Location: LCCOMB_X31_Y21_N6
\sMux~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~9_combout\ = (!\iA[8]~input_o\ & (!\iA[9]~input_o\ & (!\iA[11]~input_o\ & !\iA[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[8]~input_o\,
	datab => \iA[9]~input_o\,
	datac => \iA[11]~input_o\,
	datad => \iA[10]~input_o\,
	combout => \sMux~9_combout\);

-- Location: LCCOMB_X31_Y21_N4
\sMux~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~8_combout\ = (!\iA[7]~input_o\ & (!\iA[6]~input_o\ & (!\iA[4]~input_o\ & !\iA[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[7]~input_o\,
	datab => \iA[6]~input_o\,
	datac => \iA[4]~input_o\,
	datad => \iA[5]~input_o\,
	combout => \sMux~8_combout\);

-- Location: LCCOMB_X31_Y21_N26
\sMux~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~7_combout\ = (!\iA[13]~input_o\ & (!\iA[15]~input_o\ & (!\iA[12]~input_o\ & !\iA[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \iA[13]~input_o\,
	datab => \iA[15]~input_o\,
	datac => \iA[12]~input_o\,
	datad => \iA[14]~input_o\,
	combout => \sMux~7_combout\);

-- Location: LCCOMB_X31_Y21_N24
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\iB[3]~input_o\ & \iB[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \iB[3]~input_o\,
	datad => \iB[2]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X31_Y21_N8
\sMux~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~10_combout\ = (\Equal0~0_combout\) # ((\sMux~7_combout\ & ((\sMux~8_combout\) # (!\sMux~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~9_combout\,
	datab => \sMux~8_combout\,
	datac => \sMux~7_combout\,
	datad => \Equal0~0_combout\,
	combout => \sMux~10_combout\);

-- Location: LCCOMB_X31_Y21_N10
\sMux~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \sMux~11_combout\ = (\sMux~7_combout\ & (!\sMux~9_combout\ & ((\iB[3]~input_o\) # (!\iB[2]~input_o\)))) # (!\sMux~7_combout\ & (((\iB[3]~input_o\)) # (!\iB[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sMux~7_combout\,
	datab => \iB[2]~input_o\,
	datac => \iB[3]~input_o\,
	datad => \sMux~9_combout\,
	combout => \sMux~11_combout\);

-- Location: IOIBUF_X10_Y17_N8
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

-- Location: IOIBUF_X8_Y0_N8
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

-- Location: IOIBUF_X16_Y0_N1
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

-- Location: IOIBUF_X16_Y0_N8
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
END structure;


