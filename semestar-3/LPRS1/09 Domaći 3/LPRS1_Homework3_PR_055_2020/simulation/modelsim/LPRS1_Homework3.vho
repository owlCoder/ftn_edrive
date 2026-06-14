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

-- DATE "12/02/2021 14:04:08"

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
-- ~ALTERA_TMS~	=>  Location: PIN_G1,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_F5,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_F6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_D7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_E7,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_C4,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_C5,	 I/O Standard: 3.3 V Schmitt Trigger,	 Current Strength: Default


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

ENTITY 	lprs1_homework3 IS
    PORT (
	i_clk : IN std_logic;
	i_rst : IN std_logic;
	i_base : IN std_logic_vector(1 DOWNTO 0);
	i_sequence : IN std_logic_vector(63 DOWNTO 0);
	i_load_sequence : IN std_logic;
	i_base_src_sel : IN std_logic;
	i_cnt_subseq_sel : IN std_logic_vector(1 DOWNTO 0);
	o_cnt_subseq : OUT std_logic_vector(3 DOWNTO 0)
	);
END lprs1_homework3;

-- Design Ports Information
-- o_cnt_subseq[0]	=>  Location: PIN_H1,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_cnt_subseq[1]	=>  Location: PIN_G5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_cnt_subseq[2]	=>  Location: PIN_F4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- o_cnt_subseq[3]	=>  Location: PIN_H2,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: 2mA
-- i_cnt_subseq_sel[1]	=>  Location: PIN_J1,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_cnt_subseq_sel[0]	=>  Location: PIN_G4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_clk	=>  Location: PIN_H6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- i_rst	=>  Location: PIN_H5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_base[1]	=>  Location: PIN_A5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_base_src_sel	=>  Location: PIN_A2,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_base[0]	=>  Location: PIN_B2,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[63]	=>  Location: PIN_J5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_load_sequence	=>  Location: PIN_N5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[62]	=>  Location: PIN_E6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[61]	=>  Location: PIN_D6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[60]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[59]	=>  Location: PIN_A6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[58]	=>  Location: PIN_A3,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[57]	=>  Location: PIN_B4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[56]	=>  Location: PIN_H3,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[55]	=>  Location: PIN_B3,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[54]	=>  Location: PIN_A7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[53]	=>  Location: PIN_A4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[52]	=>  Location: PIN_B9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[51]	=>  Location: PIN_B7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[50]	=>  Location: PIN_D8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[49]	=>  Location: PIN_B6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[48]	=>  Location: PIN_B5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[47]	=>  Location: PIN_M10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[46]	=>  Location: PIN_C10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[45]	=>  Location: PIN_H8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[44]	=>  Location: PIN_L13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[43]	=>  Location: PIN_L12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[42]	=>  Location: PIN_E1,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[41]	=>  Location: PIN_N10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[40]	=>  Location: PIN_K12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[39]	=>  Location: PIN_G9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[38]	=>  Location: PIN_J13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[37]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[36]	=>  Location: PIN_M5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[35]	=>  Location: PIN_E8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[34]	=>  Location: PIN_J6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[33]	=>  Location: PIN_M7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[32]	=>  Location: PIN_J12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[31]	=>  Location: PIN_N8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[30]	=>  Location: PIN_L4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[29]	=>  Location: PIN_L11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[28]	=>  Location: PIN_M9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[27]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[26]	=>  Location: PIN_K6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[25]	=>  Location: PIN_N7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[24]	=>  Location: PIN_M8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[23]	=>  Location: PIN_K10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[22]	=>  Location: PIN_J7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[21]	=>  Location: PIN_N4,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[20]	=>  Location: PIN_K8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[19]	=>  Location: PIN_N12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[18]	=>  Location: PIN_K11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[17]	=>  Location: PIN_G12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[16]	=>  Location: PIN_A8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[15]	=>  Location: PIN_M12,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[14]	=>  Location: PIN_N9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[13]	=>  Location: PIN_A9,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[12]	=>  Location: PIN_H10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[11]	=>  Location: PIN_K13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[10]	=>  Location: PIN_N6,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[9]	=>  Location: PIN_F1,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[8]	=>  Location: PIN_M13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[7]	=>  Location: PIN_K7,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[6]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[5]	=>  Location: PIN_K5,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[4]	=>  Location: PIN_N11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[3]	=>  Location: PIN_M11,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[2]	=>  Location: PIN_L10,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[1]	=>  Location: PIN_J8,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- i_sequence[0]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default


