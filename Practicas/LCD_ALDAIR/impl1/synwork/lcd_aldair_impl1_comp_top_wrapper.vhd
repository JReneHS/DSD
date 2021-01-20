--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Jan 20 00:37:35 2021
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_lcd_final is
   port (
      clr : in std_logic;
      s : out std_logic_vector(9 downto 0)
   );
end wrapper_for_lcd_final;

architecture lcd of wrapper_for_lcd_final is

component lcd_final
 port (
   clr : in std_logic;
   s : out std_logic_vector (9 downto 0)
 );
end component;

signal tmp_clr : std_logic;
signal tmp_s : std_logic_vector (9 downto 0);

begin

tmp_clr <= clr;

s <= tmp_s;



u1:   lcd_final port map (
		clr => tmp_clr,
		s => tmp_s
       );
end lcd;
