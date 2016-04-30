

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {multiplex} architecture {multiplex}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity multiplex is
	 port(
		 en : in STD_LOGIC;
		 in_1 : in unsigned(15 downto 0);
		 in_2 : in unsigned(15 downto 0);
		 out_1 : out unsigned(15 downto 0)
	     );
end multiplex;

architecture multiplex of multiplex is
begin
	process(en, in_1, in_2)
	begin
		if (en = '0') then
			out_1 <= in_1;
		elsif (en = '1') then
			out_1 <= in_2;
		end if;
	end process;
end multiplex;
