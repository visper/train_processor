

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {buff} architecture {buff}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity buff is
	 port(
		 BE : in STD_LOGIC;
		 D : in STD_LOGIC_VECTOR(15 downto 0);
		 B : out STD_LOGIC_VECTOR(15 downto 0)
	     );
end buff;

--}} End of automatically maintained section

architecture buff of buff is
begin 
	L1: process (BE)
	begin
	if BE = '1' then
		B <= D;
	else
		B <= "ZZZZZZZZZZZZZZZZ";	 
	end if;
	end process	;
end buff;
