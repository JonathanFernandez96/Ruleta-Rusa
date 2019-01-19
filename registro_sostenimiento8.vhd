LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY registro_sostenimiento8 IS
	PORT(clock,reset,enable: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(7 downto 0);
		 Q8 : OUT STD_LOGIC_VECTOR (7 downto 0));
END registro_sostenimiento8;

ARCHITECTURE sol OF registro_sostenimiento8 IS
SIGNAL temp: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp<="00000000";
		elsif (clock'event and clock='1') then
			if(enable='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	Q8<=temp;
END sol;
