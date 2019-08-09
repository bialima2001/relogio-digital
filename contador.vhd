library IEEE;
use IEEE.std_logic_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity contador is

	port(
	bcd	: out std_logic_vector(3 downto 0);
	clk	: in std_logic;
	reset	: in std_logic
	);
end;


architecture arq of contador is
	signal inicio	: std_logic_vector(3 downto 0) := "0000";
	
begin

bcd <= inicio;

process(clk)
begin
	if(reset = '1') then 
		inicio <= "0000";
	elsif(falling_edge(clk)) then
		inicio <= inicio+1;
	end if;
end process;

end arq;