ARCHITECTURE structure OF lprs1_homework3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_clk : std_logic;
SIGNAL ww_i_rst : std_logic;
SIGNAL ww_i_base : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_i_sequence : std_logic_vector(63 DOWNTO 0);
SIGNAL ww_i_load_sequence : std_logic;
SIGNAL ww_i_base_src_sel : std_logic;
SIGNAL ww_i_cnt_subseq_sel : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_o_cnt_subseq : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \i_clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_rst~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \o_cnt_subseq[0]~output_o\ : std_logic;
SIGNAL \o_cnt_subseq[1]~output_o\ : std_logic;
SIGNAL \o_cnt_subseq[2]~output_o\ : std_logic;
SIGNAL \o_cnt_subseq[3]~output_o\ : std_logic;
SIGNAL \i_clk~input_o\ : std_logic;
SIGNAL \i_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \s_cnt_subseq1~1_combout\ : std_logic;
SIGNAL \i_rst~input_o\ : std_logic;
SIGNAL \i_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \i_base_src_sel~input_o\ : std_logic;
SIGNAL \i_base[1]~input_o\ : std_logic;
SIGNAL \i_sequence[63]~input_o\ : std_logic;
SIGNAL \i_load_sequence~input_o\ : std_logic;
SIGNAL \i_sequence[62]~input_o\ : std_logic;
SIGNAL \i_sequence[61]~input_o\ : std_logic;
SIGNAL \i_sequence[58]~input_o\ : std_logic;
SIGNAL \i_sequence[57]~input_o\ : std_logic;
SIGNAL \i_sequence[56]~input_o\ : std_logic;
SIGNAL \i_sequence[55]~input_o\ : std_logic;
SIGNAL \i_sequence[54]~input_o\ : std_logic;
SIGNAL \i_sequence[53]~input_o\ : std_logic;
SIGNAL \i_sequence[51]~input_o\ : std_logic;
SIGNAL \i_sequence[49]~input_o\ : std_logic;
SIGNAL \i_sequence[47]~input_o\ : std_logic;
SIGNAL \i_sequence[42]~input_o\ : std_logic;
SIGNAL \i_sequence[41]~input_o\ : std_logic;
SIGNAL \i_sequence[40]~input_o\ : std_logic;
SIGNAL \i_sequence[38]~input_o\ : std_logic;
SIGNAL \i_sequence[37]~input_o\ : std_logic;
SIGNAL \i_sequence[36]~input_o\ : std_logic;
SIGNAL \i_sequence[34]~input_o\ : std_logic;
SIGNAL \i_sequence[33]~input_o\ : std_logic;
SIGNAL \i_sequence[31]~input_o\ : std_logic;
SIGNAL \i_sequence[30]~input_o\ : std_logic;
SIGNAL \i_sequence[29]~input_o\ : std_logic;
SIGNAL \i_sequence[28]~input_o\ : std_logic;
SIGNAL \i_sequence[26]~input_o\ : std_logic;
SIGNAL \i_sequence[25]~input_o\ : std_logic;
SIGNAL \i_sequence[24]~input_o\ : std_logic;
SIGNAL \i_sequence[19]~input_o\ : std_logic;
SIGNAL \i_sequence[16]~input_o\ : std_logic;
SIGNAL \i_sequence[15]~input_o\ : std_logic;
SIGNAL \i_sequence[14]~input_o\ : std_logic;
SIGNAL \i_sequence[13]~input_o\ : std_logic;
SIGNAL \i_sequence[9]~input_o\ : std_logic;
SIGNAL \i_sequence[8]~input_o\ : std_logic;
SIGNAL \i_sequence[7]~input_o\ : std_logic;
SIGNAL \i_sequence[5]~input_o\ : std_logic;
SIGNAL \i_sequence[4]~input_o\ : std_logic;
SIGNAL \i_sequence[3]~input_o\ : std_logic;
SIGNAL \i_sequence[2]~input_o\ : std_logic;
SIGNAL \i_sequence[0]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[0]~63_combout\ : std_logic;
SIGNAL \i_sequence[1]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[1]~62_combout\ : std_logic;
SIGNAL \s_n_sh_reg[2]~61_combout\ : std_logic;
SIGNAL \s_n_sh_reg[3]~60_combout\ : std_logic;
SIGNAL \s_n_sh_reg[4]~59_combout\ : std_logic;
SIGNAL \s_n_sh_reg[5]~58_combout\ : std_logic;
SIGNAL \i_sequence[6]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[6]~57_combout\ : std_logic;
SIGNAL \s_n_sh_reg[7]~56_combout\ : std_logic;
SIGNAL \s_n_sh_reg[8]~55_combout\ : std_logic;
SIGNAL \s_n_sh_reg[9]~54_combout\ : std_logic;
SIGNAL \i_sequence[10]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[10]~53_combout\ : std_logic;
SIGNAL \i_sequence[11]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[11]~52_combout\ : std_logic;
SIGNAL \i_sequence[12]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[12]~51_combout\ : std_logic;
SIGNAL \s_n_sh_reg[13]~50_combout\ : std_logic;
SIGNAL \s_n_sh_reg[14]~49_combout\ : std_logic;
SIGNAL \s_n_sh_reg[15]~48_combout\ : std_logic;
SIGNAL \s_n_sh_reg[16]~47_combout\ : std_logic;
SIGNAL \i_sequence[17]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[17]~46_combout\ : std_logic;
SIGNAL \i_sequence[18]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[18]~45_combout\ : std_logic;
SIGNAL \s_n_sh_reg[19]~44_combout\ : std_logic;
SIGNAL \i_sequence[20]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[20]~43_combout\ : std_logic;
SIGNAL \i_sequence[21]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[21]~42_combout\ : std_logic;
SIGNAL \i_sequence[22]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[22]~41_combout\ : std_logic;
SIGNAL \i_sequence[23]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[23]~40_combout\ : std_logic;
SIGNAL \s_n_sh_reg[24]~39_combout\ : std_logic;
SIGNAL \s_n_sh_reg[25]~38_combout\ : std_logic;
SIGNAL \s_n_sh_reg[26]~37_combout\ : std_logic;
SIGNAL \i_sequence[27]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[27]~36_combout\ : std_logic;
SIGNAL \s_n_sh_reg[28]~35_combout\ : std_logic;
SIGNAL \s_n_sh_reg[29]~34_combout\ : std_logic;
SIGNAL \s_n_sh_reg[30]~33_combout\ : std_logic;
SIGNAL \s_n_sh_reg[31]~32_combout\ : std_logic;
SIGNAL \i_sequence[32]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[32]~31_combout\ : std_logic;
SIGNAL \s_n_sh_reg[33]~30_combout\ : std_logic;
SIGNAL \s_n_sh_reg[34]~29_combout\ : std_logic;
SIGNAL \i_sequence[35]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[35]~28_combout\ : std_logic;
SIGNAL \s_n_sh_reg[36]~27_combout\ : std_logic;
SIGNAL \s_n_sh_reg[37]~26_combout\ : std_logic;
SIGNAL \s_n_sh_reg[38]~25_combout\ : std_logic;
SIGNAL \i_sequence[39]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[39]~24_combout\ : std_logic;
SIGNAL \s_n_sh_reg[40]~23_combout\ : std_logic;
SIGNAL \s_n_sh_reg[41]~22_combout\ : std_logic;
SIGNAL \s_n_sh_reg[42]~21_combout\ : std_logic;
SIGNAL \i_sequence[43]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[43]~20_combout\ : std_logic;
SIGNAL \i_sequence[44]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[44]~19_combout\ : std_logic;
SIGNAL \i_sequence[45]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[45]~18_combout\ : std_logic;
SIGNAL \i_sequence[46]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[46]~17_combout\ : std_logic;
SIGNAL \s_n_sh_reg[47]~16_combout\ : std_logic;
SIGNAL \s_sh_reg[47]~feeder_combout\ : std_logic;
SIGNAL \i_sequence[48]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[48]~15_combout\ : std_logic;
SIGNAL \s_n_sh_reg[49]~14_combout\ : std_logic;
SIGNAL \i_sequence[50]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[50]~13_combout\ : std_logic;
SIGNAL \s_n_sh_reg[51]~12_combout\ : std_logic;
SIGNAL \i_sequence[52]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[52]~11_combout\ : std_logic;
SIGNAL \s_n_sh_reg[53]~10_combout\ : std_logic;
SIGNAL \s_n_sh_reg[54]~9_combout\ : std_logic;
SIGNAL \s_n_sh_reg[55]~8_combout\ : std_logic;
SIGNAL \s_n_sh_reg[56]~7_combout\ : std_logic;
SIGNAL \s_n_sh_reg[57]~6_combout\ : std_logic;
SIGNAL \s_n_sh_reg[58]~5_combout\ : std_logic;
SIGNAL \i_sequence[59]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[59]~4_combout\ : std_logic;
SIGNAL \i_sequence[60]~input_o\ : std_logic;
SIGNAL \s_n_sh_reg[60]~3_combout\ : std_logic;
SIGNAL \s_n_sh_reg[61]~2_combout\ : std_logic;
SIGNAL \s_n_sh_reg[62]~1_combout\ : std_logic;
SIGNAL \s_n_sh_reg[63]~0_combout\ : std_logic;
SIGNAL \s_base[1]~0_combout\ : std_logic;
SIGNAL \i_base[0]~input_o\ : std_logic;
SIGNAL \s_base[0]~1_combout\ : std_logic;
SIGNAL \s_next_state.C0T1~0_combout\ : std_logic;
SIGNAL \s_state.C0T1~q\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \s_state.C0S012~q\ : std_logic;
SIGNAL \s_next_state.C0A1~0_combout\ : std_logic;
SIGNAL \s_state.C0A1~q\ : std_logic;
SIGNAL \s_next_state.C0A1T2~0_combout\ : std_logic;
SIGNAL \s_state.C0A1T2~q\ : std_logic;
SIGNAL \s_cnt_subseq1~2_combout\ : std_logic;
SIGNAL \s_cnt_subseq1~3_combout\ : std_logic;
SIGNAL \s_cnt_subseq1~0_combout\ : std_logic;
SIGNAL \i_cnt_subseq_sel[1]~input_o\ : std_logic;
SIGNAL \i_cnt_subseq_sel[0]~input_o\ : std_logic;
SIGNAL \s_cnt_subseq0~3_combout\ : std_logic;
SIGNAL \s_cnt_subseq0~2_combout\ : std_logic;
SIGNAL \s_next_state.C0A1C2~0_combout\ : std_logic;
SIGNAL \s_state.C0A1C2~q\ : std_logic;
SIGNAL \s_cnt_subseq0[0]~1_combout\ : std_logic;
SIGNAL \s_cnt_subseq0~4_combout\ : std_logic;
SIGNAL \s_cnt_subseq0~5_combout\ : std_logic;
SIGNAL \s_cnt_subseq0~0_combout\ : std_logic;
SIGNAL \s_cnt_subseq2[0]~1_combout\ : std_logic;
SIGNAL \s_next_state.C0T1T2~0_combout\ : std_logic;
SIGNAL \s_state.C0T1T2~q\ : std_logic;
SIGNAL \o_cnt_subseq~0_combout\ : std_logic;
SIGNAL \o_cnt_subseq~1_combout\ : std_logic;
SIGNAL \s_cnt_subseq2~0_combout\ : std_logic;
SIGNAL \o_cnt_subseq~2_combout\ : std_logic;
SIGNAL \o_cnt_subseq~3_combout\ : std_logic;
SIGNAL \o_cnt_subseq~4_combout\ : std_logic;
SIGNAL \o_cnt_subseq~5_combout\ : std_logic;
SIGNAL s_cnt_subseq2 : std_logic_vector(3 DOWNTO 0);
SIGNAL s_cnt_subseq0 : std_logic_vector(3 DOWNTO 0);
SIGNAL s_cnt_subseq1 : std_logic_vector(3 DOWNTO 0);
SIGNAL s_sh_base : std_logic_vector(1 DOWNTO 0);
SIGNAL s_sh_reg : std_logic_vector(63 DOWNTO 0);
SIGNAL \ALT_INV_i_rst~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_i_clk~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_clk <= i_clk;
ww_i_rst <= i_rst;
ww_i_base <= i_base;
ww_i_sequence <= i_sequence;
ww_i_load_sequence <= i_load_sequence;
ww_i_base_src_sel <= i_base_src_sel;
ww_i_cnt_subseq_sel <= i_cnt_subseq_sel;
o_cnt_subseq <= ww_o_cnt_subseq;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\i_clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_clk~input_o\);

