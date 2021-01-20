library ieee;
library machxo2;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use machxo2.all;
entity seg is
	port(
		I :in std_logic_vector(3 downto 0);
		s :out std_logic_vector(6 downto 0)
		);
end seg;

architecture dec of seg is 
begin
	process(I)
	begin
		case I is
		when "0000"=>s<="0111111";
		when "0001"=>s<="0000110";
		when "0010"=>s<="1011011";
		when "0011"=>s<="1001111";
		when "0100"=>s<="1100110";
		when "0101"=>s<="1101101";
		when "0110"=>s<="1111101";
		when "0111"=>s<="0000111";
		when "1000"=>s<="1111111";
		when "1001"=>s<="1100111";
		when "1010"=>s<="1110111";
		when "1011"=>s<="1111100";
		when "1100"=>s<="0111001";
		when "1101"=>s<="1011110";
		when "1110"=>s<="1111001";
		when others=>s<="1110001";
		end case;
	end process;
end dec;