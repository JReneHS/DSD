library ieee;
use ieee.std_logic_1164.all;

entity m_det_sec_fun is
	port(
		clk,clr:in std_logic;
		btn:in std_logic_vector(1 downto 0);
		pswd:in std_logic_vector(7 downto 0);
		pass,n_pass:out std_logic
	);
end m_det_sec_fun;

architecture moore of m_det_sec_fun is
	type estados is (E1,E2,E3,E4,S0,S1,S2,S3,S4);
	signal edo_pres,edo_sig:estados;
	begin
		process(btn,edo_pres)
		begin
			case edo_pres is
			
				when E1=>
					pass<='0';
					n_pass<='0';
					edo_sig<=E2;
					
				when E2=>
					pass<='0';
					n_pass<='0';
					edo_sig<=E3;
					
				when E3=>
					pass<='0';
					n_pass<='0';
					edo_sig<=E4;
					
				when E4=>
					pass<='0';
					n_pass<='1';
					if(btn=pswd(7 downto 6))then
						edo_sig<=S1;
					else
						edo_sig<=E1;
					end if;
					
				when S0=>
					pass<='0';
					n_pass<='0';
					if(btn=pswd(7 downto 6))then
						edo_sig<=S1;
					else
						edo_sig<=E1;
					end if;
					
				when S1=>
					pass<='0';
					n_pass<='0';
					if(btn=pswd(5 downto 4))then
						edo_sig<=S2;
					else
						edo_sig<=E2;
					end if;
					
				when S2=>
					pass<='0';
					n_pass<='0';
					if(btn=pswd(3 downto 2))then
						edo_sig<=S3;
					else
						edo_sig<=E3;
					end if;
					
				when S3=>
					pass<='0';
					n_pass<='0';
					if(btn=pswd(1 downto 0))then
						edo_sig<=S4;
					else
						edo_sig<=E4;
					end if;
					
				when others=>
					pass<='1';
					n_pass<='0';
					if(btn=pswd(7 downto 6))then
						edo_sig<=S1;
					else
						edo_sig<=E1;
					end if;
			end case;
		end process;
		
		process(clk,clr)
		begin
			if(clr='1')then edo_pres<=S0;
			elsif(clk'event and clk='1')then
				edo_pres<=edo_sig;
			end if;
		end process;
end moore;