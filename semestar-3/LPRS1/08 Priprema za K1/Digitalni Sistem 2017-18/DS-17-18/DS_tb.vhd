library ieee;
use ieee.std_logic_1164.all;
 
entity DS_tb is
end DS_tb;
 
architecture dstb of DS_tb is 
 
    component DS port (
        iCLK : in std_logic;
        inRST : in std_logic;
        iD : in std_logic;
        iEN : in std_logic;
        iSEL : in std_logic_vector(1 downto 0);
        oQ : out std_logic_vector(4 downto 0)
    );
    end component;
    
    -- Ulazi
    signal iCLK : std_logic;
    signal inRST : std_logic;
    signal iD : std_logic;
    signal iEN : std_logic;
    signal iSEL : std_logic_vector(1 downto 0);

 	-- Izlazi
    signal oQ : std_logic_vector(4 downto 0);

    -- Period takta
    constant i_clk_period : time := 10ns;

begin

    -- Sistem koji testiramo
    uut : DS port map (
        iCLK => iCLK,
        inRST => inRST,
        iD => iD,
        iEN => iEN,
        iSEL => iSEL,
        oQ => oQ
    );

    -- Proces za generisanje takta
    clock_proc: process begin
        iCLK <= '0';
        wait for i_clk_period / 2;
        iCLK <= '1';
        wait for i_clk_period / 2;
    end process;

    -- Stimulus proces
    stim_proc: process begin		
		  iD <= '0';
		  iSEL <= "00";
		  iEN <= '0';
        -- pritisnemo reset neko vreme, pa pustimo
        inRST <= '0';
        wait for 5 * i_clk_period;
        inRST <= '1';

        -- postavimo dozvolu na 1
        iEN <= '1';

        -- prvi slučaj
        -- 24 iz limitera
        iSEL <= "00";
        iD <= '1';  -- 0
        wait for i_clk_period;
        iD <= '1';  -- 1
        wait for i_clk_period;
        iD <= '1';  -- 2
        wait for i_clk_period;
        iD <= '1';  -- 3
        wait for i_clk_period;
        iD <= '1';  -- 4
        wait for i_clk_period;
        iD <= '1';  -- 5
        wait for i_clk_period;
        iD <= '1';  -- 6
        wait for i_clk_period;
        iD <= '1';  -- 7
        wait for i_clk_period;
        iD <= '1';  -- 8
        wait for i_clk_period;
        iD <= '1';  -- 9
        wait for i_clk_period;

        -- drugi slučaj
        -- 30 iz DATA[9:5]  11110
        iSEL <= "10";
        iD <= '1';  -- 0
        wait for i_clk_period;
        iD <= '1';  -- 1
        wait for i_clk_period;
        iD <= '1';  -- 2
        wait for i_clk_period;
        iD <= '1';  -- 3
        wait for i_clk_period;
        iD <= '1';  -- 4
        wait for i_clk_period;
        iD <= '0';  -- 5
        wait for i_clk_period;
        iD <= '1';  -- 6
        wait for i_clk_period;
        iD <= '1';  -- 7
        wait for i_clk_period;
        iD <= '1';  -- 8
        wait for i_clk_period;
        iD <= '1';  -- 9
        wait for i_clk_period;

        -- treći slučaj
        -- 19 iz sDATA[4:0]  10011
        iSEL <= "01";
        iD <= '1';  -- 0
        wait for i_clk_period;
        iD <= '1';  -- 1
        wait for i_clk_period;
        iD <= '0';  -- 2
        wait for i_clk_period;
        iD <= '0';  -- 3
        wait for i_clk_period;
        iD <= '1';  -- 4
        wait for i_clk_period;
        iD <= '1';  -- 5
        wait for i_clk_period;
        iD <= '1';  -- 6
        wait for i_clk_period;
        iD <= '1';  -- 7
        wait for i_clk_period;
        iD <= '1';  -- 8
        wait for i_clk_period;
        iD <= '1';  -- 9
        wait for i_clk_period;

        -- četvrti slučaj
        -- 0x1C iz pomerača    100--  11100  
        iSEL <= "11";
        iD <= '1';  -- 0
        wait for i_clk_period;
        iD <= '1';  -- 1
        wait for i_clk_period;
        iD <= '1';  -- 2
        wait for i_clk_period;
        iD <= '1';  -- 3
        wait for i_clk_period;
        iD <= '1';  -- 4
        wait for i_clk_period;
        iD <= '1';  -- 5
        wait for i_clk_period;
        iD <= '1';  -- 6
        wait for i_clk_period;
        iD <= '0';  -- 7
        wait for i_clk_period;
        iD <= '0';  -- 8
        wait for i_clk_period;
        iD <= '1';  -- 9
        wait for i_clk_period;

        wait;
    end process;
end;
