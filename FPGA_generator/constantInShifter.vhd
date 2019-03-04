library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity constantInShifter is
port (
     clock : in std_logic; 
	  perform : in std_logic;
	  scanchain : in std_logic_vector(143 downto 0);
	  data : out std_logic;
	  shift : out std_logic;
	  scanena: out std_logic;
	  debugAgree : out std_logic;
	  reconfig : out std_logic
	  );
end constantInShifter;
 
architecture rtl of constantInShifter is

signal state : integer := -1;

signal dataVal : std_logic_vector(143 downto 0) := "000011000000000001000000011100000010000010010000010010000001101100001100100000000000000000100000000000000000100000000000000000100000000000000000";
--fake signal dataVal : std_logic_vector(143 downto 0) := "000000000000000001100000011100000010000010010000010010000001101100001100100000000000000000100000000000000000100000000000000000101010001111001011";


signal outShift : std_logic := '0';
signal outData : std_logic := '0';
signal outScanena : std_logic := '0';
signal outReconfig : std_logic := '0';

 
begin
 
 data <= outData;
 shift <= outShift;
 scanena <= outScanena;
 reconfig <= outReconfig;
 
 debugAgree <= '1' when dataVal = scanchain else '0';
 
job : process (clock) is
  variable isShift : std_logic := '0';
  begin
  
  if rising_edge(clock) then
	if state < 0 then
		if perform = '1' then
			state <= 0;
			isShift := '0';
			outShift <= '1';
			outScanena <= '1';
		end if;
	elsif state < 144 then
		if isShift = '0' then
			outData <= dataVal(state);
			outShift <= '0';
			isShift := '1';
		else
			outShift <= '1';
			isShift := '0';
			state <= state + 1;
		end if;
	elsif state = 144 then
		outScanena <= '0';
		outReconfig <= '1';
		outShift <= '0';
		state <= state + 1;
	else
		outReconfig <= '0';
		if perform = '0' then
			state <= -1;
			
		end if;
	end if;
  end if;

end process job;
 
end rtl;