library ieee;
use ieee.std_logic_1164.all;

entity sub16_tb is
end entity;

architecture testbench of sub16_tb is
  component sub16
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0)
    );
  end component;

  signal  in0, in1 : std_logic_vector(15 downto 0);
  signal  out0     : std_logic_vector(15 downto 0);

begin
  SUB160: sub16 port map (in0, in1, out0);

  process
  begin
    in0 <= "0011011100110011";
    in1 <= "0101010101000001";
    wait for 5 ns;
    in0 <= "1111111111111111";
    in1 <= "0000000000000000";
    wait for 5 ns;
    in0 <= "1111111011011100";
    in1 <= "0000100011001110";
    wait for 5 ns;
    in0 <= "0000100011001110";
    in1 <= "1111111011011100";
    wait for 5 ns;
  end process;
end;