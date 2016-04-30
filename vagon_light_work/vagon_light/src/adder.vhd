library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity adder is
	 port(
		 in_to_add : in unsigned(15 downto 0);
		 added : out unsigned(15 downto 0)
	     );
end adder;

architecture adder of adder is
--signal r : STD_LOGIC_VECTOR(15 downto 0) := in_to_add;
--signal i : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";
begin
	process(in_to_add)
	begin
--		r <= std_logic_vector(unsigned(r) + unsigned(i));
--		added <= r;
		added <= in_to_add + 1;
	end process;	
end adder;
