library ieee;
use ieee.std_logic_1164.all;

entity reg is
	port(
		ABCD:in std_logic_vector(3 downto 0);
		clk,clr:in std_logic;
		QAQBQCQD:out std_logic_vector(3 downto 0)
	);
end reg;

architecture registro of reg is
signal Qaux:std_logic_vector(3 downto 0);
begin
	process(clk,clr)
	begin
		if(clr='1')then
			Qaux<="0000";
		elsif(clk'event and clk='0')then Qaux<=ABCD;
		elsif(clk='1')then Qaux<=Qaux;
		end if;
	end process;
	QAQBQCQD<=Qaux;
end registro;
