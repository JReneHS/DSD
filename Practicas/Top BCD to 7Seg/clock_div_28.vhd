library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library machxo2;
use machxo2.all;

entity clk_div is
	port(
		clk,clr:in std_logic;
		q28t19:out std_logic_vector(9 downto 0);
		q9t8:out std_logic_vector(1 downto 0)
	);
end clk_div;

architecture divisor of clk_div is
	signal Qaux:std_logic_vector(28 downto 0);
	begin
		process(clk,clr)
			begin
				if(clr='1')then Qaux<=(others =>'0');
				elsif(clk'event and clk='1')then
					Qaux<=Qaux+1;
				end if;
				if(Qaux(28 downto 19)="1111101000")then Qaux<=(others =>'0');
				end if;
		end process;
		q28t19<=Qaux(28 downto 19);
		q9t8<=Qaux(1 downto 0);
	end divisor;
