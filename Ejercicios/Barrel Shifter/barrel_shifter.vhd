library ieee;
use ieee.std_logic_1164.all;
entity barrel is
	port(
		I:in std_logic_vector(7 downto 0);
		shift:in std_logic_vector(2 downto 0);
		O:out std_logic_vector(7 downto 0)
	);
end barrel;

architecture shifter of barrel is
	begin
	process(I,shift)
		begin
		case shift is
			when "000"=>O<=I;
			when "001"=>O(7 downto 1)<=I(6 downto 0);
						O(0)<='0';
			when "010"=>O(7 downto 2)<=I(5 downto 0);
						O(1 downto 0)<="00";
			when "011"=>O(7 downto 3)<=I(4 downto 0);
						O(2 downto 0)<="000";
			when "100"=>O(7 downto 4)<=I(3 downto 0);
						O(3 downto 0)<="0000";
			when "101"=>O(7 downto 5)<=I(2 downto 0);
						O(4 downto 0)<="00000";
			when "110"=>O(7 downto 6)<=I(1 downto 0);
						O(5 downto 0)<="000000";
			when others=>O(7)<=I(0);
						O(6 downto 0)<="0000000";
		end case;
	end process;
end shifter;
