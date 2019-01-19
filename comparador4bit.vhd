library ieee;
use IEEE.std_logic_1164.all;

entity comparador4bit is
	port(A: in std_logic_vector(3 downto 0);
		  mayor, menor, igual: out std_logic);  --declaración variables de salida

END comparador4bit;

architecture situacion of comparador4bit is
begin

mayor <= '1' when (A>"1010")else '0'; --A > B, salida mayor a 1, resto a 0
menor <= '1' when (A<"1010")else '0'; --A<B, salida menor a 1, resto a 0 
igual <= '1' when (A="1010")else '0'; --A=B, salida igual a 1, resto a 0
END situacion;
