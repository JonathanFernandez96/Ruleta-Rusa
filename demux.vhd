library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

Entity demux is 
		Port ( Ent: in STD_LOGIC_VECTOR(3 downto 0);
		Salida : OUT STD_LOGIC_VECTOR(7 downto 0));
end demux;

Architecture sol of demux is 
Begin 
	with Ent Select 
	salida <= "00000001" when "0000",
			    "00000010" when "0001",
				 "00000100" when "0010",
				 "00001000" when "0011",
				 "00010000" when "0100",
				 "00100000" when "0101",
				 "01000000" when "0110",
				 "10000000" when others;
end sol;