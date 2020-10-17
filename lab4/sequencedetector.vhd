Library ieee;
Use ieee.STD_LOGIC_1164.all;

Entity fsm is
Port ( clk: in STD_LOGIC;
        init: in STD_LOGIC;
        Din: in STD_LOGIC;
        Dout: out STD_LOGIC);
end fsm;

Architecture behav of fsm is
    type state_type is (s0, s1, s2, s3, s4);
    Signal next_state, present_state: state_type;
    begin
        Sreg: process (clk, init)
            begin
                If (init = '1') then
                    present_state <= s0;
                     Elsif (clk'event and clk='1') then
                     Present_state <= next_state;
            end if;
        end process;

        C1: process (present_state, din)
            Begin
                Case present_state is
                    When s0 =>
                            If din = '1' then
                            Next_state <= s1;
                            Else
                            Next_state <= s0;
                            End if;
                    When s1=>
                            If din = '0' then
                            Next_state <= s2;
                            Else
                            Next_state <= s0;
                            End if;
                    When s2 =>
                            If din = '1' then
                            Next_state <= s3;
                            Else
                            Next_state <= s2;
                            End if;
                    When s3 => 
                            If din = '1' then
                            Next_state <= s4;
                            Else
                            Next_state <= s0;
                            end if;
                    When s4 =>
                            If din='0' then
                            Next_state <= s0;
                            Else
                            next_state<= s2;
                            End if;
                    When others =>
                            Null;
                end case;
        end process;
        
        C2: process(present_state)
            Begin
                If present_state = s4 then
                Dout <= '1';
                Else
                Dout <= '0';
            End if;
        End process;  
end behav;