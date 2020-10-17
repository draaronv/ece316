Library ieee;
Use ieee.STD_LOGIC_1164.all;
use ieee.std_logic_signed.all;

entity traffic_lights_top is
	port(
		original_clk : in std_logic;
		btn: in std_logic;
		led: out std_logic_vector(7 downto 0)
		);
end traffic_lights_top;

architecture behav of traffic_lights_top is
	component clkdiv
		port(
			original_clk:in std_logic;
        	clr:in std_logic;
       	 	after_division_clk:out std_logic
			);
	end component;

	component traffic_controller
		port(
			after_division_clk: in std_logic;
        	clr:in std_logic;
        	lights:out std_logic_vector(7 downto 0)
			);
	end component;
	signal tik: std_logic;
	begin
		clock1:clkdiv port map(original_clk,btn,tik);
		traf1: traffic_controller port map(tik,btn,led);
	end behav;


