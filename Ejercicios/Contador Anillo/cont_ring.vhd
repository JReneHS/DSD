library ieee;
use ieee.std_logic_1164.all;
entity ring is
	port(
		clk,clr:in std_logic;
		q:out std_logic_vector(3 downto 0)
	);
end ring;

architecture cont of ring is
	signal qAux:std_logic_vector(3 downto 0);
	begin
		process(clk,clr)
		begin
			if(clr='1')then qAux<="1000";
			elsif(clk'event and clk='1')then
				qAux(0)<=qAux(1);
				qAux(1)<=qAux(2);
				qAux(2)<=qAux(3);
				qAux(3)<=qAux(0);
			end if;
		end process;
	q<=qAux;
end cont;
	