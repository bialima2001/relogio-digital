library ieee;
use ieee.std_logic_1164.all;

entity pulse is
	port(
		clk : in std_logic;
		pulse_in	: in std_logic;
		pulse_out: out std_logic
	);
end entity;

architecture arch of pulse is
begin

process(clk)
	variable counter : integer := 0;
begin
	if(pulse_in = '1') then 
		counter := 0;
		pulse_out <= '1';
	elsif(falling_edge(clk)) then - -borda de descida
		counter := counter +1;
		if(counter = 2) then
			pulse_out <= '0';
			counter := 0;
		end if;
	end if;
end process;


end arch;
