LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

entity comp_3bits is
port(POSA,POSF: in std_logic_vector( 2 downto 0);
mayor, menor, gana: out std_logic);  --declaración variables de salida
 
END comp_3bits;
 
architecture situacion of comp_3bits is
begin
mayor <= '1' when (POSA>POSF)else '0'; --A > B, salida mayor a 1, resto a 0
menor <= '1' when (POSA<POSF)else '0'; --A<B, salida menor a 1, resto a 0 
gana <= '1' when (POSA=POSF)else '0'; --A=B, salida igual a 1, resto a 0

END situacion;