library ieee;
use ieee.std_logic_1164.all;

entity det_sec is
	port(
		clr:in std_logic;
		btn:in std_logic_vector(1 downto 0);
		z:out std_logic
	);
end det_sec;

architecture top of det_sec is

--eliminador de rebelotes
component deb is
	port(
		D,clk,clr:in std_logic;
		Q:out std_logic
	);
end component;

--detector de secuencias funcienal Moore
component m_det_sec_fun is
	port(
		x,clk,clr:in std_logic;
		z:out std_logic
	);
end component;

--oscilador
component osc is
	port(
		osc_int:inout std_logic
	);
end component;

--Reloj Divisor
component clk_div is
	port(
		clk,clr:in std_logic;
		q18:out std_logic
	);
end component;

--Señales
signal Q_190H:std_logic;
signal OR_aux:std_logic;
signal ER_aux:std_logic;
signal OS_aux:std_logic;

begin

	OR_aux<=btn(1) or btn(0);
	
	cto1: deb port map(D=>OR_aux,clk=>Q_190H,clr=>clr,Q=>ER_aux);
	cto2: m_det_sec_fun port map(x=>btn(1),clk=>ER_aux,clr=>clr,z=>z);
	cto3: osc port map(osc_int=>OS_aux);
	cto4: clk_div port map(clk=>OS_aux,clr=>clr,q18=>Q_190H);

end top;