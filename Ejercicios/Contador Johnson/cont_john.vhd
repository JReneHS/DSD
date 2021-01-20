library ieee;
use ieee.std_logic_1164.all;

entity cont is
	port(
		clk,clr:in std_logic;
		Q:out std_logic_vector(3 downto 0)
	);
end cont;

architecture john of cont is
signal Qaux:std_logic_vector(3 downto 0);
begin
	process(clk,clr)
	begin
		if(clr='1')then Qaux<="0000";
		elsif(clk'event and clk='1')then
			Qaux(0)<=Qaux(1);
			Qaux(1)<=Qaux(2);
			Qaux(2)<=Qaux(3);
			Qaux(3)<=not Qaux(0);
		end if;
	end process;
	Q<=Qaux;
end john;