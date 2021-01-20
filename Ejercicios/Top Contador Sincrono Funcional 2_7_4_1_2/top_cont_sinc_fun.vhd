library ieee;
use ieee.std_logic_1164.all;

entity cont_top is
	port(
		clr:in std_logic;
		ABC:out std_logic_vector(2 downto 0)
	);
end cont_top;

architecture top_fun of cont_top is
	signal osc_aux,Q19_aux: std_logic;
	
	component osc00 is
	port(
		osc_int0:inout std_logic
	);
	end component;

	component clk_div is
		port(
			clk,clr:in std_logic;
			q19:out std_logic
		);
	end component;

	component cont is
		port(
			clk,clr:in std_logic;
			ABC:out std_logic_vector(2 downto 0)
		);
	end component;
	
	begin
		
		cto1: osc00 port map(osc_int0=>osc_aux);
		cto2: clk_div port map(clk=>osc_aux, clr=>clr, q19=>Q19_aux);
		cto3: cont port map(clk=>Q19_aux, clr=>clr, ABC=>ABC);

end top_fun;	
