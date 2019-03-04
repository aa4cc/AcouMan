
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

package ChannelArray64_type is
type intarr is array (63 downto 0) of integer range 0 to 360;
end package ChannelArray64_type;


LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;
use work.ChannelArray64_type.all;


ENTITY ChannelArray64 IS 

	PORT
	(
		CLK_LOGIC : in std_logic;
		CLK_FREQ  :  in std_logic;
		DATA_IN   : in 	std_logic_vector(1151 downto 0);
		DATA_READY : in std_logic;
		OUT_SIGNAL : out std_logic_vector(63 downto 0)
	);
END ChannelArray64;

architecture arch1 of ChannelArray64 is


component Channel IS 
	PORT
	(
		CLK_LOGIC : in std_logic;
		CLK_FREQ  :  in std_logic;
		PHASE_SHIFT_IN : in std_logic_vector(8 downto 0);
		PULSE_WIDTH_IN : in std_logic_vector(8 downto 0);
		OUT_SIGNAL : out std_logic
	);
END component;


signal PHASE_SHIFT_IN : std_logic_vector(575 downto 0);
signal PULSE_WIDTH_IN : std_logic_vector(575 downto 0);

begin

CopyInput: for I in 0 to 63 generate

process(DATA_READY) is

begin
	if rising_edge(DATA_READY) then
		PHASE_SHIFT_IN((575-I*9) downto (575-I*9-8)) <= DATA_IN((1151-I*18) downto (1151-I*18-8));
		PULSE_WIDTH_IN((575-I*9) downto (575-I*9-8)) <= DATA_IN((1151-I*18-9) downto (1151-I*18-17));
	end if;
end process;


end generate CopyInput;

ChannelArr: for I in 0 to 63 generate
	chan: Channel port map
	(CLK_LOGIC, CLK_FREQ, PHASE_SHIFT_IN((575-I*9) downto (575-I*9-8)), PULSE_WIDTH_IN((575-I*9) downto (575-I*9-8)), OUT_SIGNAL(I));
end generate ChannelArr;


end arch1;

