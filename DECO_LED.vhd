library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity DECO_LED is 
		Port ( Ent: in STD_LOGIC_VECTOR( 2 downto 0);
		EnLEDS: in std_logic;
		Salida : OUT STD_LOGIC_VECTOR(7 downto 0));
end DECO_LED;

Architecture sol of DECO_LED is 

signal Q: std_logic_vector(7 downto 0);
Begin 
	with Ent Select 
	Q<= "00000001" when "000",
		 "00000010" when "001",
 		 "00000100" when "010",
		 "00001000" when "011",
		 "00010000" when "100",
		 "00100000" when "101",
		 "01000000" when "110",
		 "10000000" when others;
	Salida<= Q when EnLEDS='1' else "00000000";
end sol;