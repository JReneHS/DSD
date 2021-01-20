library ieee;
use ieee.std_logic_1164.all;

entity det_sec is
	port(
		clk,clr:in std_logic;
		btn:in std_logic_vector(1 downto 0);
		psw:in std_logic_vector(7 downto 0);
		pas,npas:out std_logic
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

--detector de secuencias funcional Moore
component m_det_sec_fun is
	port(
		clk,clr:in std_logic;
		btn:in std_logic_vector(1 downto 0);
		pswd:in std_logic_vector(7 downto 0);
		pass,n_pass:out std_logic
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
signal ER_aux:std_logic;
signal OS_aux:std_logic;

begin
	
	cto1: deb port map(D=>clk,clk=>Q_190H,clr=>clr,Q=>ER_aux);
	cto2: m_det_sec_fun port map(clk=>ER_aux,clr=>clr,btn=>btn,pswd=>psw,pass=>pas,n_pass=>npas);
	cto3: osc port map(osc_int=>OS_aux);
	cto4: clk_div port map(clk=>OS_aux,clr=>clr,q18=>Q_190H);

end top;