LIBRARY IEEE;
USE  IEEE.STD_LOGIC_1164.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY contador_5seg IS
	PORT(clock,enable,reset : IN STD_LOGIC;
		 cnco_seg : OUT STD_LOGIC;
		 Q : Buffer STD_LOGIC_VECTOR (2 downto 0));
END contador_5seg;

ARCHITECTURE sol OF contador_5seg IS
BEGIN

	PROCESS(clock,reset)
	BEGIN
		if reset='0' then Q<="000";cnco_seg<='0';
  		elsif (clock'event and clock='1') then
			if enable='1' then
				if (Q="101") then Q<="000";cnco_seg<='1';
				else Q<=Q+1;cnco_seg<='0';
				end if;
			end if;
		end if;
	END PROCESS;
END sol;