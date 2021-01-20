	library ieee;
	library machxo2;
	use machxo2.all;
	use ieee.std_logic_1164.all;
	entity flip is
		port(D,clk,clr :in std_logic;
			Q,Qn :out std_logic);
	end flip;
	
	architecture flop of flip is
	signal Qaux :std_logic;
		begin
		process(clk,clr)
			begin
			
			if(clr ='1')then Qaux<='0';
			elsif(clk'event and clk='1')then
				Qaux<=D;
			end if;
		end process;
		Q<=Qaux;
		Qn<=not Qaux;
	end flop;
		
			