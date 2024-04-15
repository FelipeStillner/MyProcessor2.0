LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sum_tb IS
END ENTITY;

ARCHITECTURE testbench OF sum_tb IS
  COMPONENT sum IS
    PORT (
      cin : IN STD_LOGIC;
      in0, in1 : IN STD_LOGIC;
      out0 : OUT STD_LOGIC;
      cout : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL cin : STD_LOGIC;
  SIGNAL in0, in1 : STD_LOGIC;
  SIGNAL out0 : STD_LOGIC;
  SIGNAL cout : STD_LOGIC;

BEGIN
  SUM0 : sum PORT MAP(cin, in0, in1, out0, cout);

  PROCESS
  BEGIN
    cin <= '0';
    in0 <= '0';
    in1 <= '0';
    WAIT FOR 5 ns;

    cin <= '0';
    in0 <= '0';
    in1 <= '1';
    WAIT FOR 5 ns;

    cin <= '0';
    in0 <= '1';
    in1 <= '1';
    WAIT FOR 5 ns;

    cin <= '1';
    in0 <= '1';
    in1 <= '1';
    WAIT FOR 5 ns;
  END PROCESS;
END;