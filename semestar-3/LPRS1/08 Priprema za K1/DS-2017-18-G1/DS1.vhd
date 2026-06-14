library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DS1 is 
	port(
		iCLK 		: in  std_logic;
		inRESET  : in  std_logic;
		iSEL		: in  std_logic_vector(5 downto 0);
		iD			: in  std_logic_vector(3 downto 0);
		iWE		: in  std_logic;
		oQ			: out std_logic_vector(4 downto 0)
	);
	
end entity;

architecture arch of DS1 is
	signal sWE0, sWE1, sWE2, SWE3 : std_logic;
	signal sR0, sR1, sR2, sR3 		: std_logic_vector(3 downto 0);
	signal sA, sB 						: std_logic_vector(3 downto 0);
	signal sREG_OUT, sADD			: std_logic_vector(4 downto 0);
begin
	-- DEKODER
	-- iSEL(1:0), WE, 4 IZLAZA
	sWE0 <= '1' WHEN iWE = '1' AND iSEL(1 downto 0) = "00" ELSE '0';
	sWE1 <= '1' WHEN iWE = '1' AND iSEL(1 downto 0) = "01" ELSE '0';
	sWE2 <= '1' WHEN iWE = '1' AND iSEL(1 downto 0) = "10" ELSE '0';
	sWE3 <= '1' WHEN iWE = '1' AND iSEL(1 downto 0) = "11" ELSE '0';
	
	-- REG0, SINHRONI RESET
	process(iCLK) begin
		if(iCLK'event AND iCLK = '1') then
			if(inRESET = '0') then
				sR0 <= "0000";
			else
				if(sWE0 = '1') then
					sR0 <= iD;
				end if;
			end if;
		end if;
	end process;
	
	-- REG1, SINHRONI RESET
	process(iCLK) begin
		if(iCLK'event AND iCLK = '1') then
			if(inRESET = '0') then
				sR1 <= "0000";
			else
				if(sWE1 = '1') then
					sR1 <= iD;
				end if;
			end if;
		end if;
	end process;
	
	-- REG2, SINHRONI RESET
	process(iCLK) begin
		if(iCLK'event AND iCLK = '1') then
			if(inRESET = '0') then
				sR2 <= "0000";
			else
				if(sWE2 = '1') then
					sR2 <= iD;
				end if;
			end if;
		end if;
	end process;
	
	-- REG0, SINHRONI RESET
	process(iCLK) begin
		if(iCLK'event AND iCLK = '1') then
			if(inRESET = '0') then
				sR3 <= "0000";
			else
				if(sWE3 = '1') then
					sR3 <= iD;
				end if;
			end if;
		end if;
	end process;
	
	-- MUX1
	sA <= sR0 WHEN iSEL(3 downto 2) = "00" ELSE
		   SR1 WHEN iSEL(3 downto 2) = "01" ELSE
		   sR2 WHEN iSEL(3 downto 2) = "10" ELSE
		   sR3;
		  
	-- MUX2
	sB <= sR0 WHEN iSEL(5 downto 4) = "00" ELSE
		   SR1 WHEN iSEL(5 downto 4) = "01" ELSE
		   sR2 WHEN iSEL(5 downto 4) = "10" ELSE
		   sR3;
		  
	-- SABIRAČ
	sADD <= ('0' & sA) + ('0' & sB);
	
	-- sREG_OUT, SINHRONI RESET
	process(iCLK) begin
		if(iCLK'event AND iCLK = '1') then
			if(inRESET = '0') then
				sREG_OUT <= "00000";
			else
				sREG_OUT <= sADD;
			end if;
		end if;
	end process;	
	
	oQ <= sREG_OUT;
end architecture;