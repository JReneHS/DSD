--
-- Synopsys
-- Vhdl wrapper for top level design, written on Wed Jan 20 14:13:22 2021
--
library ieee;
use ieee.std_logic_1164.all;

entity wrapper_for_pfinal is
   port (
      clr : in std_logic;
      csr : in std_logic;
      fil : out std_logic_vector(7 downto 0);
      col : out std_logic_vector(7 downto 0);
      lcdOut : out std_logic_vector(9 downto 0)
   );
end wrapper_for_pfinal;

architecture top of wrapper_for_pfinal is

component pfinal
 port (
   clr : in std_logic;
   csr : in std_logic;
   fil : out std_logic_vector (7 downto 0);
   col : out std_logic_vector (7 downto 0);
   lcdOut : out std_logic_vector (9 downto 0)
 );
end component;

signal tmp_clr : std_logic;
signal tmp_csr : std_logic;
signal tmp_fil : std_logic_vector (7 downto 0);
signal tmp_col : std_logic_vector (7 downto 0);
signal tmp_lcdOut : std_logic_vector (9 downto 0);

begin

tmp_clr <= clr;

tmp_csr <= csr;

fil <= tmp_fil;

col <= tmp_col;

lcdOut <= tmp_lcdOut;



u1:   pfinal port map (
		clr => tmp_clr,
		csr => tmp_csr,
		fil => tmp_fil,
		col => tmp_col,
		lcdOut => tmp_lcdOut
       );
end top;
