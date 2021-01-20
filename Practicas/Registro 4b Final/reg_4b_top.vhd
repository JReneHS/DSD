library ieee;
use ieee.std_logic_1164.all;
library machxo2;
use machxo2.all;

entity reg_fin is
	port(
		clr,en_izq,en_der:in std_logic;
		s:in std_logic_vector(1 downto 0);
		abcd:in std_logic_vector(3 downto 0);
		Qabcd:out std_logic_vector(3 downto 0)
	);
end reg_fin;

architecture reg_top of reg_fin is
	component reg is
		port(
			ABCD:in std_logic_vector(3 downto 0);
			s:in std_logic_vector(1 downto 0);
			clk,clr,Ent_izq,Ent_der:in std_logic;
			QAQBQCQD:out std_logic_vector(3 downto 0)
		);
	end component;
	
	component clk_div is
		port(
			clk,clr:in std_logic;
			q19:out std_logic
		);
	end component;
	
	component osc00 is
		port(
			osc_int0:inout std_logic
		);
	end component;
	
	signal Q19_aux,osc_aux:std_logic;
		begin
		cto1: clk_div port map(clk=>osc_aux,clr=>clr,q19=>Q19_aux);
		cto2: reg port map(ABCD=>abcd,s=>s,clk=>Q19_aux,clr=>clr,Ent_izq=>en_izq,Ent_der=>en_der,QAQBQCQD=>Qabcd);
		cto3: osc00 port map(osc_int0=>osc_aux);
end reg_top;		