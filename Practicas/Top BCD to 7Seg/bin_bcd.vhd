library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity conv is
	port(
		I:in std_logic_vector(9 downto 0);
		S: out std_logic_vector(11 downto 0)
	);
end conv;

architecture bin_bcd of conv is
begin
	process(I)
	variable x : std_logic_vector(22 downto 0);
	begin
		for i in 0 to 22 loop
			x(i):='0';
		end loop;
		
		x(12 downto 3):=I;
		for i in 0 to 6 loop
			if(x(13 downto 10)>4)then
				x(13 downto 10):= x(13 downto 10)+3;
			end if;
			
			if(x(17 downto 14)>4)then 
				x(17 downto 14):= x(17 downto 14)+3;
			end if;
			
			if(x(21 downto 18)>4)then 
				x(21 downto 18):= x(21 downto 18)+3;
			end if;
			
			x(22 downto 1):=x(21 downto 0);
		end loop;
		
		s<=x(21 downto 10);
	end process;
end bin_bcd;