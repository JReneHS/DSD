library ieee;
use ieee.std_logic_1164.all;

entity contador is
	port(
		clk,clr:in std_logic;
		Qa,Qb,Qc:out std_logic
	);
end contador;

architecture sincrono of contador is
	signal JAKA,JBKB,JCKC:std_logic_vector(1 downto 0);
	signal QaAux,QbAux,QcAux:std_logic;
	begin
-- Son los comportamientos del flip flop JK
		process(clk,clr)
			begin
			if(clr='1')then QaAux<='0';
			elsif(clk'event and clk='1')then
				case JAKA is
					when "00"=>QaAux<=QaAux;
					when "01"=>QaAux<='0';
					when "10"=>QaAux<='1';
					when others=>QaAux<=not QaAux;
				end case;
			end if;
			if(clr='1')then QbAux<='0';
			elsif(clk'event and clk='1')then
				case JBKB is
					when "00"=>QbAux<=QbAux;
					when "01"=>QbAux<='0';
					when "10"=>QbAux<='1';
					when others=>QbAux<=not QbAux;
				end case;
			end if;
			if(clr='1')then QcAux<='0';
			elsif(clk'event and clk='1')then
				case JCKC is
					when "00"=>QcAux<=QcAux;
					when "01"=>QcAux<='0';
					when "10"=>QcAux<='1';
					when others=>QcAux<=not QcAux;
				end case;
			end if;
		end process;
--LAS J SON LOS 1 Y LOS K SON LOS 0
-- JAKA(1) J
-- JAKA(0) K
		JAKA(1)<= QbAux and not (QcAux);
		JAKA(0)<= not (QbAux) or not (QcAux);
		
		JBKB(1)<= not (QaAux) or QcAux;
		JBKB(0)<= QaAux and QcAux;
		
		JCKC(1)<= QaAux xor QbAux;
		JCKC(0)<= '1';
		
		Qa<=QaAux;
		Qb<=QbAux;
		Qc<=QcAux;
		
end sincrono;