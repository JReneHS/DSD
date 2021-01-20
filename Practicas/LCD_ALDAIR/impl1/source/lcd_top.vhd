	library ieee;
	use ieee.std_logic_1164.all;
	entity lcd_final is
		port(clr:in std_logic;
		s:out std_logic_vector(9 downto 0));
	end lcd_final;
	
	architecture lcd of lcd_final is
	
	component osc00 is
	port(
       osc_int0: inout std_logic);
	end component;
	
	component clk_div is 
		port(clk,clr:in std_logic;
			q18:out std_logic_vector(5 downto 0));
	end component;
	
	component memoria_1 is
		port (ent : in std_logic_vector(5 downto 0);
		salida:out std_logic_vector(9 downto 0));
	end component;
	
signal Qaux :std_logic;
signal q18_aux:std_logic_vector(5 downto 0);

	begin
	
cto1: osc00 port map(osc_int0=>Qaux);
cto2: clk_div port map(clk=>Qaux,clr=>clr,q18=>q18_aux);
cto3: memoria_1 port map(ent=>q18_aux,salida=>s);

end lcd;