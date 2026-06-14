-- FUNKCIJA G(X)
	sGX <= "00000000" WHEN ( (iA(3 downto 0) = "0000") AND (iB(7 downto 4) = "0000") ) else
			 "00000001" WHEN ( (iA(3 downto 0) = "0110") AND (iB(7 downto 4) = "0000") ) else
			 "00000010" WHEN ( (iA(3 downto 0) = "0111") AND (iB(7 downto 4) = "0000") ) else
			 "00000011" WHEN ( (iA(3 downto 0) = "1000") AND (iB(7 downto 4) = "0000") ) else
			 "00000100" WHEN ( (iA(3 downto 0) = "1001") AND (iB(7 downto 4) = "0000") ) else
			 "00000101" WHEN ( (iA(3 downto 0) = "1010") AND (iB(7 downto 4) = "0000") ) else
			 "00000110" WHEN ( (iA(3 downto 0) = "1011") AND (iB(7 downto 4) = "0000") ) else
			 "00000111" WHEN ( (iA(3 downto 0) = "1100") AND (iB(7 downto 4) = "0000") ) else
			 "00001000" WHEN ( (iA(3 downto 0) = "1101") AND (iB(7 downto 4) = "0000") ) else
			 "00001001" WHEN ( (iA(3 downto 0) = "1110") AND (iB(7 downto 4) = "0000") ) else
			 "00001010" WHEN ( (iA(3 downto 0) = "1111") AND (iB(7 downto 4) = "0000") ) else
			 "00001011" WHEN ( (iA(3 downto 0) = "0000") AND (iB(7 downto 4) = "0000") ) else
			 "00001100" WHEN ( (iA(3 downto 0) = "0001") AND (iB(7 downto 4) = "0000") ) else
			 "00001101" WHEN ( (iA(3 downto 0) = "0010") AND (iB(7 downto 4) = "0000") ) else
			 "00001110" WHEN ( (iA(3 downto 0) = "0011") AND (iB(7 downto 4) = "0000") ) else
			 "00001111";