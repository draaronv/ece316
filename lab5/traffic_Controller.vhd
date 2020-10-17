Library ieee;
Use ieee.STD_LOGIC_1164.all;
use IEEE.numeric_std.ALL;

entity traffic_controller is
    port(
        after_division_clk: in std_logic;
        clr:in std_logic;
        lights:out std_logic_vector(7 downto 0)
    );
end traffic_controller;

architecture behav of traffic_controller is
    signal count: integer:=1;
    signal state: integer:=0;
    begin
        c1:process(after_division_clk,clr)
        begin
            if(clr='1') then
                count<=0;
            elsif(after_division_clk'event and after_division_clk='1') then
                count <=count+1;
            if (count <= 5) then
                state <= 0;
            elsif(count=6) then
                state <=1;
            elsif(count=7) then
                state <=2;
            elsif((count >= 8) and (count <=13)) then
                state<=3;
            elsif(count=14) then
                state<=4;
            elsif(count=15) then
                state<=5;
                count<=1;
            end if;
            end if;
        end process;
        
        c2:process(state)
                begin
                    if(state=0) then
                        lights<="01011010";
                    elsif(state=1) then
                        lights<="01011111";
                    elsif(state=2) then
                        lights<="01010101";
                    elsif(state=3) then
                        lights<="10100101";
                    elsif(state=4) then
                        lights<="11110101";
                    elsif(state=5) then
                        lights<="01010101";
                end if;
        end process;
end behav;