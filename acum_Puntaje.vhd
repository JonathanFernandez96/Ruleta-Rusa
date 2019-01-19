LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY acum_Puntaje IS
PORT ( Clock, Resetn, en_puntaje, ganar,perder: IN STD_LOGIC;
nivel: in std_logic_vector(1 downto 0);
Q : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)) ;
END acum_Puntaje ;

ARCHITECTURE Behavior OF acum_Puntaje IS
	SIGNAL Count : STD_LOGIC_VECTOR(4 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, Resetn )
	BEGIN
	IF Resetn = '0' THEN
	count <= "00000" ;
	ELSIF (Clock'EVENT AND Clock = '1') THEN
		if en_puntaje = '1' then
			IF perder = '1'  then
				IF count /= 0 THEN
					count <= count - 1;
				ELSE
					count <= "00000";
				END IF; 
			ELSIF ganar= '1'  THEN 
				IF count /= 31 THEN
					if nivel= "11" then
						count <= count + 5;
					else 
						count <= count +3;
					end if;
				else count <= "11111";
				End if; 
			END IF;
		else count <= count; 
		END IF;
	else count<= count;
	END IF ;
	END PROCESS;
	Q <= Count;
END Behavior;