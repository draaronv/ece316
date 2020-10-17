library ieee;
use ieee.std_logic_1164.all;
entity reg8bit is
    port(input: in std_logic_vector(7 downto 0);
    clock:in std_logic;
    load:in std_logic;
    output:out std_logic_vector(7 downto 0));
end reg8bit;

Architecture behav of reg8bit is
Signal storage : std_logic_vector(7 downto 0);
begin
process(input, load, clock)
    begin
    if (clock'event and clock = '1' and load = '1') then
        storage <= input;
    elsif (clock'event and clock = '0') then
        output <= storage;
    end if;
end process;
end behav;