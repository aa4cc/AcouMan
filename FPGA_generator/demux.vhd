library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity Demux is
port (
     a : in std_logic; 
	  b : in std_logic;
	  selector : in std_logic;
	  a0 : out std_logic;
	  b0 : out std_logic;
	  a1 : out std_logic;
	  b1 : out std_logic
	  );
end Demux;
 
architecture rtl of Demux is

 
begin
 
 a0 <= a when selector = '0' else '0'; 
 a1 <= a when selector = '1' else '0'; 
 b0 <= b when selector = '0' else '0'; 
 b1 <= b when selector = '1' else '0'; 

  
end rtl;