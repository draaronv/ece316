library ieee;
use ieee.std_logic_1164.all;
Entity Adder4 is
port (A, B : in std_logic_vector (3 downto 0);
Cin : in std_logic;
S : out std_logic_vector (3 downto 0);
Cout : out std_logic);
End Adder4;

Architecture struct of Adder4 is
Component FullAdder
port (X, Y, Cin : in std_logic;
Cout, Sum : out std_logic);
End component;

Signal C : std_logic_vector(4 downto 1);
Begin
FA0 : FullAdder port map (A(0), B(0), Cin, C(1), S(0));
FA1 : FullAdder port map (A(1), B(1), C(1), C(2), S(1));
FA2 : FullAdder port map (A(2), B(2),C(2), C(3), S(2));
FA3 : FullAdder port map (A(3), B(3), C(3), C(4), S(3));
cout<=c(4);

End struct;