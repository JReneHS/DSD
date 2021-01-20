library ieee;
use ieee.std_logic_1164.all;

entity top is
	port(
		CLR:in std_logic;
		fil:in std_logic_vector(3 downto 0);
		col:out std_logic_vector(3 downto 0);
		digit:out std_logic_vector(6 downto 0)
	);
end top;

architecture tec of top is

	component multi is
		port(
			I:in std_logic_vector(3 downto 0);
			S:in std_logic_vector(1 downto 0);
			O:out std_logic
		);
	end component;

	component cont is
		port(
			clk,clr:in std_logic;
			ABCD:out std_logic_vector(3 downto 0)
		);
	end component;

	component decoder is
		port(
			A:in std_logic_vector(1 downto 0);
			O:out std_logic_vector(3 downto 0)
		);
	end component;

	component deb is
		port(
			D,clk,clr:in std_logic;
			Q:out std_logic
		);
	end component;

	component osc00 is
		port(
			osc_int0:inout std_logic
		);
	end component;

	component clk_div is
		port(
			clk,clr:in std_logic;
			q11,q13:out std_logic
		);
	end component;

	component reg is
		port(
			ABCD:in std_logic_vector(3 downto 0);
			clk,clr:in std_logic;
			QAQBQCQD:out std_logic_vector(3 downto 0)
		);
	end component;

	component seg is
		port(
			I :in std_logic_vector(3 downto 0);
			s :out std_logic_vector(6 downto 0)
			);
	end component;
	
	signal osc_aux:std_logic;
	signal mux_aux:std_logic;
	signal mod_aux:std_logic;
	signal q11_aux:std_logic;
	signal q13_aux:std_logic;
	signal deb_aux:std_logic;
	signal clkAnd:std_logic; 
	signal mod_mux_dec:std_logic_vector(3 downto 0);
	signal dec_aux:std_logic_vector(3 downto 0);

	begin
		cto1: multi port map(I=>fil,S=>mod_mux_dec(3 downto 2),O=>mux_aux);
		cto2: decoder port map(A=>mod_mux_dec(1 downto 0),O=>col);
		cto3: deb port map(D=>mux_aux,clk=>q13_aux,clr=>CLR,Q=>deb_aux);
		cto4: osc00 port map(osc_int0=>osc_aux);
		cto5: clk_div port map(clk=>osc_aux,clr=>CLR,q11=>q11_aux,q13=>q13_aux);
		cto6: reg port map(ABCD=>mod_mux_dec,clk=>deb_aux,clr=>CLR,QAQBQCQD=>dec_aux);
		cto7: seg port map(I=>dec_aux,s=>digit);
		clkAnd<= q11_aux and mux_aux;
		cto8: cont port map(clk=>clkAnd,clr=>CLR,ABCD=>mod_mux_dec);
end tec;