\i_rst~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \i_rst~input_o\);
\ALT_INV_i_rst~inputclkctrl_outclk\ <= NOT \i_rst~inputclkctrl_outclk\;
\ALT_INV_i_clk~inputclkctrl_outclk\ <= NOT \i_clk~inputclkctrl_outclk\;
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

-- Location: IOOBUF_X0_Y14_N2
\o_cnt_subseq[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_cnt_subseq~1_combout\,
	devoe => ww_devoe,
	o => \o_cnt_subseq[0]~output_o\);

-- Location: IOOBUF_X0_Y9_N16
\o_cnt_subseq[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_cnt_subseq~3_combout\,
	devoe => ww_devoe,
	o => \o_cnt_subseq[1]~output_o\);

-- Location: IOOBUF_X0_Y12_N16
\o_cnt_subseq[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_cnt_subseq~4_combout\,
	devoe => ww_devoe,
	o => \o_cnt_subseq[2]~output_o\);

-- Location: IOOBUF_X0_Y11_N16
\o_cnt_subseq[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \o_cnt_subseq~5_combout\,
	devoe => ww_devoe,
	o => \o_cnt_subseq[3]~output_o\);

-- Location: IOIBUF_X0_Y9_N22
\i_clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_clk,
	o => \i_clk~input_o\);

-- Location: CLKCTRL_G4
\i_clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X6_Y13_N4
\s_cnt_subseq1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq1~1_combout\ = (!s_cnt_subseq1(3) & (s_cnt_subseq1(1) $ (s_cnt_subseq1(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq1(3),
	datac => s_cnt_subseq1(1),
	datad => s_cnt_subseq1(0),
	combout => \s_cnt_subseq1~1_combout\);

-- Location: IOIBUF_X0_Y8_N15
\i_rst~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_rst,
	o => \i_rst~input_o\);

-- Location: CLKCTRL_G3
\i_rst~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \i_rst~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \i_rst~inputclkctrl_outclk\);

-- Location: IOIBUF_X8_Y17_N15
\i_base_src_sel~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_base_src_sel,
	o => \i_base_src_sel~input_o\);

-- Location: IOIBUF_X8_Y17_N1
\i_base[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_base(1),
	o => \i_base[1]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\i_sequence[63]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(63),
	o => \i_sequence[63]~input_o\);

-- Location: IOIBUF_X6_Y0_N15
\i_load_sequence~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_load_sequence,
	o => \i_load_sequence~input_o\);

-- Location: IOIBUF_X12_Y17_N29
\i_sequence[62]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(62),
	o => \i_sequence[62]~input_o\);

-- Location: IOIBUF_X10_Y17_N1
\i_sequence[61]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(61),
	o => \i_sequence[61]~input_o\);

-- Location: IOIBUF_X12_Y17_N22
\i_sequence[58]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(58),
	o => \i_sequence[58]~input_o\);

-- Location: IOIBUF_X10_Y17_N15
\i_sequence[57]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(57),
	o => \i_sequence[57]~input_o\);

-- Location: IOIBUF_X0_Y11_N22
\i_sequence[56]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(56),
	o => \i_sequence[56]~input_o\);

-- Location: IOIBUF_X10_Y17_N8
\i_sequence[55]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(55),
	o => \i_sequence[55]~input_o\);

-- Location: IOIBUF_X14_Y17_N22
\i_sequence[54]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(54),
	o => \i_sequence[54]~input_o\);

-- Location: IOIBUF_X12_Y17_N15
\i_sequence[53]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(53),
	o => \i_sequence[53]~input_o\);

-- Location: IOIBUF_X14_Y17_N1
\i_sequence[51]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(51),
	o => \i_sequence[51]~input_o\);

-- Location: IOIBUF_X12_Y17_N1
\i_sequence[49]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(49),
	o => \i_sequence[49]~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\i_sequence[47]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(47),
	o => \i_sequence[47]~input_o\);

-- Location: IOIBUF_X25_Y22_N22
\i_sequence[42]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(42),
	o => \i_sequence[42]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\i_sequence[41]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(41),
	o => \i_sequence[41]~input_o\);

-- Location: IOIBUF_X50_Y8_N22
\i_sequence[40]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(40),
	o => \i_sequence[40]~input_o\);

-- Location: IOIBUF_X50_Y10_N8
\i_sequence[38]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(38),
	o => \i_sequence[38]~input_o\);

-- Location: IOIBUF_X19_Y17_N22
\i_sequence[37]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(37),
	o => \i_sequence[37]~input_o\);

-- Location: IOIBUF_X3_Y0_N8
\i_sequence[36]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(36),
	o => \i_sequence[36]~input_o\);

-- Location: IOIBUF_X14_Y0_N8
\i_sequence[34]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(34),
	o => \i_sequence[34]~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\i_sequence[33]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(33),
	o => \i_sequence[33]~input_o\);

-- Location: IOIBUF_X8_Y0_N22
\i_sequence[31]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(31),
	o => \i_sequence[31]~input_o\);

-- Location: IOIBUF_X6_Y0_N29
\i_sequence[30]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(30),
	o => \i_sequence[30]~input_o\);

-- Location: IOIBUF_X21_Y0_N22
\i_sequence[29]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(29),
	o => \i_sequence[29]~input_o\);

-- Location: IOIBUF_X14_Y0_N15
\i_sequence[28]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(28),
	o => \i_sequence[28]~input_o\);

-- Location: IOIBUF_X14_Y0_N1
\i_sequence[26]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(26),
	o => \i_sequence[26]~input_o\);

-- Location: IOIBUF_X8_Y0_N29
\i_sequence[25]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(25),
	o => \i_sequence[25]~input_o\);

-- Location: IOIBUF_X14_Y0_N22
\i_sequence[24]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(24),
	o => \i_sequence[24]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\i_sequence[19]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(19),
	o => \i_sequence[19]~input_o\);

-- Location: IOIBUF_X19_Y17_N8
\i_sequence[16]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(16),
	o => \i_sequence[16]~input_o\);

-- Location: IOIBUF_X19_Y0_N15
\i_sequence[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(15),
	o => \i_sequence[15]~input_o\);

-- Location: IOIBUF_X19_Y0_N29
\i_sequence[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(14),
	o => \i_sequence[14]~input_o\);

-- Location: IOIBUF_X19_Y17_N15
\i_sequence[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(13),
	o => \i_sequence[13]~input_o\);

-- Location: IOIBUF_X25_Y22_N15
\i_sequence[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(9),
	o => \i_sequence[9]~input_o\);

-- Location: IOIBUF_X19_Y0_N22
\i_sequence[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(8),
	o => \i_sequence[8]~input_o\);

-- Location: IOIBUF_X16_Y0_N8
\i_sequence[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(7),
	o => \i_sequence[7]~input_o\);

-- Location: IOIBUF_X6_Y0_N8
\i_sequence[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(5),
	o => \i_sequence[5]~input_o\);

-- Location: IOIBUF_X16_Y0_N29
\i_sequence[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(4),
	o => \i_sequence[4]~input_o\);

