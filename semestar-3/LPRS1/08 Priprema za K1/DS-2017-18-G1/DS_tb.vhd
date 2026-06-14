library ieee;
use ieee.std_logic_1164.all;

entity DS1_tb is 
end entity;

architecture beh of DS1_tb is
	component DS1 is port(
		iCLK 		: in  std_logic;
		inRESET  : in  std_logic;
		iSEL		: in  std_logic_vector(5 downto 0);
		iD			: in  std_logic_vector(3 downto 0);
		iWE		: in  std_logic;
		oQ			: out std_logic_vector(4 downto 0)
	);
	end component;
	
	constant iCLK_period : time := 10ns;
	
	signal iCLK 		: std_logic;
	signal inRESET    : std_logic;
	signal iSEL		   : std_logic_vector(5 downto 0);
	signal iD			: std_logic_vector(3 downto 0);
	signal iWE		   : std_logic;
	signal oQ			: std_logic_vector(4 downto 0);
	
begin
	uut : DS1 port map(
		 iCLK => iCLK,
	    inRESET => inRESET,
	    iD => iD,
	    iWE => iWE,
	    iSEL => iSEL,
	    oQ => oQ
	);
	
	clk_p : process begin
		iCLK <= '1';
		wait for iCLK_period / 2;
		
		iCLK <= '0';
		wait for iCLK_period / 2;
	end process;
	
	stim_p : process begin
		-- TEST CASES
		iSEL <= "000000";
		iD	  <= "0000";
		iWE  <= '0';
		inRESET <= '0'; -- RESET JE AKTIVAN NA NISKOM NAPONSKOM NIVOU TJ. LOGIČKA 0
		wait for 5 * iCLK_period;
		inRESET <= '1';
		
		-- I REG0 <= 0x4
		iWE  <= '1';
		iSEL <= "000000";
		iD	  <= x"4";
		wait for 5 * iCLK_period;
		
		-- I REG1 <= 0x9
		iWE  <= '1';
		iSEL <= "000001";
		iD	  <= x"9";
		wait for 5 * iCLK_period;
		
		-- I REG2 <= 0xC
		iWE  <= '1';
		iSEL <= "000010";
		iD	  <= x"C";
		wait for 5 * iCLK_period;
		
		-- I REG3 <= 0xA
		iWE  <= '1';
		iSEL <= "000011";
		iD	  <= x"A";
		wait for 5 * iCLK_period;
		
		-- II izvršenje operacija sabiranja registara REG0 i REG2
		iSEL <= "100000";
		wait for 5 * iCLK_period;
		
		-- II izvršenje operacija sabiranja registara REG1 i REG3
		iSEL <= "110100";
		wait for 5 * iCLK_period;
		
		-- III REG3 <= 0x2
		iWE  <= '1';
		iSEL <= "000011";
		iD	  <= x"2";
		wait for 5 * iCLK_period;
		
		-- IV ponovno izvršenje operacije sREG1 + sREG3.
		iSEL <= "110100";
		wait for 5 * iCLK_period;
		wait;
	end process;
end architecture;