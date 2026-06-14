library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity DS is
	port(
		iCLK  : 	in  std_logic;
		inRST : 	in  std_logic;
		iD		: 	in  std_logic;
		iEN 	: 	in  std_logic;
		iSEL  : 	in  std_logic_vector(1 downto 0);
		oQ 	: 	out std_logic_vector(4 downto 0)
	);
end entity;

architecture arch of DS is
	signal  	s_cnt1		: std_logic_vector(3 downto 0);
	signal	sDATA			: std_logic_vector(9 downto 0);
	signal 	sLIM			: std_logic_vector(4 downto 0);
	signal	sASHR2		: std_logic_vector(4 downto 0);
	signal	sMUX			: std_logic_vector(4 downto 0);
	signal 	sREG			: std_logic_vector(4 downto 0);
	signal 	sTC			: std_logic;
begin
	-- IZLAZ
	oQ <= sREG;
		
	-- SHIFT REGISTER
	process(iCLK, inRST) begin
		if(inRST = '0') then
			sDATA <= "0000000000";
		elsif(rising_edge(iCLK)) then
			-- KOMBINACIONA MREŽA
			if(iEN = '1') then
				sDATA <= iD & sDATA(9 downto 1);
			end if;
		end if;
	end process;
	
	-- BROJAČ PO MODULU 10
	process(iCLK, inRST) begin
		if(inRST = '0') then
			s_cnt1 <= "0000";
		elsif(rising_edge(iCLK)) then
			if(iEN = '1') then
				if(s_cnt1 = 9) then
					s_cnt1 <= "0000";
				else
					s_cnt1 <= s_cnt1 + 1;
				end if;
			end if;
		end if;
	end process;
	
	-- SIGNAL KRAJA BROJANJA
	sTC <= '1' WHEN s_cnt1 = 0 ELSE '0';
	
	-- LIMITER MAX(24)
	sLIM <= "11000" 	WHEN sDATA(4 downto 0) > 24 ELSE
			  sDATA(4 downto 0);
	
	-- ASHR2
	sASHR2 <= sDATA(9) & sDATA(9) & sDATA(9 downto 7);
	
	-- MUX
	sMUX <= sLIM 				  WHEN iSEL = "00" ELSE
			  sDATA(4 downto 0) WHEN iSEL = "01" ELSE
			  sDATA(9 downto 5) WHEN iSEL = "10" ELSE
			  sASHR2;
	
	-- REG IZ MUX
	process(iCLK, inRST) begin
		if(inRST = '0') then
			sREG <= "00000";
		elsif(rising_edge(iCLK)) then
			if(sTC = '1') then
				sREG <= sMUX;
			end if;
		end if;
	end process;
end architecture; 