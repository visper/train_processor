library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity add_sub is
	 port(
		 from_reg : in unsigned(15 downto 0);
		 add_sub : in STD_LOGIC;
		 qas : out unsigned(15 downto 0)
	     );
end add_sub;

architecture add_sub of add_sub is
--signal i : STD_LOGIC_VECTOR(15 downto 0) := "0000000000000001";
begin
	process(add_sub)
	begin
		if (add_sub = '0') then
--			qas <= std_logic_vector(unsigned(from_reg) - unsigned(i));
			qas <= from_reg - 1;
		elsif (add_sub = '1') then
--			qas <= std_logic_vector(unsigned(from_reg) + unsigned(i));
			qas <= from_reg + 1;
		end if;
	end process;
end add_sub;
