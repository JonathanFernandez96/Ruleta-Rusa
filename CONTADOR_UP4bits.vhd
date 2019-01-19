LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY CONTADOR_UP4bits iS
PORT ( Clock, Resetn, E,ld: IN STD_LOGIC;
inp:IN std_logic_vector(3 downto 0);
Q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)) ;
END CONTADOR_UP4bits ;

ARCHITECTURE Behavior OF CONTADOR_UP4bits IS
	SIGNAL Count : STD_LOGIC_VECTOR(3 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, Resetn )
	BEGIN
	IF Resetn = '0' THEN
	Count <= "0000" ;
	ELSIF (Clock'EVENT AND Clock = '1') THEN
	IF E = '1' and ld='1' then
	Count<=inp;
	elsif E = '1' THEN
		if Count="1011" then
			Count<="0000";
		else Count<= Count +1;
		end if;
	ELSE
	Count <= Count ;
	END IF ;
	END IF ;
	END PROCESS;
	Q <= Count;
END Behavior;