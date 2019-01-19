library ieee;
use ieee.std_logic_1164.all;

Entity dec_14seg is
	Port(	w: in std_logic_vector(4 downto 0);
			en: in std_logic;
			Q: out std_logic_vector(13 downto 0));
end dec_14seg;

Architecture sol of dec_14seg is
Signal F: std_logic_vector(13 downto 0);
SIGNAL ZRS,ONE,TWO,TRE,CUA,CIN,SEI,SIE,OCH,NUE: std_logic_vector(6 downto 0);

Begin
--CATODO COMUN (ENCIENDEN CUANDO SE LEs ENVIA UN 0)
ZRS<="1000000"; --0
ONE<="1111001"; --1
TWO<="0100100"; --2
TRE<="0110000"; --3
CUA<="0011001"; --4 
CIN<="0010010"; --5
SEI<="0000010"; --6
SIE<="1111000"; --7
OCH<="0000000"; --8
NUE<="0011000"; --9

	With w select
		F<=	   
		   ZRS & ONE when "00001", --01 
			ZRS & TWO when "00010", --02
			ZRS & TRE when "00011", --03
			ZRS & CUA when "00100", --04 
			ZRS & TRE when "00101", --05
			ZRS & CIN when "00110", --06
			ZRS & SEI when "00111", --07
			ZRS & SIE when "01000", --08
			ZRS & OCH when "01001", --09
			
			ONE & ZRS when "01010", --10 
			ONE & ONE when "01011", --11
			ONE & TWO when "01100", --12
			ONE & TRE when "01101", --13
			ONE & CUA when "01110", --14
			ONE & CIN when "01111", --15
			ONE & SEI when "10000", --16
			ONE & SIE when "10001", --17
			ONE & OCH when "10010", --18
			ONE & NUE when "10011", --19
			
			TWO & ZRS when "10100", --20 
			TWO & ONE when "10101", --21
			TWO & TWO when "10110", --22
			TWO & TRE when "10111", --23
			TWO & CUA when "11000", --24
			TWO & CIN when "11001", --25
			TWO & SEI when "11010", --26
			TWO & SIE when "11011", --27
			TWO & OCH when "11100", --28
			TWO & NUE when "11101", --29
			
			TRE & ZRS when "11110", --30 
			TRE & ONE when "11111", --31
						
			ZRS & ZRS when "00000"; --00  
			
	Q<=F when en ='1' else "11111111111111"; --apagado
end sol;