-- Location: IOIBUF_X21_Y0_N29
\i_sequence[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(3),
	o => \i_sequence[3]~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\i_sequence[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(2),
	o => \i_sequence[2]~input_o\);

-- Location: IOIBUF_X50_Y10_N1
\i_sequence[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(0),
	o => \i_sequence[0]~input_o\);

-- Location: LCCOMB_X21_Y4_N30
\s_n_sh_reg[0]~63\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[0]~63_combout\ = (\i_sequence[0]~input_o\ & \i_load_sequence~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_sequence[0]~input_o\,
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[0]~63_combout\);

-- Location: FF_X21_Y4_N31
\s_sh_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[0]~63_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(0));

-- Location: IOIBUF_X21_Y0_N1
\i_sequence[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(1),
	o => \i_sequence[1]~input_o\);

-- Location: LCCOMB_X21_Y4_N28
\s_n_sh_reg[1]~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[1]~62_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[1]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(0),
	datab => \i_sequence[1]~input_o\,
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[1]~62_combout\);

-- Location: FF_X21_Y4_N29
\s_sh_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[1]~62_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(1));

-- Location: LCCOMB_X21_Y4_N18
\s_n_sh_reg[2]~61\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[2]~61_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[2]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[2]~input_o\,
	datab => s_sh_reg(1),
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[2]~61_combout\);

-- Location: FF_X21_Y4_N19
\s_sh_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[2]~61_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(2));

-- Location: LCCOMB_X21_Y4_N16
\s_n_sh_reg[3]~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[3]~60_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[3]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[3]~input_o\,
	datab => \i_load_sequence~input_o\,
	datad => s_sh_reg(2),
	combout => \s_n_sh_reg[3]~60_combout\);

-- Location: FF_X21_Y4_N17
\s_sh_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[3]~60_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(3));

-- Location: LCCOMB_X21_Y4_N22
\s_n_sh_reg[4]~59\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[4]~59_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[4]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[4]~input_o\,
	datab => \i_load_sequence~input_o\,
	datad => s_sh_reg(3),
	combout => \s_n_sh_reg[4]~59_combout\);

-- Location: FF_X21_Y4_N23
\s_sh_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[4]~59_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(4));

-- Location: LCCOMB_X20_Y4_N22
\s_n_sh_reg[5]~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[5]~58_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[5]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[5]~input_o\,
	datad => s_sh_reg(4),
	combout => \s_n_sh_reg[5]~58_combout\);

-- Location: FF_X20_Y4_N23
\s_sh_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[5]~58_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(5));

-- Location: IOIBUF_X50_Y21_N1
\i_sequence[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(6),
	o => \i_sequence[6]~input_o\);

-- Location: LCCOMB_X20_Y4_N28
\s_n_sh_reg[6]~57\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[6]~57_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[6]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(5),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[6]~input_o\,
	combout => \s_n_sh_reg[6]~57_combout\);

-- Location: FF_X20_Y4_N29
\s_sh_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[6]~57_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(6));

-- Location: LCCOMB_X20_Y4_N2
\s_n_sh_reg[7]~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[7]~56_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[7]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[7]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(6),
	combout => \s_n_sh_reg[7]~56_combout\);

-- Location: FF_X20_Y4_N3
\s_sh_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[7]~56_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(7));

-- Location: LCCOMB_X20_Y4_N16
\s_n_sh_reg[8]~55\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[8]~55_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[8]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[8]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(7),
	combout => \s_n_sh_reg[8]~55_combout\);

-- Location: FF_X20_Y4_N17
\s_sh_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[8]~55_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(8));

-- Location: LCCOMB_X20_Y4_N30
\s_n_sh_reg[9]~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[9]~54_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[9]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[9]~input_o\,
	datad => s_sh_reg(8),
	combout => \s_n_sh_reg[9]~54_combout\);

-- Location: FF_X20_Y4_N31
\s_sh_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[9]~54_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(9));

-- Location: IOIBUF_X8_Y0_N15
\i_sequence[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(10),
	o => \i_sequence[10]~input_o\);

-- Location: LCCOMB_X20_Y4_N20
\s_n_sh_reg[10]~53\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[10]~53_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[10]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(9),
	datab => \i_sequence[10]~input_o\,
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[10]~53_combout\);

-- Location: FF_X20_Y4_N21
\s_sh_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[10]~53_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(10));

-- Location: IOIBUF_X50_Y8_N1
\i_sequence[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(11),
	o => \i_sequence[11]~input_o\);

-- Location: LCCOMB_X20_Y4_N26
\s_n_sh_reg[11]~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[11]~52_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[11]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_sh_reg(10),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[11]~input_o\,
	combout => \s_n_sh_reg[11]~52_combout\);

-- Location: FF_X20_Y4_N27
\s_sh_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[11]~52_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(11));

-- Location: IOIBUF_X50_Y10_N15
\i_sequence[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(12),
	o => \i_sequence[12]~input_o\);

-- Location: LCCOMB_X20_Y4_N0
\s_n_sh_reg[12]~51\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[12]~51_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[12]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(11),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[12]~input_o\,
	combout => \s_n_sh_reg[12]~51_combout\);

-- Location: FF_X20_Y4_N1
\s_sh_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[12]~51_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(12));

-- Location: LCCOMB_X20_Y4_N6
\s_n_sh_reg[13]~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[13]~50_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[13]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[13]~input_o\,
	datad => s_sh_reg(12),
	combout => \s_n_sh_reg[13]~50_combout\);

-- Location: FF_X20_Y4_N7
\s_sh_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[13]~50_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(13));

-- Location: LCCOMB_X20_Y4_N4
\s_n_sh_reg[14]~49\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[14]~49_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[14]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[14]~input_o\,
	datad => s_sh_reg(13),
	combout => \s_n_sh_reg[14]~49_combout\);

-- Location: FF_X20_Y4_N5
\s_sh_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[14]~49_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(14));

-- Location: LCCOMB_X20_Y4_N18
\s_n_sh_reg[15]~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[15]~48_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[15]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[15]~input_o\,
	datab => s_sh_reg(14),
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[15]~48_combout\);

-- Location: FF_X20_Y4_N19
\s_sh_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[15]~48_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(15));

-- Location: LCCOMB_X20_Y4_N24
\s_n_sh_reg[16]~47\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[16]~47_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[16]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[16]~input_o\,
	datad => s_sh_reg(15),
	combout => \s_n_sh_reg[16]~47_combout\);

-- Location: FF_X20_Y4_N25
\s_sh_reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[16]~47_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(16));

-- Location: IOIBUF_X50_Y11_N1
\i_sequence[17]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(17),
	o => \i_sequence[17]~input_o\);

-- Location: LCCOMB_X20_Y4_N14
\s_n_sh_reg[17]~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[17]~46_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[17]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_sh_reg(16),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[17]~input_o\,
	combout => \s_n_sh_reg[17]~46_combout\);

-- Location: FF_X20_Y4_N15
\s_sh_reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[17]~46_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(17));

-- Location: IOIBUF_X50_Y2_N8
\i_sequence[18]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(18),
	o => \i_sequence[18]~input_o\);

-- Location: LCCOMB_X20_Y4_N12
\s_n_sh_reg[18]~45\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[18]~45_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[18]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_sh_reg(17),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[18]~input_o\,
	combout => \s_n_sh_reg[18]~45_combout\);

-- Location: FF_X20_Y4_N13
\s_sh_reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[18]~45_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(18));

-- Location: LCCOMB_X20_Y4_N10
\s_n_sh_reg[19]~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[19]~44_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[19]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[19]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(18),
	combout => \s_n_sh_reg[19]~44_combout\);

-- Location: FF_X20_Y4_N11
\s_sh_reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[19]~44_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(19));

-- Location: IOIBUF_X24_Y0_N29
\i_sequence[20]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(20),
	o => \i_sequence[20]~input_o\);

-- Location: LCCOMB_X20_Y4_N8
\s_n_sh_reg[20]~43\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[20]~43_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[20]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(19),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[20]~input_o\,
	combout => \s_n_sh_reg[20]~43_combout\);

-- Location: FF_X20_Y4_N9
\s_sh_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[20]~43_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(20));

-- Location: IOIBUF_X6_Y0_N22
\i_sequence[21]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(21),
	o => \i_sequence[21]~input_o\);

-- Location: LCCOMB_X14_Y4_N30
\s_n_sh_reg[21]~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[21]~42_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[21]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_load_sequence~input_o\,
	datac => s_sh_reg(20),
	datad => \i_sequence[21]~input_o\,
	combout => \s_n_sh_reg[21]~42_combout\);

