
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY freqCounter IS 
	PORT
	(
		CLK_IN : in std_logic;
		CLK_OUT  :  out std_logic
		--TODO input frequency
	);
END freqCounter;

architecture arch1 of freqCounter is

constant pulses : integer := 50;--warning, check code below, out clock might be half of what is expected!

signal output : std_logic := '0';


begin

CLK_OUT <= output;

 divideClock : process(CLK_IN) is
 variable isHigh : std_logic := '0';
 variable count : integer range 0 to 10000000 := 0;
 begin
 if rising_edge(CLK_IN) then
 
	if count = 0 then
		
		if isHigh = '0' then
			isHigh := '1';
		else
			isHigh := '0';
		end if;
		
	count := pulses;
		
	else
	
		count := count - 1;
	
	end if;
	
	output <= isHigh;
	
 end if;
 end process divideClock;
 
end arch1;

