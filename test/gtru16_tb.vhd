library ieee;
use ieee.std_logic_1164.all;

entity gtru16_tb is
end entity;

architecture testbench of gtru16_tb is
  component gtru16
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
  end component;

  signal  in0, in1 : std_logic_vector(15 downto 0);
  signal  cout     : std_logic;

begin
  GTRU160: gtru16 port map (in0, in1, cout);

  process
  begin
    in0 <= "0011011100110011";
    in1 <= "0101010101000001";
    wait for 5 ns;
    in0 <= "1111111111111111";
    in1 <= "1111111111111110";
    wait for 5 ns;
    in0 <= "0101010101000001";
    in1 <= "0011011100110011";
    wait for 5 ns;
    in0 <= "1111111111111110";
    in1 <= "1111111111111111";
    wait for 5 ns;
  end process;
end;