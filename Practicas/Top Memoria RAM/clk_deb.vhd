library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library machxo2;
use machxo2.all;

entity clk_deb is
	port(
		clk:in std_logic;
		q14:out std_logic
	);
end clk_deb;

architecture divisor of clk_deb is
	signal Qaux:std_logic_vector(14 downto 0);
	begin
		process(clk)
			begin
				if(clk'event and clk='1')then
					Qaux<=Qaux+1;
				end if;
		end process;
		q14<=Qaux(14);
end divisor;
