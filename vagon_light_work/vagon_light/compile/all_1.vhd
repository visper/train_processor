-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : vagon_light
-- Author      : User
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : D:\work\VHDL\all\vagon_light_work\vagon_light\compile\all_1.vhd
-- Generated   : Tue Jun  2 09:37:16 2015
-- From        : D:\work\VHDL\all\vagon_light_work\vagon_light\src\all_1.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity all_1 is
  port(
       clk_d_2 : in STD_LOGIC;
       load : in STD_LOGIC;
       rst : in STD_LOGIC;
       d1 : in unsigned(15 downto 0);
       detector : in unsigned(15 downto 0)
  );
end all_1;

architecture all_1 of all_1 is

---- Component declarations -----

component adder
  port (
       in_to_add : in unsigned(15 downto 0);
       added : out unsigned(15 downto 0)
  );
end component;
component adder_1
  port (
       in_to_add : in unsigned(15 downto 0);
       added : out unsigned(15 downto 0)
  );
end component;
component add_sub
  port (
       add_sub : in STD_LOGIC;
       from_reg : in unsigned(15 downto 0);
       qas : out unsigned(15 downto 0)
  );
end component;
component comparator
  port (
       minus : in unsigned(15 downto 0);
       plus : in unsigned(15 downto 0);
       cmp_out : out STD_LOGIC
  );
end component;
component decoder
  port (
       instr : in unsigned(15 downto 0);
       add_sum : out STD_LOGIC;
       goto : out STD_LOGIC;
       jmp_adr : out unsigned(15 downto 0);
       jump_be : out STD_LOGIC;
       wr_en : out STD_LOGIC
  );
end component;
component instruction_mem
  port (
       addres : in unsigned(15 downto 0);
       instruction : out unsigned(15 downto 0)
  );
end component;
component multiplex
  port (
       en : in STD_LOGIC;
       in_1 : in unsigned(15 downto 0);
       in_2 : in unsigned(15 downto 0);
       out_1 : out unsigned(15 downto 0)
  );
end component;
component PC
  port (
       clk : in STD_LOGIC;
       nxt : in unsigned(15 downto 0);
       rst : in STD_LOGIC;
       adr : out unsigned(15 downto 0)
  );
end component;
component reg_position
  port (
       clk : in STD_LOGIC;
       d1 : in unsigned(15 downto 0);
       load : in STD_LOGIC;
       q_add : in unsigned(15 downto 0);
       rst : in STD_LOGIC;
       wr_en : in STD_LOGIC;
       q_reg_pos : out unsigned(15 downto 0)
  );
end component;
component multiplex_1
  port (
       en : in STD_LOGIC;
       in_1 : in unsigned(15 downto 0);
       in_2 : in unsigned(15 downto 0);
       out_1 : out unsigned(15 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS1057 : STD_LOGIC;
signal jmp_be : STD_LOGIC;
signal NET1892 : STD_LOGIC;
signal or_out : STD_LOGIC;
signal sub_add : STD_LOGIC;
signal wr_en : STD_LOGIC;
signal added_pc_pc : unsigned (15 downto 0);
signal adress_instr : unsigned (15 downto 0);
signal BUS1244 : unsigned (15 downto 0);
signal instruction : unsigned (15 downto 0);
signal jmp_adr : unsigned (15 downto 0);
signal multiplex_jmp_add : unsigned (15 downto 0);
signal next_adr : unsigned (15 downto 0);
signal q_reg_pos : unsigned (15 downto 0);
signal reg_in : unsigned (15 downto 0);

begin

----  Component instantiations  ----

U1 : PC
  port map(
       adr => adress_instr,
       clk => clk_d_2,
       nxt => next_adr,
       rst => rst
  );

U10 : multiplex_1
  port map(
       en => or_out,
       in_1 => jmp_adr,
       in_2 => added_pc_pc,
       out_1 => multiplex_jmp_add
  );

or_out <= NET1892 or BUS1057;

U2 : adder
  port map(
       added => BUS1244,
       in_to_add => adress_instr
  );

U3 : multiplex
  port map(
       en => jmp_be,
       in_1 => BUS1244,
       in_2 => multiplex_jmp_add,
       out_1 => next_adr
  );

U4 : instruction_mem
  port map(
       addres => adress_instr,
       instruction => instruction
  );

U5 : decoder
  port map(
       add_sum => sub_add,
       goto => BUS1057,
       instr => instruction,
       jmp_adr => jmp_adr,
       jump_be => jmp_be,
       wr_en => wr_en
  );

U6 : reg_position
  port map(
       clk => clk_d_2,
       d1 => d1,
       load => load,
       q_add => reg_in,
       q_reg_pos => q_reg_pos,
       rst => rst,
       wr_en => wr_en
  );

U7 : add_sub
  port map(
       add_sub => sub_add,
       from_reg => q_reg_pos,
       qas => reg_in
  );

U8 : comparator
  port map(
       cmp_out => NET1892,
       minus => detector,
       plus => q_reg_pos
  );

U9 : adder_1
  port map(
       added => added_pc_pc,
       in_to_add => BUS1244
  );


end all_1;
