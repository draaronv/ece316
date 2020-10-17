library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity overcheck is
    port(x:in std_logic_vector(7 downto 0);
        y:in std_logic_vector(7 downto 0);
        opcode: in std_logic_vector(3 downto 0);
        result:in std_logic_vector(7 downto 0);
        overf:out std_logic);
end entity;

architecture behav of overcheck is
    begin
        check:process(x,y,result,opcode)
            begin
                if( (opcode="0001" or opcode="0011" or opcode="1000" or opcode="1001") and ( x(7)=y(7)  ) and ( result(7)/=x(7)  ) and (result(7)/=y(7))  ) then 
                overf<='1';
                else overf<='0';
            end if;
        end process;
end behav;