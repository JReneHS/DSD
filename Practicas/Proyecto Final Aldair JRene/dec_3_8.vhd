library ieee;
library machxo2;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use machxo2.all;

entity deco is
	port(
		I :in std_logic_vector(2 downto 0);
		O :out std_logic_vector(7 downto 0)
		);
end deco;

architecture de of deco is 
begin
	process(I)
	begin
		case I is
		when "000"=>O<="01111111";
		when "001"=>O<="10111111";
		when "010"=>O<="11011111";
		when "011"=>O<="11101111";
		when "100"=>O<="11110111";
		when "101"=>O<="11111011";
		when "110"=>O<="11111101";
		when others=>O<="11111110";
		end case;
	end process;
end de;