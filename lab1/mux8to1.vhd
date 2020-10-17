library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux_2to1_top is
 Port ( 
SEL0:in STD_LOGIC;
SEL1:in STD_LOGIC;
SEL2:in STD_LOGIC;
A:in STD_LOGIC_VECTOR (3 downto 0);
B:in STD_LOGIC_VECTOR (3 downto 0);
C:in STD_LOGIC_VECTOR(3 downto 0);
D:in STD_LOGIC_VECTOR(3 downto 0);
E:in STD_LOGIC_VECTOR(3 downto 0);
F:in STD_LOGIC_VECTOR(3 downto 0);
G:in STD_LOGIC_VECTOR(3 downto 0);
H:in STD_LOGIC_VECTOR(3 downto 0);

 X : out STD_LOGIC_VECTOR (3 downto 0));
end mux_2to1_top;

architecture Behavioral of mux_2to1_top is
begin
process(SEL0,SEL1,SEL2,A,B,C,D,E,F,G,H)
begin
if(SEL2='0' AND SEL1='0' AND SEL0='1')then
	X <= A;
elsif(SEL2='0' AND SEL1='1' AND SEL0='0')THEN
	x <=B;
elsif(SEL2='0' AND SEL1='1' AND SEL0='1')THEN
	x <=C;
elsif(SEL2='1' AND SEL1='0' AND SEL0='0')THEN
	x <=D;
elsif(SEL2='1' AND SEL1='0' AND SEL0='1')THEN
	x <=E;
elsif(SEL2='1' AND SEL1='1' AND SEL0='0')THEN
	x <=F;
elsif(SEL2='1' AND SEL1='1' AND SEL0='1')THEN
	x <=G;
else
	x <=H;
end if;
end process;
end Behavioral;
