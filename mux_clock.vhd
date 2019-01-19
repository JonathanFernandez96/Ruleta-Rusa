library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_clock is
    Port ( 	clock_100Hz :in  STD_LOGIC;
				clock_6Hz : in  STD_LOGIC;
				clock_4Hz : in  STD_LOGIC;
				clock_2Hz : in  STD_LOGIC;
				clock_1Hz : in  STD_LOGIC;
				f_cir0: in  STD_LOGIC;
				f_cir1: in std_logic; 
				f_cir2: in std_logic; 
				clock: out STD_LOGIC );
end mux_clock;

architecture Behavioral of mux_clock is
 begin
 process (clock_100HZ, clock_6HZ, clock_4HZ, clock_2HZ, clock_1Hz, f_cir0, f_cir1, f_cir2) is 
 begin 
	if ( f_cir2 = '0' and f_cir1= '0' and f_cir0= '1') then 
			clock <= clock_6HZ; 
	elsif ( f_cir2 = '0' and f_cir1= '1' and f_cir0= '0') then 
			clock <= clock_4HZ; 
	elsif ( f_cir2 = '0' and f_cir1= '1' and f_cir0= '1') then 
			clock <= clock_2HZ; 
	elsif ( f_cir2 = '1' and f_cir1= '0' and f_cir0= '0') then 
			clock <= clock_1HZ;
	else clock <= clock_100HZ;
	end if;
 end process; 
end Behavioral;