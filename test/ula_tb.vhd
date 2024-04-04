library ieee;
use ieee.std_logic_1164.all;

entity ula_tb is
end entity;

architecture testbench of ula_tb is
  component ula is
      port( 
          sel     : in std_logic_vector(3 downto 0);
          in0,in1 : in std_logic_vector(15 downto 0);
          out0    : out std_logic_vector(15 downto 0);
          eq      : out std_logic;
          gtr     : out std_logic;
          gtru    : out std_logic;
          cout_sum: out std_logic;
          cout_sub: out std_logic
      );
  end component;

  signal  sel      : std_logic_vector(3 downto 0);
  signal  in0, in1 : std_logic_vector(15 downto 0);
  signal  out0     : std_logic_vector(15 downto 0);
  signal  cout_sum, cout_sub, eq, gtr, gtru     : std_logic;

begin
  ULA0: ula port map (sel, in0, in1, out0, eq, gtr, gtru, cout_sum, cout_sub);

  process
  begin
    sel <= "0000";
    in0 <= "0011001100110011";
    in1 <= "0101010101010101";
    wait for 5 ns;
    sel <= "0001";
    wait for 5 ns;
    sel <= "0010";
    wait for 5 ns;
    sel <= "0011";
    wait for 5 ns;
    in0 <= "0000000000000000";
    in1 <= "0000000000000000";
    wait for 5 ns;
    in0 <= "0000000000000000";
    in1 <= "0000000000000001";
    wait for 5 ns;
    in0 <= "1000000000000000";
    in1 <= "0000000000000001";
    wait for 5 ns;
  end process;
end;