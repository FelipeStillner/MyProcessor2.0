library ieee;
use ieee.std_logic_1164.all;

entity gtr_tb is
end entity;

architecture testbench of gtr_tb is
  component gtr
    port( 
        cin     : in std_logic;
        in0,in1 : in std_logic;
        cout    : out std_logic
    );
  end component;

  signal  cin      : std_logic;
  signal  in0, in1 : std_logic;
  signal  cout     : std_logic;

begin
  GTR0: gtr port map (cin, in0, in1, cout);

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
    in1 <= '0';
    wait for 5 ns;
    cin <= '0';
    in0 <= '1';
    in1 <= '1';
    wait for 5 ns;
    cin <= '1';
    in0 <= '0';
    in1 <= '0';
    wait for 5 ns;
    cin <= '1';
    in0 <= '0';
    in1 <= '1';
    wait for 5 ns;
    cin <= '1';
    in0 <= '1';
    in1 <= '0';
    wait for 5 ns;
    cin <= '1';
    in0 <= '1';
    in1 <= '1';
    wait for 5 ns;
    
  end process;
end;