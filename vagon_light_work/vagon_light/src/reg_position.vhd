library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity reg_position is
	 port(
		 clk : in STD_LOGIC;
		 rst : in STD_LOGIC;
		 load : in STD_LOGIC;
		 wr_en : in STD_LOGIC;
--		 cmp : in STD_LOGIC;
		 d1 : in unsigned(15 downto 0);
		 q_add : in unsigned(15 downto 0);
		 q_reg_pos : out unsigned(15 downto 0)
	     );
end reg_position;

architecture reg_position of reg_position is
signal reg: unsigned(15 downto 0);
begin
	process (clk, rst)
	begin		  	
		if (clk'event and clk = '1' and rst = '1') then
			reg <= "0000000000000000"; -- init with 0
			q_reg_pos <= reg;
		elsif (clk'event and clk = '1' and rst = '0') then
			if(load = '1') then
				reg <= d1;												 
				q_reg_pos <= reg;
			elsif(load = '0') then
				reg <= q_add;
				--q_reg_pos <= reg;
			end if;
			--q_reg_pos <= reg;
		end if;		
	end process;
end reg_position;
