library ieee;
use ieee.std_logic_1164.all;
entity decoder is
	port(
		A:in std_logic_vector(1 downto 0);
		O:out std_logic_vector(3 downto 0)
	);
end decoder;

architecture dec of decoder is
begin
	process(A)
	begin
		case A is
			when "00"=>O<="0111";
			when "01"=>O<="1011";
			when "10"=>O<="1101";
			when others=>O<="1110";
		end case;
	end process;
end dec;