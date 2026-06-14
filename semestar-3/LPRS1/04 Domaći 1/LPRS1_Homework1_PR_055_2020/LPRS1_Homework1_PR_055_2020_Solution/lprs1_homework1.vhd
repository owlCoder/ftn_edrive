library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Libraries.

entity lprs1_homework1 is
	port(
		i_x   :  in std_logic_vector(3 downto 0);
		i_y   :  in std_logic_vector(3 downto 0);
		i_z   :  in std_logic_vector(1 downto 0);
		i_sel :  in std_logic_vector(1 downto 0);
		o_res : out std_logic_vector(3 downto 0);
		o_cmp : out std_logic_vector(1 downto 0);
		o_enc : out std_logic_vector(1 downto 0)
	);
end entity;


architecture arch of lprs1_homework1 is
	-- Signals.
	-- Напомена да су сви интерни сигнали 4-битни
	signal s_shl    : std_logic_vector(3 downto 0);
	signal s_shr    : std_logic_vector(3 downto 0);
	signal s_dec    : std_logic_vector(3 downto 0);
	signal s_add 	 : std_logic_vector(3 downto 0);
	signal s_sub    : std_logic_vector(3 downto 0);
	signal s_const0 : std_logic_vector(3 downto 0);
	signal s_const1 : std_logic_vector(3 downto 0);
	signal s_mux    : std_logic_vector(3 downto 0);
	
begin
	-- Design.
	-- 1. На сигнал s_shl довести i_x померен 1 бит(а) у лево аритметички.
	-- LEVO ARITMETIČKO POMERANJE ZA 1
	s_shl <= i_x(2 downto 0) & '0';
	
	-- 2. На сигнал s_shr довести i_y померен 2 бит(а) у десно логички.
	-- DESNI LOGIČKO POMERANJE ZA 2
	s_shr <= '0' & '0' & i_Y(3 downto 2);
	
	-- 3. На сигналу s_dec поставити бит са редним броjем i_z на jединицу а остале бите на логичку нулу.
	-- KOMPONENTA: DEKODER
	s_dec <= "0001" when i_z = "00" else
			 "0010" when i_z = "01" else
			 "0100" when i_z = "10" else
			 "1000";	
	
	-- 4. Сигналу s_add доделити збир s_shl и s_shr сигнала.
	-- SABIRAC
	s_add <= s_shl + s_shr;
	
	-- 5. Од s_dec одузети i_x и разлику доделити s_sub сигналу.
	-- ODUZIMAC
	s_sub <= s_dec - i_x;
	
	-- 6. На сигнал s_const0 доделити 3.
	-- DODELA VREDNOSTI KONSTANTI const0
	s_const0 <= "0011"; -- 2 + 1
	
	-- 7. На сигнал s_const1 доделити 12.
	-- DODELA VREDNOSTI KONSTANTI const1
	s_const1 <= "1100"; -- 8 + 4
	
	-- 8. На сигнал s_mux доделити:
	--  s_sub ако jе i_sel jеднако 0
	--  s_const0 ако jе i_sel jеднако 1
	--  s_const1 ако jе i_sel jеднако 2
	--  s_add ако jе i_sel jеднако 3
	-- komponenta: MULTIPLEXER
	s_mux 	<=  s_sub		when i_sel = "00" else
				s_const0    when i_sel = "01" else
				s_const1    when i_sel = "10" else
				s_add		when i_sel = "11" else
				"0011"; -- 2 + 1
	
	-- 9. Сигналу o_res доделити сигнал s_mux.
	-- DODELA VREDNOSTI SIGNALA SA MUX NA O_RES
	o_res <= s_mux;
	
	-- 10. На сигнал o_cmp(0) довести логичку jединицу ако jе s_mux различит од 0.
	-- COMPARATOR
	o_cmp(0)	<= '1'      when s_mux /= "0000" else
				   '0';
	
	-- 11. На сигнал o_cmp(1) довести логичку jединицу ако jе s_mux мањи од 6.
	-- COMPARATOR
	o_cmp(1)	<= '1'      when s_mux <  "0110" else -- 4 + 2
				   '0';
	
	-- 12. На сигнал o_enc довести индекс бита на логичкоj jединици сигнала s_mux. Ако постоjи више таквих бита, изабрати
	-- онаj са наjмањим индексом. Ако ни jедан бит ниjе на логичкоj jединици, резултат нека буде 3.
	-- s_mux je 4-bitni te su potrebne i 4 provere
	-- KOMPONENTA: ENCODER
	o_enc 	<= "00" when s_mux(0) = '1' else  			-- indeks je nula ako je najniži bit 1
			   "01" when s_mux(1) = '1' else			-- indeks je jedan ako najniži bit pre nije imao vrednost log. jedinice
			   "10" when s_mux(2) = '1' else			-- ako nijedan od gornja dva nije log. jedinica onda proveriti sledeći viši bit
			   "11" when s_mux(3) = '1' else			-- da li je najviši bit log. 1
			   "11";									-- nijedan od bitova signala multipleksera nije log. jedinica te se postavlja default vrednost	
end architecture;