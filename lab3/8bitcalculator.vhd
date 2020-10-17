library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
Entity calc8bit is
Port(input : in std_logic_vector(7 downto 0);
	clock: in std_logic;
	load: in std_logic_vector(1 downto 0);
	opcode: in std_logic_vector(3 downto 0);
	result: out std_logic_vector(7 downto 0);
	overflow: out std_logic);
end calc8bit;

Architecture arch8 of calc8bit is
	component reg8bit
		port(input: in std_logic_vector(7 downto 0);
		clock:in std_logic;
		load:in std_logic;
		output:out std_logic_vector(7 downto 0));
	end component;

	component calcprocessing
		port(x:in std_logic_vector(7 downto 0);
			y:in std_logic_vector(7 downto 0);
			opcode: in std_logic_vector(3 downto 0);
			result:out std_logic_vector(7 downto 0));
	end component;
	
	component overcheck
		port(x:in std_logic_vector(7 downto 0);
			y:in std_logic_vector(7 downto 0);
			opcode: in std_logic_vector(3 downto 0);
			result:in std_logic_vector(7 downto 0);
			overf:out std_logic);
	end component;

	signal r0:std_logic_vector(7 downto 0);
	signal r1:std_logic_vector(7 downto 0);
	signal r2:std_logic_vector(7 downto 0);
	begin 
	registe0: reg8bit port map(input,clock,load(0),r0);
	registe1: reg8bit port map(input, clock, load(1),r1);
	calc: calcprocessing port map(r0,r1,opcode,r2);
	result<=r2;
	over1: overcheck port map(r0,r1,opcode,r2,overflow);
end arch8;
