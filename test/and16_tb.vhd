library ieee;
use ieee.std_logic_1164.all;

entity and16_tb is
end entity;

architecture testbench of and16_tb is
  component and16
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0)
    );
  end component;

  signal  in0, in1 : std_logic_vector(15 downto 0);
  signal  out0     : std_logic_vector(15 downto 0);

begin
  AND160: and16 port map (in0, in1, out0);

  process
  begin
    in0 <= "0011001100110011";
    in1 <= "0101010101010101";
    wait for 5 ns;
  end process;
end;