-- Location: FF_X14_Y4_N31
\s_sh_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[21]~42_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(21));

-- Location: IOIBUF_X16_Y0_N15
\i_sequence[22]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(22),
	o => \i_sequence[22]~input_o\);

-- Location: LCCOMB_X14_Y4_N4
\s_n_sh_reg[22]~41\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[22]~41_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[22]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(21),
	datab => \i_load_sequence~input_o\,
	datac => \i_sequence[22]~input_o\,
	combout => \s_n_sh_reg[22]~41_combout\);

-- Location: FF_X14_Y4_N5
\s_sh_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[22]~41_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(22));

-- Location: IOIBUF_X50_Y2_N22
\i_sequence[23]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(23),
	o => \i_sequence[23]~input_o\);

-- Location: LCCOMB_X14_Y4_N2
\s_n_sh_reg[23]~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[23]~40_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[23]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_load_sequence~input_o\,
	datac => s_sh_reg(22),
	datad => \i_sequence[23]~input_o\,
	combout => \s_n_sh_reg[23]~40_combout\);

-- Location: FF_X14_Y4_N3
\s_sh_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[23]~40_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(23));

-- Location: LCCOMB_X14_Y4_N24
\s_n_sh_reg[24]~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[24]~39_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[24]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[24]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(23),
	combout => \s_n_sh_reg[24]~39_combout\);

-- Location: FF_X14_Y4_N25
\s_sh_reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[24]~39_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(24));

-- Location: LCCOMB_X14_Y4_N6
\s_n_sh_reg[25]~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[25]~38_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[25]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[25]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(24),
	combout => \s_n_sh_reg[25]~38_combout\);

-- Location: FF_X14_Y4_N7
\s_sh_reg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[25]~38_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(25));

-- Location: LCCOMB_X14_Y4_N12
\s_n_sh_reg[26]~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[26]~37_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[26]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_sequence[26]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(25),
	combout => \s_n_sh_reg[26]~37_combout\);

-- Location: FF_X14_Y4_N13
\s_sh_reg[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[26]~37_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(26));

-- Location: IOIBUF_X16_Y17_N8
\i_sequence[27]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(27),
	o => \i_sequence[27]~input_o\);

-- Location: LCCOMB_X14_Y4_N10
\s_n_sh_reg[27]~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[27]~36_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[27]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(26),
	datab => \i_sequence[27]~input_o\,
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[27]~36_combout\);

-- Location: FF_X14_Y4_N11
\s_sh_reg[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[27]~36_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(27));

-- Location: LCCOMB_X14_Y4_N0
\s_n_sh_reg[28]~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[28]~35_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[28]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(27))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_sequence[28]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(27),
	combout => \s_n_sh_reg[28]~35_combout\);

-- Location: FF_X14_Y4_N1
\s_sh_reg[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[28]~35_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(28));

-- Location: LCCOMB_X14_Y4_N22
\s_n_sh_reg[29]~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[29]~34_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[29]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[29]~input_o\,
	datab => s_sh_reg(28),
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[29]~34_combout\);

-- Location: FF_X14_Y4_N23
\s_sh_reg[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[29]~34_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(29));

-- Location: LCCOMB_X14_Y4_N28
\s_n_sh_reg[30]~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[30]~33_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[30]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[30]~input_o\,
	datab => \i_load_sequence~input_o\,
	datac => s_sh_reg(29),
	combout => \s_n_sh_reg[30]~33_combout\);

-- Location: FF_X14_Y4_N29
\s_sh_reg[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[30]~33_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(30));

-- Location: LCCOMB_X14_Y4_N26
\s_n_sh_reg[31]~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[31]~32_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[31]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_sequence[31]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(30),
	combout => \s_n_sh_reg[31]~32_combout\);

-- Location: FF_X14_Y4_N27
\s_sh_reg[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[31]~32_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(31));

-- Location: IOIBUF_X50_Y8_N15
\i_sequence[32]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(32),
	o => \i_sequence[32]~input_o\);

-- Location: LCCOMB_X14_Y4_N16
\s_n_sh_reg[32]~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[32]~31_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[32]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(31),
	datab => \i_sequence[32]~input_o\,
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[32]~31_combout\);

-- Location: FF_X14_Y4_N17
\s_sh_reg[32]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[32]~31_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(32));

-- Location: LCCOMB_X14_Y4_N14
\s_n_sh_reg[33]~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[33]~30_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[33]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(32))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[33]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(32),
	combout => \s_n_sh_reg[33]~30_combout\);

-- Location: FF_X14_Y4_N15
\s_sh_reg[33]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[33]~30_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(33));

-- Location: LCCOMB_X14_Y4_N20
\s_n_sh_reg[34]~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[34]~29_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[34]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(33))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[34]~input_o\,
	datab => s_sh_reg(33),
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[34]~29_combout\);

-- Location: FF_X14_Y4_N21
\s_sh_reg[34]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[34]~29_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(34));

-- Location: IOIBUF_X16_Y17_N22
\i_sequence[35]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(35),
	o => \i_sequence[35]~input_o\);

-- Location: LCCOMB_X14_Y4_N18
\s_n_sh_reg[35]~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[35]~28_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[35]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(34)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_sh_reg(34),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[35]~input_o\,
	combout => \s_n_sh_reg[35]~28_combout\);

-- Location: FF_X14_Y4_N19
\s_sh_reg[35]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[35]~28_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(35));

-- Location: LCCOMB_X14_Y4_N8
\s_n_sh_reg[36]~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[36]~27_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[36]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(35))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_sequence[36]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(35),
	combout => \s_n_sh_reg[36]~27_combout\);

-- Location: FF_X14_Y4_N9
\s_sh_reg[36]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[36]~27_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(36));

-- Location: LCCOMB_X21_Y4_N20
\s_n_sh_reg[37]~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[37]~26_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[37]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(36))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[37]~input_o\,
	datab => s_sh_reg(36),
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[37]~26_combout\);

-- Location: FF_X21_Y4_N21
\s_sh_reg[37]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[37]~26_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(37));

-- Location: LCCOMB_X21_Y4_N26
\s_n_sh_reg[38]~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[38]~25_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[38]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(37))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[38]~input_o\,
	datab => s_sh_reg(37),
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[38]~25_combout\);

-- Location: FF_X21_Y4_N27
\s_sh_reg[38]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[38]~25_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(38));

-- Location: IOIBUF_X50_Y14_N22
\i_sequence[39]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(39),
	o => \i_sequence[39]~input_o\);

-- Location: LCCOMB_X21_Y4_N0
\s_n_sh_reg[39]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[39]~24_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[39]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(38)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(38),
	datab => \i_load_sequence~input_o\,
	datad => \i_sequence[39]~input_o\,
	combout => \s_n_sh_reg[39]~24_combout\);

-- Location: FF_X21_Y4_N1
\s_sh_reg[39]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[39]~24_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(39));

-- Location: LCCOMB_X21_Y4_N14
\s_n_sh_reg[40]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[40]~23_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[40]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(39))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_load_sequence~input_o\,
	datac => \i_sequence[40]~input_o\,
	datad => s_sh_reg(39),
	combout => \s_n_sh_reg[40]~23_combout\);

-- Location: FF_X21_Y4_N15
\s_sh_reg[40]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[40]~23_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(40));

-- Location: LCCOMB_X21_Y4_N4
\s_n_sh_reg[41]~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[41]~22_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[41]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(40))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[41]~input_o\,
	datab => s_sh_reg(40),
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[41]~22_combout\);

-- Location: FF_X21_Y4_N5
\s_sh_reg[41]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[41]~22_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(41));

-- Location: LCCOMB_X21_Y4_N10
\s_n_sh_reg[42]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[42]~21_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[42]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(41))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[42]~input_o\,
	datab => s_sh_reg(41),
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[42]~21_combout\);

-- Location: FF_X21_Y4_N11
\s_sh_reg[42]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[42]~21_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(42));

-- Location: IOIBUF_X50_Y2_N1
\i_sequence[43]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(43),
	o => \i_sequence[43]~input_o\);

