library ieee;
use ieee.std_logic_1164.all;
entity FullAdder is
port(x:in std_logic;
y:in std_logic;
cin:in std_logic;
sum:out std_logic;
cout:out std_logic);
end FullAdder;

architecture behavior of FullAdder is
begin
sum <=x xor y xor cin;
cout <=(x and y) or ((x xor y) and cin);
end;