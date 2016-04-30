library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity instruction_mem is
	 port(
		 addres : in unsigned(15 downto 0);
		 instruction : out unsigned(15 downto 0)
	     );
end instruction_mem;

architecture instruction_mem of instruction_mem is
begin
	process (addres) begin
		case addres is
			when "0000000000000000" => instruction <= "0010000000000000";	--ifflag
			when "0000000000000001" => instruction <= "0100000000000110";  --goto
			when "0000000000000010" => instruction <= "1000000000000000";  --b
			when "0000000000000011" => instruction <= "1000000000000000";  --b
			when "0000000000000100" => instruction <= "0000000000000000";  --f
			when "0000000000000101" => instruction <= "0100000000000000";  --goto
			when "0000000000000110" => instruction <= "1000000000000000";  --b
			when "0000000000000111" => instruction <= "1000000000000000";  --b
			when "0000000000001000" => instruction <= "1000000000000000";  --b
			when others 			=> instruction <= "0000000000000000";
		end case;
	end process;

end instruction_mem;