-- Location: LCCOMB_X21_Y4_N8
\s_n_sh_reg[43]~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[43]~20_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[43]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(42)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(42),
	datab => \i_load_sequence~input_o\,
	datad => \i_sequence[43]~input_o\,
	combout => \s_n_sh_reg[43]~20_combout\);

-- Location: FF_X21_Y4_N9
\s_sh_reg[43]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[43]~20_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(43));

-- Location: IOIBUF_X50_Y8_N8
\i_sequence[44]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(44),
	o => \i_sequence[44]~input_o\);

-- Location: LCCOMB_X21_Y4_N6
\s_n_sh_reg[44]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[44]~19_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[44]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(43)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_sh_reg(43),
	datac => \i_sequence[44]~input_o\,
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[44]~19_combout\);

-- Location: FF_X21_Y4_N7
\s_sh_reg[44]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[44]~19_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(44));

-- Location: IOIBUF_X50_Y11_N15
\i_sequence[45]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(45),
	o => \i_sequence[45]~input_o\);

-- Location: LCCOMB_X21_Y4_N12
\s_n_sh_reg[45]~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[45]~18_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[45]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(44)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(44),
	datab => \i_load_sequence~input_o\,
	datad => \i_sequence[45]~input_o\,
	combout => \s_n_sh_reg[45]~18_combout\);

-- Location: FF_X21_Y4_N13
\s_sh_reg[45]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[45]~18_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(45));

-- Location: IOIBUF_X21_Y17_N29
\i_sequence[46]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(46),
	o => \i_sequence[46]~input_o\);

-- Location: LCCOMB_X21_Y4_N24
\s_n_sh_reg[46]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[46]~17_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[46]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(45)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(45),
	datab => \i_sequence[46]~input_o\,
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[46]~17_combout\);

-- Location: FF_X21_Y4_N25
\s_sh_reg[46]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[46]~17_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(46));

-- Location: LCCOMB_X21_Y4_N2
\s_n_sh_reg[47]~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[47]~16_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[47]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(46))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_load_sequence~input_o\,
	datac => \i_sequence[47]~input_o\,
	datad => s_sh_reg(46),
	combout => \s_n_sh_reg[47]~16_combout\);

-- Location: LCCOMB_X17_Y4_N0
\s_sh_reg[47]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_sh_reg[47]~feeder_combout\ = \s_n_sh_reg[47]~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \s_n_sh_reg[47]~16_combout\,
	combout => \s_sh_reg[47]~feeder_combout\);

-- Location: FF_X17_Y4_N1
\s_sh_reg[47]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_sh_reg[47]~feeder_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(47));

-- Location: IOIBUF_X12_Y17_N8
\i_sequence[48]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(48),
	o => \i_sequence[48]~input_o\);

-- Location: LCCOMB_X13_Y13_N20
\s_n_sh_reg[48]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[48]~15_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[48]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(47)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => s_sh_reg(47),
	datad => \i_sequence[48]~input_o\,
	combout => \s_n_sh_reg[48]~15_combout\);

-- Location: FF_X13_Y13_N21
\s_sh_reg[48]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[48]~15_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(48));

-- Location: LCCOMB_X13_Y13_N26
\s_n_sh_reg[49]~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[49]~14_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[49]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(48))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[49]~input_o\,
	datad => s_sh_reg(48),
	combout => \s_n_sh_reg[49]~14_combout\);

-- Location: FF_X13_Y13_N27
\s_sh_reg[49]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[49]~14_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(49));

-- Location: IOIBUF_X16_Y17_N15
\i_sequence[50]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(50),
	o => \i_sequence[50]~input_o\);

-- Location: LCCOMB_X13_Y13_N24
\s_n_sh_reg[50]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[50]~13_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[50]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(49)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => s_sh_reg(49),
	datad => \i_sequence[50]~input_o\,
	combout => \s_n_sh_reg[50]~13_combout\);

-- Location: FF_X13_Y13_N25
\s_sh_reg[50]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[50]~13_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(50));

-- Location: LCCOMB_X13_Y13_N22
\s_n_sh_reg[51]~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[51]~12_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[51]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(50))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[51]~input_o\,
	datad => s_sh_reg(50),
	combout => \s_n_sh_reg[51]~12_combout\);

-- Location: FF_X13_Y13_N23
\s_sh_reg[51]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[51]~12_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(51));

-- Location: IOIBUF_X19_Y17_N29
\i_sequence[52]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(52),
	o => \i_sequence[52]~input_o\);

-- Location: LCCOMB_X13_Y13_N12
\s_n_sh_reg[52]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[52]~11_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[52]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(51)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => s_sh_reg(51),
	datad => \i_sequence[52]~input_o\,
	combout => \s_n_sh_reg[52]~11_combout\);

-- Location: FF_X13_Y13_N13
\s_sh_reg[52]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[52]~11_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(52));

-- Location: LCCOMB_X13_Y13_N10
\s_n_sh_reg[53]~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[53]~10_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[53]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(52))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[53]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(52),
	combout => \s_n_sh_reg[53]~10_combout\);

-- Location: FF_X13_Y13_N11
\s_sh_reg[53]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[53]~10_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(53));

-- Location: LCCOMB_X13_Y13_N16
\s_n_sh_reg[54]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[54]~9_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[54]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(53))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[54]~input_o\,
	datad => s_sh_reg(53),
	combout => \s_n_sh_reg[54]~9_combout\);

-- Location: FF_X13_Y13_N17
\s_sh_reg[54]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[54]~9_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(54));

-- Location: LCCOMB_X13_Y13_N6
\s_n_sh_reg[55]~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[55]~8_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[55]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(54))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[55]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(54),
	combout => \s_n_sh_reg[55]~8_combout\);

-- Location: FF_X13_Y13_N7
\s_sh_reg[55]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[55]~8_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(55));

-- Location: LCCOMB_X13_Y13_N4
\s_n_sh_reg[56]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[56]~7_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[56]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(55))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[56]~input_o\,
	datad => s_sh_reg(55),
	combout => \s_n_sh_reg[56]~7_combout\);

-- Location: FF_X13_Y13_N5
\s_sh_reg[56]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[56]~7_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(56));

-- Location: LCCOMB_X13_Y13_N18
\s_n_sh_reg[57]~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[57]~6_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[57]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(56))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[57]~input_o\,
	datab => s_sh_reg(56),
	datac => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[57]~6_combout\);

-- Location: FF_X13_Y13_N19
\s_sh_reg[57]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[57]~6_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(57));

-- Location: LCCOMB_X13_Y13_N8
\s_n_sh_reg[58]~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[58]~5_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[58]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(57))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[58]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(57),
	combout => \s_n_sh_reg[58]~5_combout\);

-- Location: FF_X13_Y13_N9
\s_sh_reg[58]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[58]~5_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(58));

-- Location: IOIBUF_X14_Y17_N29
\i_sequence[59]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(59),
	o => \i_sequence[59]~input_o\);

-- Location: LCCOMB_X13_Y13_N30
\s_n_sh_reg[59]~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[59]~4_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[59]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(58)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => s_sh_reg(58),
	datad => \i_sequence[59]~input_o\,
	combout => \s_n_sh_reg[59]~4_combout\);

-- Location: FF_X13_Y13_N31
\s_sh_reg[59]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[59]~4_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(59));

-- Location: IOIBUF_X16_Y17_N1
\i_sequence[60]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_sequence(60),
	o => \i_sequence[60]~input_o\);

-- Location: LCCOMB_X13_Y13_N28
\s_n_sh_reg[60]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[60]~3_combout\ = (\i_load_sequence~input_o\ & ((\i_sequence[60]~input_o\))) # (!\i_load_sequence~input_o\ & (s_sh_reg(59)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_sh_reg(59),
	datac => \i_load_sequence~input_o\,
	datad => \i_sequence[60]~input_o\,
	combout => \s_n_sh_reg[60]~3_combout\);

-- Location: FF_X13_Y13_N29
\s_sh_reg[60]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[60]~3_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(60));

