library ieee;
use ieee.std_logic_1164.all;

entity m_rom is
	port(
		cs:in std_logic;
		A:in std_logic_vector(1 downto 0);
		D:out std_logic_vector(3 downto 0)
	);
end m_rom;

architecture mem of m_rom is
begin
	process(cs,A)
	begin
		if(cs='0')then
			case A is
				when "00"=>D<="1010";
				when "01"=>D<="1001";
				when "10"=>D<="1110";
				when others=>D<="0111";
			end case;
		else D<="ZZZZ";
		end if;
	end process;
end mem;