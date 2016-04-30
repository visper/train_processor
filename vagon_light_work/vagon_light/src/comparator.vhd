library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity comparator is
	 port(
		 plus : in unsigned(15 downto 0);
		 minus : in unsigned(15 downto 0);
		 cmp_out : out STD_LOGIC
	     );
end comparator;

architecture comparator of comparator is
begin
	process(plus, minus)
	begin
		if (plus /= minus) then
			cmp_out <= '0';
		--elsif (plus = minus) then -- not equal
		else
			cmp_out <= '1';
		end if;
	end process;
end comparator;
