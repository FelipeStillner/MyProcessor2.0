library ieee;
use ieee.std_logic_1164.all;

entity sum_tb is
end entity;

architecture testbench of sum_tb is
    component sum is
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic;
            out0    : out std_logic;
            cout    : out std_logic
        );
    end component;

  signal  cin      : std_logic;
  signal  in0, in1 : std_logic;
  signal  out0     : std_logic;
  signal  cout     : std_logic;

begin
  SUM0: sum port map (cin, in0, in1, out0, cout);

  process
  begin
    cin <= '0';
    in0 <= '0';
    in1 <= '0';
    wait for 5 ns;

    cin <= '0';
    in0 <= '0';
    in1 <= '1';
    wait for 5 ns;

    cin <= '0';
    in0 <= '1';
    in1 <= '1';
    wait for 5 ns;

    cin <= '1';
    in0 <= '1';
    in1 <= '1';
    wait for 5 ns;
  end process;
end;