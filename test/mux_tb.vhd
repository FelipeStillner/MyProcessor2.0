library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end entity;

architecture testbench of mux_tb is
  component mux
    port( 
      sel     : in std_logic;
      in0,in1 : in std_logic_vector(15 downto 0);
      out0    : out std_logic_vector(15 downto 0)
    );
  end component;

  signal  sel      : std_logic;
  signal  in0, in1 : std_logic_vector(15 downto 0);
  signal  out0     : std_logic_vector(15 downto 0);

begin
  MUX0: mux port map (sel, in0, in1, out0);

  process
  begin
    sel <= '0';
    in0 <= "0000000000000000";
    in1 <= "1111111111111111";
    wait for 5 ns;
    sel <= '1';
    wait for 5 ns;
  end process;
end;