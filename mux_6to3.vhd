library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_6to3 is
    Port ( SEL : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (2 downto 0);
           B   : in  STD_LOGIC_VECTOR (2 downto 0);
           X   : out STD_LOGIC_VECTOR (2 downto 0));
end mux_6to3;

architecture Behavioral of mux_6to3 is
begin
    X <= A when (SEL = '1') else B;
end Behavioral;