-- Location: LCCOMB_X13_Y13_N2
\s_n_sh_reg[61]~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[61]~2_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[61]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(60))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_sequence[61]~input_o\,
	datac => \i_load_sequence~input_o\,
	datad => s_sh_reg(60),
	combout => \s_n_sh_reg[61]~2_combout\);

-- Location: FF_X13_Y13_N3
\s_sh_reg[61]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[61]~2_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(61));

-- Location: LCCOMB_X13_Y13_N0
\s_n_sh_reg[62]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[62]~1_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[62]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(61))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_load_sequence~input_o\,
	datac => \i_sequence[62]~input_o\,
	datad => s_sh_reg(61),
	combout => \s_n_sh_reg[62]~1_combout\);

-- Location: FF_X13_Y13_N1
\s_sh_reg[62]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[62]~1_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(62));

-- Location: LCCOMB_X7_Y13_N26
\s_n_sh_reg[63]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_n_sh_reg[63]~0_combout\ = (\i_load_sequence~input_o\ & (\i_sequence[63]~input_o\)) # (!\i_load_sequence~input_o\ & ((s_sh_reg(62))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_sequence[63]~input_o\,
	datac => s_sh_reg(62),
	datad => \i_load_sequence~input_o\,
	combout => \s_n_sh_reg[63]~0_combout\);

-- Location: FF_X7_Y13_N27
\s_sh_reg[63]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_n_sh_reg[63]~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_reg(63));

-- Location: FF_X7_Y13_N11
\s_sh_base[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	asdata => s_sh_reg(63),
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_base(1));

-- Location: LCCOMB_X7_Y13_N10
\s_base[1]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_base[1]~0_combout\ = (\i_base_src_sel~input_o\ & ((s_sh_base(1)))) # (!\i_base_src_sel~input_o\ & (\i_base[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_base_src_sel~input_o\,
	datab => \i_base[1]~input_o\,
	datac => s_sh_base(1),
	combout => \s_base[1]~0_combout\);

-- Location: FF_X7_Y13_N21
\s_sh_base[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	asdata => s_sh_reg(62),
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_sh_base(0));

-- Location: IOIBUF_X8_Y17_N22
\i_base[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_base(0),
	o => \i_base[0]~input_o\);

-- Location: LCCOMB_X7_Y13_N20
\s_base[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_base[0]~1_combout\ = (\i_base_src_sel~input_o\ & (s_sh_base(0))) # (!\i_base_src_sel~input_o\ & ((\i_base[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_base_src_sel~input_o\,
	datac => s_sh_base(0),
	datad => \i_base[0]~input_o\,
	combout => \s_base[0]~1_combout\);

