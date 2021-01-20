library ieee;
use ieee.std_logic_1164.all;

entity cont is
	port(
		clk,clr:in std_logic;
		ABCD:out std_logic_vector(3 downto 0)
	);
end cont;

architecture sinc_fun of cont is
	signal Qaux: std_logic_vector(3 downto 0);
	begin
		process(clk,clr)
		begin
			if(clr='1')then Qaux<="0000";
			elsif(clk'event and clk='1')then
				case Qaux is
					when "0000"=>Qaux<="0001";
					when "0001"=>Qaux<="0010";
					when "0010"=>Qaux<="0011";
					when "0011"=>Qaux<="0100";
					when "0100"=>Qaux<="0101";
					when "0101"=>Qaux<="0110";
					when "0110"=>Qaux<="0111";
					when "0111"=>Qaux<="1000";
					when "1000"=>Qaux<="1001";
					when "1001"=>Qaux<="1010";
					when "1010"=>Qaux<="1011";
					when "1011"=>Qaux<="1100";
					when "1100"=>Qaux<="1101";
					when "1101"=>Qaux<="1110";
					when "1110"=>Qaux<="1111";
					when others=>Qaux<="0000";
				end case;
			end if;
		end process;
	ABCD<=Qaux;
end sinc_fun;