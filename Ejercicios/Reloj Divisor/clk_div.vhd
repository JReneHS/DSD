library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library machxo2;
use machxo2.all;

entity clk_div is
	port(
		clk,clr:in std_logic;
		q19:out std_logic
	);
end clk_div;

architecture divisor of clk_div is
	signal Qaux:std_logic_vector(19 downto 0);
	begin
		process(clk,clr)
			begin
				if(clr='1')then Qaux<=(others =>'0');
				elsif(clk'event and clk='1')then
					Qaux<=Qaux+1;
				end if;
		end process;
		q19<=Qaux(19);
	end divisor;