-- Location: LCCOMB_X7_Y13_N6
\s_next_state.C0T1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_next_state.C0T1~0_combout\ = (\s_base[1]~0_combout\ & (\s_state.C0S012~q\ & \s_base[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_base[1]~0_combout\,
	datac => \s_state.C0S012~q\,
	datad => \s_base[0]~1_combout\,
	combout => \s_next_state.C0T1~0_combout\);

-- Location: FF_X7_Y13_N7
\s_state.C0T1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_next_state.C0T1~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.C0T1~q\);

-- Location: LCCOMB_X7_Y13_N14
\Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = (!\s_state.C0A1~q\ & (!\s_state.C0S012~q\ & !\s_state.C0T1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \s_state.C0A1~q\,
	datac => \s_state.C0S012~q\,
	datad => \s_state.C0T1~q\,
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X7_Y13_N4
\Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (!\s_base[1]~0_combout\ & (\Selector1~0_combout\ & \s_base[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_base[1]~0_combout\,
	datac => \Selector1~0_combout\,
	datad => \s_base[0]~1_combout\,
	combout => \Selector1~1_combout\);

-- Location: FF_X7_Y13_N5
\s_state.C0S012\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \Selector1~1_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.C0S012~q\);

-- Location: LCCOMB_X7_Y13_N16
\s_next_state.C0A1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_next_state.C0A1~0_combout\ = (!\s_base[1]~0_combout\ & (\s_state.C0S012~q\ & !\s_base[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_base[1]~0_combout\,
	datac => \s_state.C0S012~q\,
	datad => \s_base[0]~1_combout\,
	combout => \s_next_state.C0A1~0_combout\);

-- Location: FF_X7_Y13_N17
\s_state.C0A1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_next_state.C0A1~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.C0A1~q\);

-- Location: LCCOMB_X7_Y13_N0
\s_next_state.C0A1T2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_next_state.C0A1T2~0_combout\ = (\s_base[1]~0_combout\ & (\s_state.C0A1~q\ & \s_base[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_base[1]~0_combout\,
	datab => \s_state.C0A1~q\,
	datad => \s_base[0]~1_combout\,
	combout => \s_next_state.C0A1T2~0_combout\);

-- Location: FF_X7_Y13_N1
\s_state.C0A1T2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_next_state.C0A1T2~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.C0A1T2~q\);

-- Location: FF_X6_Y13_N5
\s_cnt_subseq1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq1~1_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_state.C0A1T2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq1(1));

-- Location: LCCOMB_X6_Y13_N24
\s_cnt_subseq1~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq1~2_combout\ = (!s_cnt_subseq1(3) & (s_cnt_subseq1(2) $ (((s_cnt_subseq1(1) & s_cnt_subseq1(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq1(3),
	datab => s_cnt_subseq1(1),
	datac => s_cnt_subseq1(2),
	datad => s_cnt_subseq1(0),
	combout => \s_cnt_subseq1~2_combout\);

-- Location: FF_X6_Y13_N25
\s_cnt_subseq1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq1~2_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_state.C0A1T2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq1(2));

-- Location: LCCOMB_X6_Y13_N22
\s_cnt_subseq1~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq1~3_combout\ = (s_cnt_subseq1(0) & (s_cnt_subseq1(1) & (!s_cnt_subseq1(3) & s_cnt_subseq1(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq1(0),
	datab => s_cnt_subseq1(1),
	datac => s_cnt_subseq1(3),
	datad => s_cnt_subseq1(2),
	combout => \s_cnt_subseq1~3_combout\);

-- Location: FF_X6_Y13_N23
\s_cnt_subseq1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq1~3_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_state.C0A1T2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq1(3));

-- Location: LCCOMB_X6_Y13_N12
\s_cnt_subseq1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq1~0_combout\ = (!s_cnt_subseq1(3) & !s_cnt_subseq1(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq1(3),
	datac => s_cnt_subseq1(0),
	combout => \s_cnt_subseq1~0_combout\);

-- Location: FF_X6_Y13_N13
\s_cnt_subseq1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq1~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_state.C0A1T2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq1(0));

-- Location: IOIBUF_X0_Y9_N1
\i_cnt_subseq_sel[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_cnt_subseq_sel(1),
	o => \i_cnt_subseq_sel[1]~input_o\);

-- Location: IOIBUF_X0_Y12_N22
\i_cnt_subseq_sel[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_cnt_subseq_sel(0),
	o => \i_cnt_subseq_sel[0]~input_o\);

-- Location: LCCOMB_X6_Y13_N14
\s_cnt_subseq0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq0~3_combout\ = (!\i_rst~input_o\ & !s_cnt_subseq0(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_rst~input_o\,
	datac => s_cnt_subseq0(3),
	combout => \s_cnt_subseq0~3_combout\);

-- Location: LCCOMB_X6_Y13_N0
\s_cnt_subseq0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq0~2_combout\ = (!\i_rst~input_o\ & (!s_cnt_subseq0(3) & (s_cnt_subseq0(1) $ (s_cnt_subseq0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_rst~input_o\,
	datab => s_cnt_subseq0(3),
	datac => s_cnt_subseq0(1),
	datad => s_cnt_subseq0(0),
	combout => \s_cnt_subseq0~2_combout\);

-- Location: LCCOMB_X7_Y13_N22
\s_next_state.C0A1C2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_next_state.C0A1C2~0_combout\ = (!\s_base[1]~0_combout\ & (\s_state.C0A1~q\ & \s_base[0]~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_base[1]~0_combout\,
	datab => \s_state.C0A1~q\,
	datad => \s_base[0]~1_combout\,
	combout => \s_next_state.C0A1C2~0_combout\);

-- Location: FF_X7_Y13_N23
\s_state.C0A1C2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_next_state.C0A1C2~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.C0A1C2~q\);

-- Location: LCCOMB_X6_Y13_N28
\s_cnt_subseq0[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq0[0]~1_combout\ = (\i_rst~input_o\) # (\s_state.C0A1C2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_rst~input_o\,
	datad => \s_state.C0A1C2~q\,
	combout => \s_cnt_subseq0[0]~1_combout\);

-- Location: FF_X6_Y13_N1
\s_cnt_subseq0[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq0~2_combout\,
	ena => \s_cnt_subseq0[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq0(1));

-- Location: LCCOMB_X6_Y13_N26
\s_cnt_subseq0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq0~4_combout\ = (\s_cnt_subseq0~3_combout\ & (s_cnt_subseq0(2) $ (((s_cnt_subseq0(0) & s_cnt_subseq0(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq0(0),
	datab => \s_cnt_subseq0~3_combout\,
	datac => s_cnt_subseq0(2),
	datad => s_cnt_subseq0(1),
	combout => \s_cnt_subseq0~4_combout\);

-- Location: FF_X6_Y13_N27
\s_cnt_subseq0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq0~4_combout\,
	ena => \s_cnt_subseq0[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq0(2));

-- Location: LCCOMB_X6_Y13_N8
\s_cnt_subseq0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq0~5_combout\ = (s_cnt_subseq0(2) & (s_cnt_subseq0(0) & (\s_cnt_subseq0~3_combout\ & s_cnt_subseq0(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq0(2),
	datab => s_cnt_subseq0(0),
	datac => \s_cnt_subseq0~3_combout\,
	datad => s_cnt_subseq0(1),
	combout => \s_cnt_subseq0~5_combout\);

-- Location: FF_X6_Y13_N9
\s_cnt_subseq0[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq0~5_combout\,
	ena => \s_cnt_subseq0[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq0(3));

-- Location: LCCOMB_X6_Y13_N16
\s_cnt_subseq0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq0~0_combout\ = (!\i_rst~input_o\ & (!s_cnt_subseq0(3) & !s_cnt_subseq0(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_rst~input_o\,
	datab => s_cnt_subseq0(3),
	datac => s_cnt_subseq0(0),
	combout => \s_cnt_subseq0~0_combout\);

-- Location: FF_X6_Y13_N17
\s_cnt_subseq0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq0~0_combout\,
	ena => \s_cnt_subseq0[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq0(0));

-- Location: LCCOMB_X7_Y13_N24
\s_cnt_subseq2[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq2[0]~1_combout\ = !s_cnt_subseq2(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_cnt_subseq2(0),
	combout => \s_cnt_subseq2[0]~1_combout\);

-- Location: LCCOMB_X7_Y13_N28
\s_next_state.C0T1T2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_next_state.C0T1T2~0_combout\ = (\s_base[1]~0_combout\ & (\s_base[0]~1_combout\ & \s_state.C0T1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_base[1]~0_combout\,
	datab => \s_base[0]~1_combout\,
	datad => \s_state.C0T1~q\,
	combout => \s_next_state.C0T1T2~0_combout\);

-- Location: FF_X7_Y13_N29
\s_state.C0T1T2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_next_state.C0T1T2~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_state.C0T1T2~q\);

-- Location: FF_X7_Y13_N25
\s_cnt_subseq2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq2[0]~1_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_state.C0T1T2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq2(0));

-- Location: LCCOMB_X6_Y13_N10
\o_cnt_subseq~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_cnt_subseq~0_combout\ = (!\i_cnt_subseq_sel[0]~input_o\ & ((\i_cnt_subseq_sel[1]~input_o\ & ((s_cnt_subseq2(0)))) # (!\i_cnt_subseq_sel[1]~input_o\ & (s_cnt_subseq0(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_cnt_subseq_sel[0]~input_o\,
	datab => s_cnt_subseq0(0),
	datac => \i_cnt_subseq_sel[1]~input_o\,
	datad => s_cnt_subseq2(0),
	combout => \o_cnt_subseq~0_combout\);

-- Location: LCCOMB_X6_Y13_N6
\o_cnt_subseq~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_cnt_subseq~1_combout\ = (\o_cnt_subseq~0_combout\) # ((s_cnt_subseq1(0) & (!\i_cnt_subseq_sel[1]~input_o\ & \i_cnt_subseq_sel[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq1(0),
	datab => \i_cnt_subseq_sel[1]~input_o\,
	datac => \i_cnt_subseq_sel[0]~input_o\,
	datad => \o_cnt_subseq~0_combout\,
	combout => \o_cnt_subseq~1_combout\);

-- Location: LCCOMB_X7_Y13_N18
\s_cnt_subseq2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \s_cnt_subseq2~0_combout\ = s_cnt_subseq2(1) $ (s_cnt_subseq2(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => s_cnt_subseq2(1),
	datad => s_cnt_subseq2(0),
	combout => \s_cnt_subseq2~0_combout\);

-- Location: FF_X7_Y13_N19
\s_cnt_subseq2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_i_clk~inputclkctrl_outclk\,
	d => \s_cnt_subseq2~0_combout\,
	clrn => \ALT_INV_i_rst~inputclkctrl_outclk\,
	ena => \s_state.C0T1T2~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_cnt_subseq2(1));

-- Location: LCCOMB_X6_Y13_N2
\o_cnt_subseq~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_cnt_subseq~2_combout\ = (!\i_cnt_subseq_sel[0]~input_o\ & ((\i_cnt_subseq_sel[1]~input_o\ & ((s_cnt_subseq2(1)))) # (!\i_cnt_subseq_sel[1]~input_o\ & (s_cnt_subseq0(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_cnt_subseq_sel[0]~input_o\,
	datab => s_cnt_subseq0(1),
	datac => \i_cnt_subseq_sel[1]~input_o\,
	datad => s_cnt_subseq2(1),
	combout => \o_cnt_subseq~2_combout\);

-- Location: LCCOMB_X6_Y13_N30
\o_cnt_subseq~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_cnt_subseq~3_combout\ = (\o_cnt_subseq~2_combout\) # ((\i_cnt_subseq_sel[0]~input_o\ & (!\i_cnt_subseq_sel[1]~input_o\ & s_cnt_subseq1(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_cnt_subseq_sel[0]~input_o\,
	datab => \i_cnt_subseq_sel[1]~input_o\,
	datac => s_cnt_subseq1(1),
	datad => \o_cnt_subseq~2_combout\,
	combout => \o_cnt_subseq~3_combout\);

-- Location: LCCOMB_X6_Y13_N20
\o_cnt_subseq~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_cnt_subseq~4_combout\ = (!\i_cnt_subseq_sel[1]~input_o\ & ((\i_cnt_subseq_sel[0]~input_o\ & ((s_cnt_subseq1(2)))) # (!\i_cnt_subseq_sel[0]~input_o\ & (s_cnt_subseq0(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq0(2),
	datab => \i_cnt_subseq_sel[1]~input_o\,
	datac => \i_cnt_subseq_sel[0]~input_o\,
	datad => s_cnt_subseq1(2),
	combout => \o_cnt_subseq~4_combout\);

-- Location: LCCOMB_X6_Y13_N18
\o_cnt_subseq~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \o_cnt_subseq~5_combout\ = (!\i_cnt_subseq_sel[1]~input_o\ & ((\i_cnt_subseq_sel[0]~input_o\ & (s_cnt_subseq1(3))) # (!\i_cnt_subseq_sel[0]~input_o\ & ((s_cnt_subseq0(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_cnt_subseq1(3),
	datab => s_cnt_subseq0(3),
	datac => \i_cnt_subseq_sel[0]~input_o\,
	datad => \i_cnt_subseq_sel[1]~input_o\,
	combout => \o_cnt_subseq~5_combout\);

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

ww_o_cnt_subseq(0) <= \o_cnt_subseq[0]~output_o\;

ww_o_cnt_subseq(1) <= \o_cnt_subseq[1]~output_o\;

ww_o_cnt_subseq(2) <= \o_cnt_subseq[2]~output_o\;

ww_o_cnt_subseq(3) <= \o_cnt_subseq[3]~output_o\;
END structure;


