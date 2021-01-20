library ieee;
library machxo2;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use machxo2.all;
entity deco is
	port(
		I :in std_logic_vector(1 downto 0);
		O :out std_logic_vector(3 downto 0)
		);
end deco;

architecture de of deco is 
begin
	process(I)
	begin
		case I is
		when "00"=>O<="1110";
		when "01"=>O<="1101";
		when "10"=>O<="1011";
		when others=>O<="0111";
		end case;
	end process;
end de;