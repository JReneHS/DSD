library ieee;
use ieee.std_logic_1164.all;

entity pfinal is
	port(
		clr,csr:in std_logic;
		fil,col:out std_logic_vector(7 downto 0);
		lcdOut:out std_logic_vector(9 downto 0)
	);
end pfinal;
	
architecture top of pfinal is

--Oscilador
	component osc00 is
		port(
			osc_int0:inout std_logic
		);
	end component;

--Reloj Divisor ROM
	component clk_PCM is
		port(
			clk,clr:in std_logic;
			q9,q25:out std_logic_vector(2 downto 0)
		);
	end component;

--Reloj Divisor LCD
	component clk_LCD is 
			port(
				clk,clr:in std_logic;
				q23:out std_logic_vector(6 downto 0)
				);
	end component;

--Decodificador
	component deco is
		port(
			I :in std_logic_vector(2 downto 0);
			O :out std_logic_vector(7 downto 0)
			);
	end component;
	
--Memoria ROM
	component m_rom is
		port(
			cs:in std_logic;
			A,B:in std_logic_vector(2 downto 0);
			D:out std_logic_vector(7 downto 0)
		);
	end component;

--LCD
	component lcd_1 is
		port (
			ent:in std_logic_vector(6 downto 0);
			outDD:out std_logic_vector(9 downto 0)
		);
	end component;

--Señales
	signal osc_aux: std_logic;
	signal q9_aux: std_logic_vector(2 downto 0);
	signal q25_aux: std_logic_vector(2 downto 0);
	signal q23_aux:std_logic_vector(6 downto 0);

begin

	cto1: osc00 port map(osc_int0=>osc_aux);
	cto2: clk_LCD port map(clk=>osc_aux,clr=>clr,q23=>q23_aux);
	cto3: lcd_1 port map(ent=>q23_aux,outDD=>lcdOut);
	cto4: clk_PCM port map(clk=>osc_aux,clr=>clr,q9=>q9_aux,q25=>q25_aux);
	cto5: deco port map(I=>q9_aux,O=>fil);
	cto6: m_rom port map(cs=>csr,A=>q9_aux,B=>q25_aux,D=>col);

end top;
