LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE ieee.std_logic_unsigned.all ;

ENTITY nivel IS
PORT ( Clock, Resetn, en_niv,aum,dism: IN STD_LOGIC;
		 nivel_ac : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)) ;
END nivel ;

ARCHITECTURE Behavior OF nivel IS
	SIGNAL v_ac : STD_LOGIC_VECTOR(1 DOWNTO 0) ;
	BEGIN
	PROCESS ( Clock, Resetn )
	BEGIN
		IF Resetn = '0' THEN
		v_ac <= "01" ;
		ELSIF (Clock'EVENT AND Clock = '1') THEN
			if en_niv = '1' and aum = '1' then 
				 if v_ac= "11" then 
				 v_ac <= v_ac; 
				 else v_ac <= v_ac + 1;
			    end if;
			elsif en_niv = '1' and dism = '1' then 
				 if v_ac= "00" then
				 v_ac <= v_ac;
				 else v_ac <= v_ac - 1;
				 end if;
			else 
			v_ac <= v_ac;
			end if;
		else v_ac <= v_ac;
		end if; 
	end process;
	nivel_ac <= v_ac;
end Behavior;
	