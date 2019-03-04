
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY Latcher IS 
	PORT
	(
		CLK : in std_logic;
		in_val : in std_logic;
		out_val :	out std_logic
	);
END Latcher;

architecture arch1 of Latcher is


begin



 latch : process(CLK) is
 --scan incoming bytes for codes
  variable counter : integer range 0 to 100000 := 0;
  variable counting : std_logic := '0';
  variable outVar : std_logic := '0';
  
  begin
  
  if rising_edge(CLK) then
		if counting = '1' then
			if counter = 0 then
				outVar := '0';
				counting := '0';
			else
				counter := counter - 1;
				outVar := '1';
			end if;
		
		elsif in_val = '1' then
			counting := '1';
			counter := 100000;
		end if;
		
		out_val <= outVar;
		
	end if;

 
  end process latch;
  
  
end arch1;

