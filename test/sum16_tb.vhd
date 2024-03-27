library ieee;
use ieee.std_logic_1164.all;

entity sum16_tb is
end entity;

architecture testbench of sum16_tb is
  component sum16
    port( 
        cin     : in std_logic;
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
  end component;

  signal  cin      : std_logic;
  signal  in0, in1 : std_logic_vector(15 downto 0);
  signal  out0     : std_logic_vector(15 downto 0);
  signal  cout     : std_logic;

begin
  SUM160: sum16 port map (cin, in0, in1, out0, cout);

  process
  begin
    cin <= '0';
    in0 <= "0011011100110011";
    in1 <= "0101010101000001";
    wait for 5 ns;
    cin <= '0';
    in0 <= "1111111111111111";
    in1 <= "0000000000000000";
    wait for 5 ns;
    cin <= '1';
    in0 <= "0011001100110011";
    in1 <= "0101010101010101";
    wait for 5 ns;
    cin <= '1';
    in0 <= "1111111111111111";
    in1 <= "0000000000000000";
    wait for 5 ns;
  end process;
end;