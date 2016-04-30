library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity decoder is
	 port(
		 instr : in unsigned(15 downto 0);
		 add_sum : out STD_LOGIC;
		 wr_en : out STD_LOGIC;
		 jump_be : out STD_LOGIC;
		 jmp_adr : out unsigned(15 downto 0);
		 goto : out STD_LOGIC
	     );
end decoder;

architecture decoder of decoder is
--signal i : unsigned(15 downto 0) := "0000000000000000";
begin
	process(instr)	
	variable i : unsigned(15 downto 0) :="0000000000000000";
	begin
		if (instr(15) = '0' and instr(14) = '0' and instr(13) = '0') then -- add
			add_sum <= '1';
			wr_en <= '1'; -- for write in reg
			jmp_adr <= "0000000000000000";
			--jmp_adr <= "ZZZZZZZZZZZZZZZZ";
			jump_be <= '0';
			goto <= '0';
		elsif (instr(15) = '1' and instr(14) = '0' and instr(13) = '0') then -- sub
			add_sum <= '0';
			wr_en <= '1'; -- for write in reg
			jmp_adr <= "0000000000000000";
			--jmp_adr <= "ZZZZZZZZZZZZZZZZ";
			jump_be <= '0';
			goto <= '0';
		elsif (instr(15) = '0' and instr(14) = '1' and instr(13) = '0') then -- goto
			add_sum <= '0';
			wr_en <= '0'; --not write in reg, add_sub doesn`t matter
			i := instr;
			i(15) := '0'; --may be can delete
			i(14) := '0';
			i(13) := '0'; --may be can delete			
			jmp_adr <= i;
			jump_be <= '1';
			goto <= '1';
		elsif (instr(15) = '0' and instr(14) = '0' and instr(13) = '1') then -- be
			add_sum <= '0';
			wr_en <= '0'; --not write in reg, add_sub doesn`t matter
			jmp_adr <= "0000000000000000";
			--jmp_adr <= "ZZZZZZZZZZZZZZZZ";
			jump_be <= '1';			
			goto <= '0';
		end if;
	end process;


end decoder;
