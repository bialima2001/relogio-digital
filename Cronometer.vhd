library IEEE;
use IEEE.std_logic_1164.ALL;

entity Cronometer is
	port(
		clk: in std_logic;
		a0,a1,a2,a3 : out std_logic_vector(3 downto 0);
		reset : in std_logic
	);
end;

architecture arq of Cronometer is
	
	component bcd_7seg_decoder is
		port (
			BCD	: in std_logic_vector(3 downto 0);
			HEX 	: out std_logic_vector(6 downto 0)
		);
	end component;
	
	component contador is
		port(
			bcd	: out std_logic_vector(3 downto 0);
			clk	: in std_logic;
			reset	: in std_logic
		);
	end component;
	
	
	component clk_divider is
		generic(
			multiplier 	: integer
		);
		port(
			clk_in 		: in std_logic;
			clk_out		: out std_logic
		);
	end component;
	 
	signal ac0,ac1,ac2,ac3 : std_logic_vector(3 downto 0);
	signal reset0,reset1,reset2,reset3,aux,aux1 : std_logic;
	
begin

a0 <= ac0;
a1 <= ac1;
a2 <= ac2;
a3 <= ac3;

		
counter0 : contador
	port map(
		ac0,
		clk,
		reset0
	);

reset0 <= '1' when ac0 = x"A" else
			 '1' when reset ='1' else
			 '0';
	
counter1 : contador
	port map(
		ac1,
		reset0,
		reset1
	);
	
reset1 <= '1' when ac1 = x"6" else 
			 '1' when reset ='1' else
			 '0';
	
aux1 <= '1' when ac1 = x"6" else '0';

counter2 : contador
	port map(
		ac2,
		aux1,
		reset2
	);

reset2 <= '1' when ac2 = x"A" else 
			 '1' when reset ='1' else
			 '0';
		
aux <= '1' when ac2 = x"A" else '0';
			 
	
counter3 : contador
	port map(
		ac3,
		aux,
		reset3
	);
	

reset3 <= '1' when ac3 = x"6" else 
			 '1' when reset ='1' else --resetar geral
			 '0';
	
end;
