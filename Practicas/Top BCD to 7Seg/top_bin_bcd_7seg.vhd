library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library machxo2;
use machxo2.all;

entity top_bcd is
	port(
		clr:in std_logic;
		decOut:out std_logic_vector(3 downto 0);
		segOut:out std_logic_vector(6 downto 0)
	);
end top_bcd;

architecture seg of top_bcd is

	component clk_div is
		port(
			clk,clr:in std_logic;
			q28t19:out std_logic_vector(9 downto 0);
			q9t8:out std_logic_vector(1 downto 0)
		);
	end component;
	
	component osc00 is
		port(
			osc_int0:inout std_logic
		);
	end component;
	
	component conv is
		port(
			I:in std_logic_vector(9 downto 0);
			S: out std_logic_vector(11 downto 0)
		);
	end component;
	
	component multiplexor is
		port(
			I :in std_logic_vector(11 downto 0);
			s :in std_logic_vector(1 downto 0);
			ex_mux :out std_logic_vector(3 downto 0)
			);
	end component;
	
	component seg is
		port(
			I :in std_logic_vector(3 downto 0);
			s :out std_logic_vector(6 downto 0)
			);
	end component;
	
	component deco is
		port(
			I :in std_logic_vector(1 downto 0);
			O :out std_logic_vector(3 downto 0)
			);
	end component;
	
	signal osc_aux:std_logic;
	signal sel_aux:std_logic_vector(1 downto 0);
	signal con_aux:std_logic_vector(9 downto 0);
	signal bcd_aux:std_logic_vector(11 downto 0);
	signal dig_aux:std_logic_vector(3 downto 0);
	begin
		cto1: clk_div port map(clk=>osc_aux,clr=>clr,q28t19=>con_aux,q9t8=>sel_aux);
		cto2: osc00 port map(osc_int0=>osc_aux);
		cto3: conv port map(I=>con_aux,S=>bcd_aux);
		cto4: multiplexor port map(I=>bcd_aux,s=>sel_aux,ex_mux=>dig_aux);
		cto5: seg port map(I=>dig_aux,s=>segOut);
		cto6: deco port map(I=>sel_aux,O=>decOut);
end seg;
	
	
	
	
	