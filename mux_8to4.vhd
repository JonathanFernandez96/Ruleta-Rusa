library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_8to4 is
    Port ( SEL_Deco : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (4 downto 0);
           B   : in  STD_LOGIC_VECTOR (4 downto 0);
           X   : out STD_LOGIC_VECTOR (4 downto 0));
end mux_8to4;

architecture Behavioral of mux_8to4 is
begin
    X <= A when (SEL_Deco = '1') else B;
end Behavioral;