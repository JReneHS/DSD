library ieee;
use ieee.std_logic_1164.all;

entity deb is
	port(
		D,clk,clr:in std_logic;
		Q:out std_logic
	);
end deb;

architecture noreb of deb is
signal Q1,Q2,Q3:std_logic;
begin
	process(clk,clr)
	begin
		if(clr ='1')then 
			Q1<='0';
			Q2<='0';
			Q3<='0';
		elsif(clk'event and clk='1')then
			Q3<=Q2;
			Q2<=Q1;
			Q1<=D;
		end if;
	end process;
	Q<=Q1 and Q2 and (not Q3); --el not es para que la señal sea en forma de pulso
end noreb;
