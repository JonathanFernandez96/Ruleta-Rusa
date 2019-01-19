LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY registro_leds IS
	PORT(clock,reset,en_leds: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(7 downto 0);
		 leds : OUT STD_LOGIC_VECTOR (7 downto 0));
END registro_leds;

ARCHITECTURE sol OF registro_leds IS
SIGNAL temp: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp<="00000000";
		elsif (clock'event and clock='1') then
			if(en_leds='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	leds<=temp;
END sol;