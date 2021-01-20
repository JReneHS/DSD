library ieee;
use ieee.std_logic_1164.all;
library machxo2;
use machxo2.all;

entity reg is
	port(
		ABCD:in std_logic_vector(3 downto 0);
		s:in std_logic_vector(1 downto 0);
		clk,clr,Ent_izq,Ent_der:in std_logic;
		QAQBQCQD:out std_logic_vector(3 downto 0)
	);
end reg;
	
architecture registro of reg is
	signal Qaux:std_logic_vector(3 downto 0);
	begin
	
		process(clk,clr)
		begin
			if(clr='1')then Qaux<="0000";
			elsif(clk'event and clk='1')then
				case s is
					when "00"=>Qaux<=ABCD;
					when "01"=>Qaux(2 downto 0)<=Qaux(3 downto 1);
								Qaux(3)<=Ent_Izq;
					when "10"=>Qaux(3 downto 1)<=Qaux(2 downto 0);
								Qaux(0)<=Ent_Der;
					when others=>Qaux<=Qaux;
				end case;
			end if;
		end process;
	QAQBQCQD<=Qaux;
end registro;
					
					
					
					