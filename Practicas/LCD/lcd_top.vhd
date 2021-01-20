library ieee;
use ieee.std_logic_1164.all;

entity lcd is
	port(
		clr:in std_logic;
		lcdOut:out std_logic_vector(9 downto 0)
	);
end lcd;
	
architecture top of lcd is

	component osc00 is
		port(
			osc_int0: inout std_logic
		);
	end component;

	component clk_div is 
		port(
			clk,clr:in std_logic;
			q23:out std_logic_vector(6 downto 0)
		);
	end component;

	component lcd_1 is
		port (
			ent:in std_logic_vector(6 downto 0);
			outDD:out std_logic_vector(9 downto 0)
		);
	end component;

	signal Qaux :std_logic;
	signal q23_aux:std_logic_vector(6 downto 0);

begin

cto1: osc00 port map(osc_int0=>Qaux);
cto2: clk_div port map(clk=>Qaux,clr=>clr,q23=>q23_aux);
cto3: lcd_1 port map(ent=>q23_aux,outDD=>lcdOut);

end top;