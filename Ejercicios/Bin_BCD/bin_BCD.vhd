library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity conv is
	port(
		I:in std_logic_vector(7 downto 0);
		S: out std_logic_vector(9 downto 0)
	);
end conv;

architecture bin_bcd of conv is
begin
	process(I)
	variable x : std_logic_vector(17 downto 0);
	begin
		for i in 0 to 17 loop
			x(i):='0';
		end loop;
		
		x(10 downto 3):=I;
		for i in 0 to 4 loop
			if(x(11 downto 8)>4)then
				x(11 downto 8):= x(11 downto 8)+3;
			end if;
			
			if(x(15 downto 12)>4)then 
				x(15 downto 12):= x(15 downto 12)+3;
			end if;
			
			x(17 downto 1):=x(16 downto 0);
		end loop;
		
		s<=x(17 downto 8);
	end process;
end bin_bcd;