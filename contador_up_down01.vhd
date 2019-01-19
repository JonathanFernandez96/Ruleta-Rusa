LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY contador_up_down01 IS
PORT ( Clock, Resetn, iz,der: IN STD_LOGIC;
pos_res: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)) ;
END contador_up_down01 ;

ARCHITECTURE Behavior OF contador_up_down01 IS
	SIGNAL Count : STD_LOGIC_VECTOR(2 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, Resetn )
	BEGIN
	IF Resetn = '0' THEN
	count <= "000" ;
	ELSIF (Clock'EVENT AND Clock = '1') THEN
		IF iz = '1'  then
			IF count /= 0 THEN
				count <= count - 1;
			ELSE
				count <= "111";
			END IF; 
		ELSIF der= '1'  THEN 
			IF count /= 7 THEN
				count <= count + 1;
			ELSE
				count <= "000";
			END IF;
		Else count<= count;
		END IF;
	else count<= count;
	END IF ;
	END PROCESS;
	pos_res <= Count;
END Behavior;