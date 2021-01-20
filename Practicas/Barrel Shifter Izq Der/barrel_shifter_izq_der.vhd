library ieee;
use ieee.std_logic_1164.all;
entity barrel_izq_der is
	port(
		I:in std_logic_vector(7 downto 0);
		shift:in std_logic_vector(2 downto 0);
		Izq_Der:in std_logic;
		O:out std_logic_vector(7 downto 0)
	);
end barrel_izq_der;

architecture shifter of barrel_izq_der is
	begin
	process(I,shift,Izq_Der)
		begin
		if(Izq_Der='0')then 
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
		elsif(Izq_Der='1')then
						case shift is
				when "000"=>O<=I;
				when "001"=>O(6 downto 0)<=I(7 downto 1);
							O(7)<='0';
				when "010"=>O(5 downto 0)<=I(7 downto 2);
							O(7 downto 6)<="00";
				when "011"=>O(4 downto 0)<=I(7 downto 3);
							O(7 downto 5)<="000";
				when "100"=>O(3 downto 0)<=I(7 downto 4);
							O(7 downto 4)<="0000";
				when "101"=>O(2 downto 0)<=I(7 downto 5);
							O(7 downto 3)<="00000";
				when "110"=>O(1 downto 0)<=I(7 downto 6);
							O(7 downto 2)<="000000";
				when others=>O(0)<=I(7);
							O(7 downto 1)<="0000000";
			end case;
		end if;
	end process;
end shifter;