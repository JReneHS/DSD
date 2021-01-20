library ieee;
use ieee.std_logic_1164.all;

entity m_rom is
	port(
		cs:in std_logic;
		A,B:in std_logic_vector(2 downto 0);
		D:out std_logic_vector(7 downto 0)
	);
end m_rom;

architecture mem of m_rom is
begin
	process(cs,A,B)
	begin
		if(cs='0')then
			case B is
				when "000"=>
					case A is
						when "000"=>D<="00111100";
						when "001"=>D<="01111110";
						when "010"=>D<="11110111";
						when "011"=>D<="11111111";
						when "100"=>D<="11111111";
						when "101"=>D<="11111111";
						when "110"=>D<="01111110";
						when others=>D<="00111100";
					end case;
				when "001"=>
					case A is
						when "000"=>D<="00111100";
						when "001"=>D<="01111110";
						when "010"=>D<="11110111";
						when "011"=>D<="11111111";
						when "100"=>D<="01111111";
						when "101"=>D<="00001111";
						when "110"=>D<="01111110";
						when others=>D<="00111100";
					end case;
				when "010"=>
					case A is
						when "000"=>D<="00111100";
						when "001"=>D<="01111110";
						when "010"=>D<="00111011";
						when "011"=>D<="00011111";
						when "100"=>D<="00011111";
						when "101"=>D<="00001111";
						when "110"=>D<="01111110";
						when others=>D<="00111100";
					end case;
				when "011"=>
					case A is
						when "000"=>D<="01111100";
						when "001"=>D<="00111010";
						when "010"=>D<="00011111";
						when "011"=>D<="00001111";
						when "100"=>D<="00000111";
						when "101"=>D<="00001111";
						when "110"=>D<="00011110";
						when others=>D<="00111100";
					end case;
				when "100"=>
					case A is
						when "000"=>D<="00111100";
						when "001"=>D<="01111110";
						when "010"=>D<="00111011";
						when "011"=>D<="00011111";
						when "100"=>D<="00011111";
						when "101"=>D<="00001111";
						when "110"=>D<="01111110";
						when others=>D<="00111100";
					end case;
				when others=>
					case A is
						when "000"=>D<="00111100";
						when "001"=>D<="01111110";
						when "010"=>D<="11110111";
						when "011"=>D<="11111111";
						when "100"=>D<="01111111";
						when "101"=>D<="00001111";
						when "110"=>D<="01111110";
						when others=>D<="00111100";
					end case;
			end case;
		else D<="ZZZZZZZZ";
		end if;
	end process;
end mem;