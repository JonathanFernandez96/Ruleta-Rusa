LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY pos_final IS
	PORT(clock,reset,en_pfinal: IN STD_LOGIC;
		 Ent : IN STD_LOGIC_VECTOR(2 downto 0);
		 P_final : OUT STD_LOGIC_VECTOR (2 downto 0));
END pos_final;

ARCHITECTURE sol OF pos_final IS
SIGNAL temp: STD_LOGIC_VECTOR(2 downto 0);
BEGIN
	PROCESS(clock,reset)
	BEGIN
		if reset='0' then temp<="000";
		elsif (clock'event and clock='1') then
			if(en_pfinal='1') then 
				temp<=Ent;
			end if;
		end if;
	end process;
	p_final<=temp;
END sol;