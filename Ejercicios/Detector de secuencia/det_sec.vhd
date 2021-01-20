library ieee;
use ieee.std_logic_1164.all;

entity det_sec is
	port(
		x,clk,clr:in std_logic;
		z:out std_logic
	);
end det_sec;

architecture beh of det_sec is
	signal y1,y0:std_logic;
	signal SR1,SR0:std_logic_vector(1 downto 0); -- S = 1 / R = 0
	begin
	SR1(1)<=y0 and (not x) and (not y1);
	SR1(0)<=(y1 and y0 and (not x)) or (x and (not y0));

	SR0(1)<=(y1 and (not y0)) or (x and (not y1));
	SR0(0)<=y1 and y0;

	z<=x and y1 and (not y0);

	process(clk,clr)
	begin
		if(clr='1')then y1<='0';y0<='0';
		elsif(clk'event and clk='1')then
		
			case SR1 is
				when "00"=> y1<=y1;
				when "01"=> y1<='0';
				when "10"=> y1<='1';
				when others=> y1<='-';
			end case;
		
			case SR0 is
				when "00"=> y0<=y0;
				when "01"=> y0<='0';
				when "10"=> y0<='1';
				when others=> y0<='-';
			end case;
		end if;
	end process;
end beh;