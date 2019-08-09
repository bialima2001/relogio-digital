library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity key_decoder is
	port(
		code : in std_logic_vector(7 downto 0);
		seletor : out std_logic_vector(1 downto 0);
		crono_reset : out std_logic;
		clock_fast : out std_logic;
		alarm_fast : out std_logic
	);
end key_decoder;

architecture arq of key_decoder is
	signal sel: std_logic_vector(1 downto 0);
begin

	seletor <= sel;
	
	sel <=
		"00" when code = x"1C" else -- tecla A(modo relógio digital)
		"01" when code = x"32" else -- tecla B(modo cronômetro)
		"10" when code = x"21"; -- tecla C(modo alarme)
		
	crono_reset <=   --zerar cronômetro
		'1' when code = x"23" else '0'; -- D
	
	clock_fast <=--editar relogio digital acelerando contagem
		'1' when code = x"24" else '0'; -- E
	
	alarm_fast <=--editar alarme acelerando contagem
		'1' when code = x"2B" else '0'; -- F
	
end arq;
