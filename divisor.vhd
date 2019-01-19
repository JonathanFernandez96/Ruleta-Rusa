LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY divisor IS
    PORT
    (  CLOCK_50MHz    :IN   STD_LOGIC;
       CLOCK_1MHz     :OUT  STD_LOGIC;
       CLOCK_100KHz   :OUT  STD_LOGIC;
       CLOCK_10KHz    :OUT  STD_LOGIC;
       CLOCK_1KHz     :OUT  STD_LOGIC;
       CLOCK_100Hz    :OUT  STD_LOGIC;
       CLOCK_10Hz     :OUT  STD_LOGIC;
		 CLOCK_6Hz      :OUT  STD_LOGIC;
       CLOCK_4Hz      :OUT  STD_LOGIC;
		 CLOCK_2Hz      :OUT  STD_LOGIC;
       CLOCK_1Hz      :OUT  STD_LOGIC;
		 CLOCK_05Hz     :OUT  STD_LOGIC);
END divisor;

ARCHITECTURE a OF divisor IS
    SIGNAL   count_1Mhz, count_05hz: STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL   count_2hz: STD_LOGIC_VECTOR(5 DOWNTO 0);
	 SIGNAL   count_4hz: STD_LOGIC_VECTOR(4 DOWNTO 0);
	 SIGNAL   count_6hz: STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL   count_100Khz, count_10Khz, count_1Khz: STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL   count_100hz, count_10hz, count_1hz: STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL   clock_1Mhz_int, clock_100Khz_int, clock_10Khz_int, clock_1Khz_int: STD_LOGIC;
    SIGNAL   clock_100hz_int, clock_10hz_int, clock_1hz_int, clock_2hz_int, clock_4hz_int, clock_6hz_int, clock_05hz_int: STD_LOGIC;

BEGIN
    PROCESS
    BEGIN
-- Divide by 50
       WAIT UNTIL clock_50Mhz'EVENT and clock_50Mhz = '1';  -- 24 Mhz
          IF count_1Mhz < 49 THEN
             count_1Mhz <= count_1Mhz + 1;
          ELSE
             count_1Mhz <= "000000";
          END IF;
          IF count_1Mhz < 4 THEN
             clock_1Mhz_int <= '0';
          ELSE
             clock_1Mhz_int <= '1';
          END IF;
       -- Ripple clocks are used in this code to save prescalar hardware
       -- Sync all clock prescalar outputs back to master clock signal
          clock_1Mhz <= clock_1Mhz_int;
          clock_100Khz <= clock_100Khz_int;
          clock_10Khz <= clock_10Khz_int;
          clock_1Khz <= clock_1Khz_int;
          clock_100hz <= clock_100hz_int;
          clock_10hz <= clock_10hz_int;
          clock_1hz <= clock_1hz_int;
			 clock_2hz <= clock_2hz_int;
			 clock_4hz <= clock_4hz_int;
			 clock_6hz <= clock_6hz_int;
			 CLOCK_05Hz <= clock_05hz_int;
       END PROCESS;
          -- Divide by 10
       PROCESS
       BEGIN
          WAIT UNTIL clock_1Mhz_int'EVENT and clock_1Mhz_int = '1';
             IF count_100Khz /= 4 THEN
                count_100Khz <= count_100Khz + 1;
             ELSE
                count_100Khz <= "000";
                clock_100Khz_int <= NOT clock_100Khz_int;
             END IF;
       END PROCESS;
          -- Divide by 10
       PROCESS
       BEGIN
          WAIT UNTIL clock_100Khz_int'EVENT and clock_100Khz_int = '1';
             IF count_10Khz /= 4 THEN
                count_10Khz <= count_10Khz + 1;
             ELSE
                count_10Khz <= "000";
                clock_10Khz_int <= NOT clock_10Khz_int;
             END IF;
       END PROCESS;
          -- Divide by 10
       PROCESS
       BEGIN
          WAIT UNTIL clock_10Khz_int'EVENT and clock_10Khz_int = '1';
             IF count_1Khz /= 4 THEN
                count_1Khz <= count_1Khz + 1;
             ELSE
                count_1Khz <= "000";
                clock_1Khz_int <= NOT clock_1Khz_int;
             END IF;
       END PROCESS;
          -- Divide by 10
       PROCESS
       BEGIN
          WAIT UNTIL clock_1Khz_int'EVENT and clock_1Khz_int = '1';
             IF count_100hz /= 4 THEN
                count_100hz <= count_100hz + 1;
             ELSE
                count_100hz <= "000";
                clock_100hz_int <= NOT clock_100hz_int;
             END IF;
       END PROCESS;
          -- Divide by 10
       PROCESS
       BEGIN
          WAIT UNTIL clock_100hz_int'EVENT and clock_100hz_int = '1';
             
				 IF count_10hz /= 4 THEN
                count_10hz <= count_10hz + 1;
             ELSE
                count_10hz <= "000";
                clock_10hz_int <= NOT clock_10hz_int;
             END IF;
				  
				 -- 2Hz 
				  IF count_2hz < 50 THEN
					 count_2hz <= count_2hz + 1;
				 ELSE
				 	 count_2hz <= "000000";
				 END IF;
				 IF count_2hz < 4 THEN
				 	 clock_2hz_int <= '0';
				 ELSE
					 clock_2hz_int <= '1';
				 END IF;
				 
				 -- 4Hz 
				  IF count_4hz < 25 THEN
					 count_4hz <= count_4hz + 1;
				 ELSE
				 	 count_4hz <= "00000";
				 END IF;
				 IF count_4hz < 4 THEN
				 	 clock_4hz_int <= '0';
				 ELSE
					 clock_4hz_int <= '1';
				 END IF;
				 
				 -- 6Hz
				  IF count_6hz < 16 THEN
					 count_6hz <= count_6hz + 1;
				 ELSE
				 	 count_6hz <= "00000";
				 END IF;
				 IF count_6hz < 4 THEN
				 	 clock_6hz_int <= '0';
				 ELSE
					 clock_6hz_int <= '1';
				 END IF; 
				  
       END PROCESS;
          -- Divide by 10
       PROCESS
       BEGIN
          WAIT UNTIL clock_10hz_int'EVENT and clock_10hz_int = '1';
             IF count_1hz /= 4 THEN
                count_1hz <= count_1hz + 1;
             ELSE
                count_1hz <= "000";
                clock_1hz_int <= NOT clock_1hz_int;
             END IF;
				 
				 IF count_05hz < 49 THEN
					 count_05hz <= count_05hz + 1;
				 ELSE
				 	 count_05hz <= "000000";
				 END IF;
				 IF count_05hz < 4 THEN
				 	 clock_05hz_int <= '0';
				 ELSE
					 clock_05hz_int <= '1';
				 END IF;
       END PROCESS;
		 
END a;
