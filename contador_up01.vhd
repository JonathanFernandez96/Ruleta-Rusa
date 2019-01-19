LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY contador_up01 IS
PORT ( Clock, Resetn, E,ld: IN STD_LOGIC;
	posinicial : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	val_res_1 : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)) ;
END contador_up01 ;

ARCHITECTURE Behavior OF contador_up01 IS
	SIGNAL Count : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, Resetn )
	BEGIN
	IF Resetn = '0' THEN
	count <= "000" ;
	ELSIF (Clock'EVENT AND Clock = '1') THEN
		IF E = '1' then
			IF count /= 7 THEN
				count <= count + 1;
			ELSE
				count <= "000";
			END IF; 
		ELSIF ld= '1' THEN 
			count <= posinicial;
		ELSE 
			count <= count;
		END IF;
	END IF ;
	END PROCESS;
	val_res_1 <= Count;
END Behavior;