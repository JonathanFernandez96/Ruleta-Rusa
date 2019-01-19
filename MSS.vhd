library ieee;
use ieee.std_logic_1164.all;

Entity MSS is
PORT (Clock, tres_segundos, Resetn, seleccion, jugar, start, izqu,dere, pfin: IN STD_LOGIC;
		cinco_segundos, puntaje, niv_1, niv_2, niv_3, gana, Fin_Puntaje: in std_logic; 
	   izq, der,en_gpos, en_pinicial, en_pfinal, en_pactual, ld, sel,E, en_niv,en_dec14, en_led : OUT STD_LOGIC;
		fcir0, fcir1, fcir2, en_puntaje, led_verde, led_rojo, gano, perdio, aum, dism, reset_cajas: OUT STD_LOGIC;
		wRam, enRam, en3S, en3seg, en5seg, selDeco, RstCont : OUT std_logic;
		estados: out std_logic_Vector(5 downto 0));
	
	end MSS;

Architecture sol of MSS is
type estado is (a,ar,b,br,c,d,dr,f,fr,g,gr,h,i,j,k,l,m,n,o,p,q,r,s,t,l2,l3,m2,n2,o2,p2,q2,r2,s2, t2, m3,n3,o3,p3,q3,r3,s3,t3,pnta);
signal y: estado;


Begin
process(Clock,Resetn)
	begin
	if Resetn='0' then y<=a;
	elsif clock'event and clock='1' then
    case y is 
		when a =>
			if start='1' then y<=ar;
			else y<=a;end if;
		
		when ar=>
			if start='0' then y<=b;
			else y<=ar;end if; 
		
		when b=>
			if jugar='1' then y<=br;
			elsif puntaje='1' then y<=pnta;
			else y<=b; end if;
			
		when br=>
			if jugar='0' then y<=c;
			else y<=br; end if;
		
		when c=>
			if izqu='1' then y<=d;
			elsif dere='1' then y<=f;
			elsif seleccion='1' then y<=g;
			else y<=c; end if;
		
		when dr=>
			if izqu='0' then y<=d;
			else y<=dr; end if;
			
		when fr=>
			if dere='0' then y<=f;
			else y<=fr; end if;
			
		when gr=>
			if seleccion='0' then y<=g;
			else y<=gr; end if;
		
		when d=>	y<=c;
		
		when f=>	y<=c;
		
		when g=>
			if pfin='0' then y<=h;
			else y<=i; end if;
		
		when h=> y<=c;
		
		when i=> y<=j;
			
		when j=> y<=k;
			
		when k=>
			if jugar='0' then y<=k;
			elsif jugar='1' and niv_1= '1' then y<= l;
			elsif jugar='1' and niv_2='1'  then y<= l2;
			elsif jugar='1' and niv_3='1'  then y<= l3;
			end if;
			
		when l=>
			if jugar='0' then y<=m;
			else y<=l; end if;
		
		when l2=>
			if jugar='0' then y<=m2;
			else y<=l2; end if;
			
		when l3=>
			if jugar='0' then y<=m3;
			else y<=l3; end if;
			
		when m=>
			if tres_segundos='0' then y<=m;
			else y<=n; end if;
		
		when m2=>
			if tres_segundos='0' then y<=m2;
			else y<=n2; end if;
			
		when m3=>
			if tres_segundos='0' then y<=m3;
			else y<=n3; end if;
			
		when n=> 
			if gana='0' then y<=r;
			else y<=o; end if;
		
		when n2=> 
			if gana='0' then y<=r2;
			else y<=o2; end if;
		
		when n3=> 
			if gana='0' then y<=r3;
			else y<=o3; end if;
		
		when o=> y<=p;
	
		when o2=> y<=p2;
			
		when o3=> y<=p3;
		
		when p=>
			if tres_segundos='0' then y<=p;
			else y<=q; end if;
		
		when p2=>
			if tres_segundos='0' then y<=p2;
			else y<=q2; end if;
		
		when p3=>
			if tres_segundos='0' then y<=p3;
			else y<=q3; end if;
		
		when q=> y<=c;
			
		when q2=> y<=c;
			
		when q3=> y<=b;-- Almacenar en la RAM 
			
		when r => y<= s;
				
		when r2 => y<= s2;
				
		when r3 => y<= s3;
		
		when s =>
			if cinco_segundos='0' then y<=s; 
			else y<= t; end if;
			
		when s2 => 
			if cinco_segundos='0' then y<=s2; 
			else y<= t2; end if;
			
		when s3 => 
			if cinco_segundos='0' then y<=s3; 
			else y<= t3; end if;
		
		when t => y<= b; --Almacenar en la RAM
		
		when t2 => y<= c;
		
		when t3 =>  y<= c;
			
		when pnta => 
			if Fin_Puntaje ='1' then y<=b;else y<=pnta;end if;
			
		end case;
	 end if;
