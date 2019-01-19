LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

entity comp_nivel is
port(niv_ac: in std_logic_vector( 1 downto 0);
niv_1, niv_2, niv_3: out std_logic);  --declaración variables de salida
 
END comp_nivel;
 
architecture situacion of comp_nivel is
begin
niv_1 <= '1' when (niv_ac="01")else '0'; 
niv_2 <= '1' when (niv_ac="10")else '0';  
niv_3 <= '1' when (niv_ac="11")else '0'; 

END situacion;