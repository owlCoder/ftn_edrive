library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library altera; 
use altera.altera_primitives_components.all;

entity coder is
	port(
		iX			  : in std_logic_vector(7 downto 0);
		oY_uslovna : out std_logic_vector(2 downto 0);
		oY_if		  : out std_logic_vector(2 downto 0);
		oY_case	  : out std_logic_vector(2 downto 0)
	);
end entity;

architecture Behavioral of coder is
	
begin
	-- uslovna dodela
	oY_uslovna <= "111" when iX(7) = '1' else
					  "110" when iX(6) = '1' else
					  "101" when iX(5) = '1' else
					  "100" when iX(4) = '1' else
					  "011" when iX(3) = '1' else
					  "010" when iX(2) = '1' else
					  "001" when iX(1) = '1' else
					  "000";
					  
	-- if-else process
	process (iX) begin
		if (iX(7) = '1') then
			oY_if <= "111";
		elsif (iX(6) = '1') then
			oY_if <= "110";
		elsif (iX(5) = '1') then
			oY_if <= "101";
		elsif (iX(4) = '1') then
			oY_if <= "100";
		elsif (iX(3) = '1') then
			oY_if <= "011";
		elsif (iX(2) = '1') then
			oY_if <= "010";
		elsif (iX(1) = '1') then
			oY_if <= "001";
		else
			oY_if <= "000";
		end if;
	end process;
	
	-- case
	process (iX) begin
		case iX is
			when "10000000" => 
				oY_case <= "111";
			when "01000000" => 
				oY_case <= "110";
			when "00100000" => 
				oY_case <= "101";
			when "00010000" => 
				oY_case <= "100";
			when "00001000" => 
				oY_case <= "011";
			when "00000100" => 
				oY_case <= "010";
			when "00000010" => 
				oY_case <= "001";
			when others     
				=> oY_case <= "000";
		end case;
	end process;
	
end architecture;