	library ieee;
	library machxo2;
	use ieee.std_logic_1164.all;
	use machxo2.all;
	
	entity multiplexor is
		port(
			I :in std_logic_vector(1 downto 0);
			s :in std_logic;
			ex_mux :out std_logic
			);
	end multiplexor;
	
	architecture mux of multiplexor is 
	begin
		process(I,s)
		begin
			case s is
			when '0'=>ex_mux<=I(0);
			when others=>ex_mux<=I(1);
			end case;
		end process;
	end mux;