library ieee;
use ieee.std_logic_1164.all;

entity m_det_sec_fun is
	port(
		x,clk,clr:in std_logic;
		z:out std_logic
	);
end m_det_sec_fun;

architecture moore of m_det_sec_fun is
	type estados is (A,B,C,D,E);
	signal edo_pres,edo_sig:estados;
	begin
		process(x,edo_pres)
		begin
			case edo_pres is
				when A=>z<='0';
					if(x='0')then
						edo_sig<=A;
					else
						edo_sig<=B;
					end if;
				
				when B=>z<='0';
					if(x='0')then
						edo_sig<=C;
					else
						edo_sig<=B;
					end if;
					
				when C=>z<='0';
					if(x='0')then
						edo_sig<=A;
					else
						edo_sig<=D;
					end if;
				
				when D=>z<='0';
					if(x='0')then
						edo_sig<=C;
					else
						edo_sig<=E;
					end if;
				
				when others=>z<='1';
					if(x='0')then
						edo_sig<=C;
					else
						edo_sig<=B;
					end if;
			end case;
		end process;
		
		process(clk,clr)
		begin
			if(clr='1')then edo_pres<=A;
			elsif(clk'event and clk='1')then
				edo_pres<=edo_sig;
			end if;
		end process;
end moore;