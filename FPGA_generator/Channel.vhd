
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY Channel IS 
	PORT
	(
		CLK_LOGIC : in std_logic;
		CLK_FREQ  :  in std_logic;
		PHASE_SHIFT_IN : in std_logic_vector(8 downto 0);
		PULSE_WIDTH_IN : in std_logic_vector(8 downto 0);
		OUT_SIGNAL : out std_logic
	);
END Channel;

architecture arch1 of Channel is

--signal CLK_FREQ : std_logic := '0';


signal phase_shift  : integer range 0 to 360 := 0;
signal duty_width  : integer range 0 to 360 := 180;

signal output : std_logic := '0';

signal newPeriod : std_logic := '0';
signal newPeriodEnable : std_logic := '1';

signal duty_begin : std_logic := '0';
signal duty_on : std_logic := '0';
signal duty_enable : std_logic := '1';


begin


phase_shift <= to_integer(unsigned(PHASE_SHIFT_IN));
duty_width <= to_integer(unsigned(PULSE_WIDTH_IN));
--OUT_SIGNAL <= output;
OUT_SIGNAL <= duty_on; --and duty_enable;
--TODO change?

--
--enablePeriod : process(CLK_LOGIC) is
--variable seenHigh := '0';
--variable enableOutput := '1';
--variable waiting := '0';
--begin
--if rising_edge(CLK_LOGIC) then
--
--	if CLK_FREQ = '0' then
--		enableOutput := '1';
--		waiting := '0';
--	elsif seenHigh := '1' then
--		enableOutput := '0'
--
----end if;
--
--end process enablePeriod;

 shiftPhase : process(CLK_LOGIC) is
  variable counter : integer range 0 to 400 := 0;
  variable counting : std_logic := '0';
  variable lastFreq : std_logic := '0';
  variable countingLag : std_logic := '0';
  
 
  begin
  
  if rising_edge(CLK_LOGIC) then
		if counting = '0' then
			if CLK_FREQ = '1' and lastFreq = '0' then
				if phase_shift = 0 then
					duty_begin <= '1';
				else
					counting := '1';
					counter := phase_shift;
					duty_begin <= '0';
				end if;
				
			else
				counting := '0';
				duty_begin <= '0';
			end if;
		elsif counting = '1' then
			if counter = 1 then
				duty_begin <= '1';
				counting := '0';
			else
				counter := counter - 1;
				duty_begin <= '0';
			end if;
		end if;
  
  lastFreq := CLK_FREQ;
  duty_enable <= not(countingLag);
  countingLag := counting;
  --duty_begin <= counting;
		
  end if;
 
  end process shiftPhase;
  
  
  
  
  dutyCycle : process(CLK_LOGIC) is
  variable counter : integer range 0 to 400 := 0;
  variable counting : std_logic := '0';
  variable lastBegin : std_logic := '0';
  variable duty_out : std_logic := '0';
 
  begin
  
  if rising_edge(CLK_LOGIC) then
		if counting = '0' then
			if duty_begin = '1' and lastBegin = '0' then
				if duty_width = 0 then
					--do nothing
				else
					counting := '1';
					counter := duty_width;
					duty_on <= '1';
				end if;
				
			else
				counting := '0';
				duty_on <= '0';
			end if;
		elsif counting = '1' then
			if counter = 1 then
				duty_on <= '0';
				counting := '0';
			else
				counter := counter - 1;
				duty_on <= '1';
			end if;
		end if;
  
  lastBegin := duty_begin;
		
  end if;
  end process dutyCycle;
  
  
end arch1;

