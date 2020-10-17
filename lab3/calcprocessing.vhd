library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity calcprocessing is
	port(x:in std_logic_vector(7 downto 0);
		y:in std_logic_vector(7 downto 0);
		opcode: in std_logic_vector(3 downto 0);
		result: out std_logic_vector(7 downto 0));
end calcprocessing;

Architecture behav of calcprocessing is
	begin
	calcprocessing:process(x,y,opcode)
		begin 
				if(opcode ="0000") then
					result<=y;
				elsif (opcode="0001") then
					result<=y+1;
				elsif (opcode="0011") then
					result<=y+x;
				elsif (opcode="0100") then
					result<=not y;
				elsif (opcode="0101") then
					result<=-y;
				elsif (opcode="1000") then
					result<=y-x;
				elsif (opcode="1001") then
					result<=y-1;
				elsif (opcode="1011") then
					result<=not x;
				elsif (opcode="1100") then
					result<=x and y;
				elsif (opcode="1101") then
					result<=x or y;
				elsif (opcode="1110") then
					result<=x xor y;
	end if;
	end process;
end behav;