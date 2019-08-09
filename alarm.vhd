library ieee;
use ieee.std_logic_1164.all;

entity alarm is
	port(
		ac0,ac1,ac2,ac3 : in std_logic_vector(3 downto 0);
		ad0,ad1,ad2,ad3 : out std_logic_vector(3 downto 0);
		clk	: in std_logic;
		buzzer	: out std_logic
	);
end alarm;

architecture arq of alarm is
	signal a0: std_logic_vector(3 downto 0) := x"5";
	signal a1: std_logic_vector(3 downto 0) := x"5";
	signal a2: std_logic_vector(3 downto 0) := x"5";
	signal a3: std_logic_vector(3 downto 0) := x"5";
	
	component contador is
		port(
			bcd	: out std_logic_vector(3 downto 0);
			clk	: in std_logic;
			reset	: in std_logic
		);
	end component;
	
	signal reset0,reset1,reset2,reset3,aux : std_logic;
	
begin

ad0 <= a0;
ad1 <= a1;
ad2 <= a2;
ad3 <= a3;


buzzer <= '1' when (ac0 = a0 and ac1 = a1 and ac2 = a2 and ac3 = a3) else '0';


counter0 : contador
	port map(a0,clk,reset0
	);
	
reset0 <= '1' when a0 = x"A" else '0';
	
counter1 : contador
	port map(a1,reset0,reset1
	);
	
reset1 <= '1' when a1 = x"6" else '0';
	
	
counter2 : contador
	port map(a2,reset1,reset2
	);

reset2 <=
	'1' when a2 = x"A" else
	'1' when a3 = x"2" and a2 = x"4" else
	'0';
	
aux <= '1' when a2 = x"A" else '0';

counter3 : contador
	port map(a3,aux,reset3
	);
	

reset3 <=
	'1' when a3 = x"2" and a2 = x"4" else
	'0';
	
end arq;
