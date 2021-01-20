library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity top is
	port(
		csr,wr,clr:in std_logic;
		IR:in std_logic_vector(7 downto 0);
		fil,col:out std_logic_vector(7 downto 0)
	);
end top;
	
architecture TRAM of top is

--Oscilador
	component osc00 is
		port(
			osc:inout std_logic
		);
	end component;

--Reloj Divisor RAM
	component clk_div is
		port(
			clk,clr:in std_logic;
			q9:out std_logic_vector(2 downto 0)
		);
	end component;

--Reloj Divisor Anti Rebotes
component clk_deb is
	port(
		clk:in std_logic;
		q14:out std_logic
	);
end component;

--Decodificador
	component deco is
		port(
			I :in std_logic_vector(2 downto 0);
			O :out std_logic_vector(7 downto 0)
			);
	end component;

--Memoria RAM
	component m_ram is
		port(
			cs,r_w:in std_logic;
			I:in std_logic_vector(7 downto 0);
			A:in std_logic_vector(2 downto 0);
			O:out std_logic_vector(7 downto 0)
		);
	end component;
	
--Eliminador de Rebotes
	component deb is
		port(
			D,clk,clr:in std_logic;
			Q:out std_logic
		);
	end component;
	
--MUX
	component multiplexor is
		port(
			I :in std_logic_vector(1 downto 0);
			s :in std_logic;
			ex_mux :out std_logic
			);
	end component;
	
--Señales
	signal mux_aux: std_logic;
	signal q14_aux: std_logic;
	signal rev_csr: std_logic;
	signal imx_aux: std_logic_vector(1 downto 0);
	signal q9_aux: std_logic_vector(2 downto 0);

	begin
		rev_csr<= not (csr);
		cto1: osc00 port map(osc=>imx_aux(1));
		cto2: clk_div port map(clk=>mux_aux,clr=>clr,q9=>q9_aux);
		cto3: clk_deb port map(clk=>imx_aux(1),q14=>q14_aux);
		cto4: deco port map(I=>q9_aux,O=>fil);
		cto5: m_ram port map(cs=>csr,r_w=>wr,I=>IR,A=>q9_aux,O=>col);
		cto6: deb port map(D=>rev_csr,clk=>q14_aux,clr=>clr,Q=>imx_aux(0));
		cto7: multiplexor port map(I=>imx_aux,s=>wr,ex_mux=>mux_aux);
		
end TRAM;