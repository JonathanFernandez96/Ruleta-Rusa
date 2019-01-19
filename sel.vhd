LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY sel IS
PORT (
		en_gpos, reset, Clock :IN std_logic ;
		p_fin : OUT STD_LOGIC );
END sel ;

ARCHITECTURE solution OF sel IS
	SIGNAL acum : STD_LOGIC_VECTOR (1 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, reset )
	BEGIN
	IF reset = '0' THEN 
	acum <= "00";
	ELSIF (Clock'EVENT AND Clock = '1') THEN
		IF en_gpos= '1'then
			IF acum /= 2 THEN
				acum <= acum + 1;
			ELSE
				acum <= "01";
			end if;
		else acum <= acum;
		end if; 
	end if;  
		if acum="01" then 
		p_fin <= '0';
	elsif acum="10" then
		p_fin <= '1'; 
	end if;
	END PROCESS;
END solution;