library ieee;
use ieee.std_logic_1164.all;
entity contador is
	port(
		clk,clr:in std_logic;
		Qa,Qb,Qc:out std_logic
	);
end contador;

architecture sincrono of contador is
	signal SARA,SBRB,SCRC:std_logic_vector(1 downto 0);
	signal QaAux,QbAux,QcAux:std_logic;
	begin
		process(clk,clr)
			begin
			if(clr='1')then QaAux<='0';
			elsif(clk'event and clk='1')then
				case SARA is
					when "00"=>QaAux<=QaAux;
					when "01"=>QaAux<='0';
					when "10"=>QaAux<='1';
					when others=>QaAux<='-';
				end case;
			end if;
			if(clr='1')then QbAux<='0';
			elsif(clk'event and clk='1')then
				case SBRB is
					when "00"=>QbAux<=QbAux;
					when "01"=>QbAux<='0';
					when "10"=>QbAux<='1';
					when others=>QbAux<='-';
				end case;
			end if;
			if(clr='1')then QcAux<='0';
			elsif(clk'event and clk='1')then
				case SCRC is
					when "00"=>QcAux<=QcAux;
					when "01"=>QcAux<='0';
					when "10"=>QcAux<='1';
					when others=>QcAux<='-';
				end case;
			end if;
		end process;
		
		SARA(1)<= QbAux and QcAux and not (QaAux);
		SARA(0)<= QbAux and QcAux and QaAux;
		
		SBRB(1)<= QcAux and not (QbAux);
		SBRB(0)<= QbAux and QcAux;
		
		SCRC(1)<= not (QcAux);
		SCRC(0)<= QcAux;
		
		Qa<=QaAux;
		Qb<=QbAux;
		Qc<=QcAux;
end sincrono;