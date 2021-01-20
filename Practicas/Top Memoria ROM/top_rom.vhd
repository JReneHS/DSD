library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
		csr,clr:in std_logic;
		fil,col:out std_logic_vector(7 downto 0)
	);
end top;

architecture TROM of top is

--Oscilador
	component osc00 is
		port(
			osc_int0:inout std_logic
		);
	end component;

--Reloj Divisor
	component clk_div is
		port(
			clk,clr:in std_logic;
			q9,q25:out std_logic_vector(2 downto 0)
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
	
--Señales
	signal osc_aux: std_logic;
	signal q9_aux: std_logic_vector(2 downto 0);
	signal q25_aux: std_logic_vector(2 downto 0);

	begin
		cto1: osc00 port map(osc_int0=>osc_aux);
		cto2: clk_div port map(clk=>osc_aux,clr=>clr,q9=>q9_aux,q25=>q25_aux);
		cto3: deco port map(I=>q9_aux,O=>fil);
		cto4: m_rom port map(cs=>csr,A=>q9_aux,B=>q25_aux,D=>col);
		
end TROM;
	