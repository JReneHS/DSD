library ieee;
use ieee.std_logic_1164.all;
library machxo2;
use machxo2.all;

entity ejemplo is
	port(
		D,clk,clr,s:in std_logic;
		QD,QDn:out std_logic
	);
end ejemplo;

architecture ej_top of ejemplo is
	component flip is
		port(
			D,clk,clr:in std_logic;
			Q,Qn:out std_logic
		);
	end component;
	
	component multiplexor is
		port(
			I:in std_logic_vector(1 downto 0);
			s:in std_logic;
			ex_mux:out std_logic
		);
	end component;
	
	signal sal_mux_aux:std_logic;
	signal sal_ff_aux:std_logic;
	signal aux:std_logic_vector(1 downto 0);
	
	begin
		aux(1)<=sal_ff_aux;
		aux(0)<=D;
	
		cto1: flip port map(D=>sal_mux_aux,clk=>clk,clr=>clr,Q=>sal_ff_aux,Qn=>QDn);
		cto2: multiplexor port map(I=>aux,s=>s,ex_mux=>sal_mux_aux);
		QD<=sal_ff_aux;
	end ej_top;