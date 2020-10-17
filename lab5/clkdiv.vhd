library ieee;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
  
entity clkdiv is
port (  original_clk,clr: in std_logic;
        after_division_clk: out std_logic);
end clkdiv;
  
architecture bhv of clkdiv is
  
signal count: integer:=1;
signal tmp : std_logic := '0';
begin
process(original_clk,clr)
begin
if(clr='1') then
count<=1;
tmp<='0';
elsif(original_clk'event and original_clk='1') then
count <=count+1;
if (count = 5000) then
tmp <= NOT tmp;
count <= 1;
end if;
end if;
after_division_clk <= tmp;
end process;
end bhv;
