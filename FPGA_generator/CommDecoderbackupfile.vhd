
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.numeric_std.all;

ENTITY ComDecoder IS 
	PORT
	(
		CLK : in std_logic;
		byte_in : in std_logic_vector(7 downto 0);

		byte_in_valid : in std_logic;
		bit_out : out std_logic;
		bit_out_shift : out std_logic;
		selector : out std_logic;
		pll_scanclkena : out std_logic;
		pll_configupdate : out std_logic;
		rec_code_start : out std_logic;
		rec_code_stop  : out std_logic;
		debug :	out std_logic_vector(7 downto 0)
		
	);
END ComDecoder;

architecture arch1 of ComDecoder is

signal possibleCode : std_logic_vector(23 downto 0);

constant CODE_START : std_logic_vector(23 downto 0) := "111111111111111111110000";
constant CODE_STOP  : std_logic_vector(23 downto 0) := "111111111111111111110001";
--constant CODE_todo : std_logic_vector(23 downto 0) := "111111111111111111110000";
--constant CODE_STOP : 

signal passByteOn : std_logic := '0';
signal byteToBePassed : std_logic_vector(7 downto 0) := "00000000";

signal blockBytes : integer range 0 to 3 := 0;
signal numberEnabled : std_logic := '0';

signal bitOutShiftSig : std_logic := '0';
signal recCodeStopSig : std_logic := '0';

signal selectorSig : std_logic := '0';

begin

debug <= byteToBePassed;
bit_out_shift <= bitOutShiftSig and numberEnabled;

selector <= '0';
pll_scanclkena <= '0';
pll_configupdate <= '0';

 decode : process(CLK) is
 --scan incoming bytes for codes
  variable lastValid : std_logic := '0';
  variable varCode : std_logic_vector(23 downto 0) := "010011110000100000000000";
  
  variable byteIsNotCode : std_logic := '0';
  variable byteIsNotCodeDeelayed : std_logic := '0';
  variable numberEnabledVar : std_logic := '0';
  
  begin
  
  if rising_edge(CLK) then
		if byte_in_valid = '1' and lastValid = '0' then
			byteToBePassed <= varCode(23 downto 16); --shift last out
			varCode := varCode(15 downto 0) & byte_in;
			byteIsNotCode := '1';
			
			numberEnabled <= numberEnabledVar;

			
			if varCode = CODE_START then
				rec_code_start <= '1';
				numberEnabledVar := '1';
				byteIsNotCode := '0';
			else
				rec_code_start <= '0';
			end if;
			
			if varCode = CODE_STOP then
				recCodeStopSig <= '1';
				numberEnabledVar := '0';
				byteIsNotCode := '0';
			else
				recCodeStopSig <= '0';
			end if;
		
			passByteOn <= '1';
			
			if byteIsNotCodeDeelayed = '0' then
				--is code, block next 3 bytes from passing into stream.
				blockBytes <= 3;
			else
				blockBytes <= 0;
			end if;
			
			byteIsNotCodeDeelayed := byteIsNotCode;
			
		
		else
			--rec_code_stop <= '0';
			recCodeStopSig <= '0';
			rec_code_start <= '0';
			passByteOn <= '0';
		end if;
	
		lastValid := byte_in_valid;

  end if;
 
  end process decode;
  
  deelay : process(CLK) is
  --deelay STOP signal transmission to allow passByte to shift data before channels latch it
  variable deelayVector : std_logic_vector(15 downto 0) :="0000000000000000";
  begin
  if rising_edge(CLK) then
		rec_code_stop <= deelayVector(15);
		deelayVector := deelayVector(14 downto 0) & recCodeStopSig;
  end if;
  end process deelay;
  
  
 passByte : process(CLK) is
  --shift non-code bytes into shiftreg
  variable lastPass : std_logic := '0';
  variable bitCounter : integer range 0 to 8 := 0;
  variable downTime : std_logic := '0';
  variable latchedByte : std_logic_vector(7 downto 0) := "00000000";
  variable latchedBlock : integer range 0 to 3 := 0;

  
  begin
  
  if rising_edge(CLK) then
  
  
		if passByteOn = '1' and lastPass = '0' then
			
			if latchedBlock = 0 then
				latchedBlock := blockBytes;
			end if;
			
			if latchedBlock > 0 then
				latchedBlock := latchedBlock -1;
			else
				bitCounter := 8;
				latchedByte := byteToBePassed;
			end if;
		end if;
		
		if bitCounter > 0 then
			if downTime = '1' then
				bitOutShiftSig <= '0';
				downTime := '0';
			else
				bit_out <= latchedByte(8 - bitCounter);
				bitOutShiftSig <= '1';
				bitCounter := bitCounter - 1;
				downTime := '1';
			end if;
		end if;
		
		lastPass := passByteOn;
  
  end if;
  
  end process passByte;
  
  
  
end arch1;

