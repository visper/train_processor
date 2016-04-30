library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity PC is
	 port(
		 clk : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 nxt : in unsigned(15 downto 0);
		 adr : out unsigned(15 downto 0)
	     );
end PC;

architecture PC of PC is
signal reg: unsigned(15 downto 0);
begin
	process (clk, rst)
	begin		  	
		if (clk'event and clk = '1' and rst = '1') then
			reg <= "0000000000000000"; -- init with 0
			adr <= "0000000000000000";
		elsif (clk'event and clk = '1' and rst = '0') then --передний фронт
			adr <= reg;
		elsif (clk'event and clk = '0' and rst = '0') then --задний фронт
			reg <= nxt;
		end if;		
	end process;
end PC;
