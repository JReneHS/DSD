library ieee;
library machxo2;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use machxo2.all;

entity multiplexor is
	port(
		I :in std_logic_vector(11 downto 0);
		s :in std_logic_vector(1 downto 0);
		ex_mux :out std_logic_vector(3 downto 0)
		);
end multiplexor;

architecture mux of multiplexor is 
begin
	process(I,s)
	begin
		case s is
		when "00"=>ex_mux<=I(3 downto 0);
		when "01"=>ex_mux<=I(7 downto 4);
		when "10"=>ex_mux<=I(11 downto 8);
		when others=>ex_mux<="0000";
		end case;
	end process;
end mux;
			