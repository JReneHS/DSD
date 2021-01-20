library ieee;
use ieee.std_logic_1164.all;

entity cont is
	port(
		clk,clr:in std_logic;
		ABC:out std_logic_vector(2 downto 0)
	);
end cont;

architecture sinc_fun of cont is
	signal Qaux: std_logic_vector(2 downto 0);
	begin
		process(clk,clr)
		begin
			if(clr='1')then Qaux<="000";
			elsif(clk'event and clk='1')then
				case Qaux is
					when "010"=>Qaux<="111";
					when "111"=>Qaux<="100";
					when "100"=>Qaux<="001";
					when "001"=>Qaux<="010";
					when others=>Qaux<="010";
				end case;
			end if;
		end process;
	ABC<=Qaux;
end sinc_fun;