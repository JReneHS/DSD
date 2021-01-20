library ieee;
use ieee.std_logic_1164.all;

entity lcd_1 is
	port(
		ent : in std_logic_vector(6 downto 0);
		outDD:out std_logic_vector(9 downto 0)
	);
end lcd_1;

architecture lcdDis of lcd_1 is
begin
	outDD<=
	--Juan Rene Hernandez Sanchez
		"0100111000"when ent="0000010" else
		"0000111000"when ent="0000011" else
		"0100001110"when ent="0000100" else
		"0000001110"when ent="0000101" else
		"0100000110"when ent="0000110" else
		"0000000110"when ent="0000111" else
		"1101001010"when ent="0001000" else --J
		"1001001010"when ent="0001001" else --J
		"1101110101"when ent="0001010" else --u
		"1001110101"when ent="0001011" else --u
		"1101100001"when ent="0001100" else --a
		"1001100001"when ent="0001101" else --a
		"1101101110"when ent="0001110" else --n
		"1001101110"when ent="0001111" else --n
		"1100100000"when ent="0010000" else --espacio
		"1000100000"when ent="0010001" else --espacio
		"1101010010"when ent="0010010" else --R
		"1001010010"when ent="0010011" else --R
		"1101100101"when ent="0010100" else --e
		"1001100101"when ent="0010101" else --e
		"1101101110"when ent="0010110" else --n
		"1001101110"when ent="0010111" else --n
		"1101100101"when ent="0011000" else --e
		"1001100101"when ent="0011001" else --e
		"0111000000"when ent="0011010" else --salto de linea
		"0011000000"when ent="0011011" else --salto de linea
		"1101001000"when ent="0011100" else --H
		"1001001000"when ent="0011101" else --H
		"1101100101"when ent="0011110" else --e
		"1001100101"when ent="0011111" else --e
		"1101110010"when ent="0100000" else --r
		"1001110010"when ent="0100001" else --r
		"1101101110"when ent="0100010" else --n
		"1001101110"when ent="0100011" else --n
		"1101100001"when ent="0100100" else --a
		"1001100001"when ent="0100101" else --a
		"1101101110"when ent="0100110" else --n
		"1001101110"when ent="0100111" else --n
		"1101100100"when ent="0101000" else --d
		"1001100100"when ent="0101001" else --d
		"1101100101"when ent="0101010" else --e
		"1001100101"when ent="0101011" else --e
		"1101111010"when ent="0101100" else --z
		"1001111010"when ent="0101101" else --z
		"1100100000"when ent="0101110" else --espacio
		"1000100000"when ent="0101111" else --espacio
		"1101010011"when ent="0110000" else --S
		"1001010011"when ent="0110001" else --S
		"1101100001"when ent="0110010" else --a
		"1001100001"when ent="0110011" else --a
		"1101101110"when ent="0110100" else --n
		"1001101110"when ent="0110101" else --n
		"1101100011"when ent="0110110" else --c
		"1001100011"when ent="0110111" else --c
		"1101101000"when ent="0111000" else --h
		"1001101000"when ent="0111001" else --h
		"1101100101"when ent="0111010" else --e
		"1001100101"when ent="0111011" else --e
		"1101111010"when ent="0111100" else --z
		"1001111010"when ent="0111101" else --z
		"0100000001"when ent="0111110" else --limpiar
		"0000000001"when ent="0111111" else --limpiar
		"0100000010"when ent="1000000" else --mover a inicio
		"0000000010"when ent="1000001" else --mover a inicio
	--Manuel Aldair Moreno Jurado
		"1101001101"when ent="1000010" else --M
		"1001001101"when ent="1000011" else --M
		"1101100001"when ent="1000100" else --a
		"1001100001"when ent="1000101" else --a
		"1101101110"when ent="1000110" else --n
		"1001101110"when ent="1000111" else --n
		"1101110101"when ent="1001000" else --u
		"1001110101"when ent="1001001" else --u
		"1101100101"when ent="1001010" else --e
		"1001100101"when ent="1001011" else --e
		"1101101100"when ent="1001100" else --l
		"1001101100"when ent="1001101" else --l
		"1100100000"when ent="1001110" else --Espacio
		"1000100000"when ent="1001111" else --Espacio
		"1101000001"when ent="1010000" else --A
		"1001000001"when ent="1010001" else --A
		"1101101100"when ent="1010010" else --l
		"1001101100"when ent="1010011" else --l
		"1101100100"when ent="1010100" else --d
		"1001100100"when ent="1010101" else --d
		"1101100001"when ent="1010110" else --a
		"1001100001"when ent="1010111" else --a
		"1101101001"when ent="1011000" else --i
		"1001101001"when ent="1011001" else --i
		"1101110010"when ent="1011010" else --r
		"1001110010"when ent="1011011" else --r
		"0111000000"when ent="1011100" else --Salto de linea
		"0011000000"when ent="1011101" else --Salto de linea
		"1101001101"when ent="1011110" else --M
		"1001001101"when ent="1011111" else --M
		"1101101111"when ent="1100000" else --o
		"1001101111"when ent="1100001" else --o
		"1101110010"when ent="1100010" else --r
		"1001110010"when ent="1100011" else --r
		"1101100101"when ent="1100100" else --e
		"1001100101"when ent="1100101" else --e
		"1101101110"when ent="1100110" else --n
		"1001101110"when ent="1100111" else --n
		"1101101111"when ent="1101000" else --o
		"1001101111"when ent="1101001" else --o
		"1100100000"when ent="1101010" else --Espacio
		"1000100000"when ent="1101011" else --Espacio
		"1101001010"when ent="1101100" else --J
		"1001001010"when ent="1101101" else --J
		"1101110101"when ent="1101110" else --u
		"1001110101"when ent="1101111" else --u
		"1101110010"when ent="1110000" else --r
		"1001110010"when ent="1110001" else --r
		"1101100001"when ent="1110010" else --a
		"1001100001"when ent="1110011" else --a
		"1101100100"when ent="1110100" else --d
		"1001100100"when ent="1110101" else --d
		"1101101111"when ent="1110110" else --o
		"1001101111"when ent="1110111" else --o
		"0100000001"when ent="1111000" else --Limpiar
		"0000000001"when ent="1111001" else --Limpiar
		"0000000000";
end lcdDis;