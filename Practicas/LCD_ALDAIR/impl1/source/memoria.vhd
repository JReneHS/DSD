	library ieee;
	use ieee.std_logic_1164.all;
	entity memoria_1 is
		port (ent : in std_logic_vector(5 downto 0);
		salida:out std_logic_vector(9 downto 0));
	end memoria_1;
	
	architecture memoria of memoria_1 is
	begin
		salida<="0100111000"when ent="000010" else
			"0000111000"when ent="000011" else
			"0100001110"when ent="000100" else
			"0000001110"when ent="000101" else
			"0100000110"when ent="000110" else
			"0000000110"when ent="000111" else
			"1101001101"when ent="001000" else --M
			"1001001101"when ent="001001" else 
			"1101100001"when ent="001010" else --a
			"1001100001"when ent="001011" else 
			"1101101110"when ent="001100" else --n
			"1001101110"when ent="001101" else 
			"1101110101"when ent="001110" else --u
			"1001110101"when ent="001111" else 
			"1101100101"when ent="010000" else --e
			"1001100101"when ent="010001" else 
			"1101101100"when ent="010010" else --l
			"1001101100"when ent="010011" else 
			"1100100000"when ent="010100" else --espacio
			"1000100000"when ent="010101" else 
			"1101000001"when ent="010110" else --A
			"1001000001"when ent="010111" else 
			"1101101100"when ent="011000" else --l
			"1001101100"when ent="011001" else 
			"1101100100"when ent="011010" else --d
			"1001100100"when ent="011011" else 
			"1101100001"when ent="011100" else --a
			"1001100001"when ent="011101" else 
			"1101101001"when ent="011110" else --i
			"1001101001"when ent="011111" else 
			"1101110010"when ent="100000" else --r
			"1001110010"when ent="100001" else 
			"0111000000"when ent="100010" else --salto
			"0011000000"when ent="100011" else 
			"1101001101"when ent="100100" else --M
			"1001001101"when ent="100101" else 
			"1101101111"when ent="100110" else --o
			"1001101111"when ent="100111" else 
			"1101110010"when ent="101000" else --r
			"1001110010"when ent="101001" else 
			"1101100101"when ent="101010" else --e
			"1001100101"when ent="101011" else 
			"1101101110"when ent="101100" else --n
			"1001101110"when ent="101101" else 
			"1101101111"when ent="101110" else --o
			"1001101111"when ent="101111" else 
			"1100100000"when ent="110000" else --espacio
			"1000100000"when ent="110001" else 
			"1101001010"when ent="110010" else --J
			"1001001010"when ent="110011" else 
			"1101110101"when ent="110100" else --u
			"1001110101"when ent="110101" else 
			"1101110010"when ent="110110" else --r
			"1001110010"when ent="110111" else 
			"1101100001"when ent="111000" else --a
			"1001100001"when ent="111001" else 
			"1101100100"when ent="111010" else --d
			"1001100100"when ent="111011" else 
			"1101101111"when ent="111100" else --o
			"1001101111"when ent="111101" else 
			"0100000001"when ent="111110" else --limpiar
			"0000000001"when ent="111110" else 
			"0000000000";
	end memoria;