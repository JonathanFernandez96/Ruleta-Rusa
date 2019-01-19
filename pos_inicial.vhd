LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY pos_inicial IS
	PORT(clock,reset,en_pinicial: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(2 downto 0);
		 P_inicial : OUT STD_LOGIC_VECTOR (2 downto 0));
END pos_inicial;

ARCHITECTURE sol OF pos_inicial IS
SIGNAL temp: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp<="000";
		elsif (clock'event and clock='1') then
			if(en_pinicial='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	p_inicial<=temp;
END sol;