end process;


	
process (y,pfin)


begin
	izq<='0';der<='0';en_gpos<='0';en_pinicial<='0';en_pfinal<='0';en_pactual<='0';ld <='0';sel<='0';
	E<='0';en_niv<='0';en_dec14<='0';en_led<='0';fcir0<='0';fcir1<='0';fcir2<='0';en_puntaje<='0';led_verde<='0';
	led_rojo<='0';gano<='0';perdio<='0';aum<='0';dism<='0';reset_cajas<='0';wRam<='0';enRam<='0';en3S<='0';
	en3seg<='0';en5seg<='0';selDeco<='0';RstCont<='0'; 
	estados<="000000";
case y is
	
	when a=> en_pactual <= '1'; en_led <= '1'; reset_cajas <='1'; estados<="000001";
	when ar=> en_pactual <= '1'; en_led <= '1'; reset_cajas <='1';estados<="000010" ;
	when b=> en_pactual <= '1'; en_led <= '1'; RstCont<='1';reset_cajas <='1'; estados<="000011";
	when br=> en_pactual <= '1'; en_led <= '1'; estados<="000100";
	when c=> estados<="000101";
	when d=> izq<='1'; estados<="000110";
	when dr=>  estados<="000111";
	when f=> der<='1'; estados<="001000";
	when fr=> estados<="001001";
	when g=> en_gpos<='1';estados<="001010";
	when gr=> estados<="001011";
	when h=> en_pinicial<= '1'; estados<="001100";
	when i=> en_pfinal <= '1'; estados<="001101";
	when j=>	ld<='1'; sel<='1'; estados<="001110";
	when k=> sel<='1'; estados<="001111";
	when l=> E<='1'; sel<='1'; fcir1<='1'; fcir0<='1'; estados<="010000";
	when m=> E<='1'; sel<='1'; fcir2<='1'; en3seg<='1'; estados<="010001";
	when n=> sel<='1'; estados<="010010";
	when o=> en_puntaje<='1'; gano<='1'; sel<='1'; estados<="010011";
	when p=> sel<='1'; led_verde<='1';  en_dec14<='1'; en3seg<='1';estados<="010100"; 
	when q=> sel<='1'; aum<='1'; en_niv<='1'; estados<="010101";
	when r=> sel<='1'; en_puntaje<='1'; perdio<='1'; estados<="010110";
	when s=> sel<='1'; led_rojo<='1'; en_dec14<='1'; en5seg<='1'; estados<="010111";
	when t=> wRam<='1'; estados<="011000";-- ALMACENAR RAM 
	when l2=> E<='1'; sel<='1'; fcir1<='1';estados<="011001";
	when m2=> E<='1'; sel<='1'; fcir2<='1';en3seg<='1'; estados<="011010";
	when n2=> sel<='1'; estados<="011011";
	when o2=> en_puntaje<='1'; gano<='1'; sel<='1';estados<="011100";
	when p2=> sel<='1'; led_verde<='1';  en_dec14<='1'; en3seg<='1';estados<="011101"; 
	when q2=> sel<='1'; aum<='1'; en_niv<='1'; estados<="011110";
	when r2=> sel<='1'; en_puntaje<='1'; perdio<='1';estados<="011111";
	when s2=> sel<='1'; led_rojo<='1'; en_dec14<='1'; en5seg<='1'; estados<="100000";
	when t2=> sel<='1'; dism<='1'; en_niv<='1';estados<="100001";
	when l3=> E<='1'; sel<='1'; fcir0<='1';estados<="100010";
	when m3=> E<='1'; sel<='1'; fcir2<='1'; en3seg<='1'; estados<="100011";
	when n3=> sel<='1'; estados<="100100";
	when o3=> en_puntaje<='1'; gano<='1'; sel<='1';estados<="100101";
	when p3=> sel<='1'; led_verde<='1'; en_dec14<='1'; en3seg<='1';estados<="100110"; 
	when q3=> wRam<='1'; estados<="100111"; -- ALMACENAR RAM
	when r3=> sel<='1'; en_puntaje<='1'; perdio<='1';estados<="101000";
	when pnta => en3S<='1'; en_dec14<='1';enRam<='1';seldeco<='1';estados<="101001";
	when s3=> sel<='1'; led_rojo<='1'; en_dec14<='1'; en5seg<='1'; estados<="101010";
	when t3=> sel<='1'; dism<='1'; en_niv<='1';estados<="101011";
	end case;
end process;					
				
end sol;