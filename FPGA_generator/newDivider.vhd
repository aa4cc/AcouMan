library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity clock_divider  is
    generic (clock_divisor_factor: integer   := 100);
    port (
        clk_in : in  std_logic;
        clk_out: out std_logic
    );
end clock_divider;
 
architecture arch of clock_divider is
    signal temp: std_logic := '0'; 
    signal counter : integer range 0 to 50000000 := 0;
begin
    process (clk_in) begin
        if rising_edge(clk_in) then
            if (counter = (clock_divisor_factor-1)) then
                temp <= not temp;
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
            
        end if;
    end process;
    clk_out <= temp;
end arch;
