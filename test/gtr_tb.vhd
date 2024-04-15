LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY gtr_tb IS
END ENTITY;

ARCHITECTURE testbench OF gtr_tb IS
  COMPONENT gtr
    PORT (
      cin : IN STD_LOGIC;
      in0, in1 : IN STD_LOGIC;
      cout : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL cin : STD_LOGIC;
  SIGNAL in0, in1 : STD_LOGIC;
  SIGNAL cout : STD_LOGIC;

BEGIN
  GTR0 : gtr PORT MAP(cin, in0, in1, cout);

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
    in1 <= '0';
    WAIT FOR 5 ns;
    cin <= '0';
    in0 <= '1';
    in1 <= '1';
    WAIT FOR 5 ns;
    cin <= '1';
    in0 <= '0';
    in1 <= '0';
    WAIT FOR 5 ns;
    cin <= '1';
    in0 <= '0';
    in1 <= '1';
    WAIT FOR 5 ns;
    cin <= '1';
    in0 <= '1';
    in1 <= '0';
    WAIT FOR 5 ns;
    cin <= '1';
    in0 <= '1';
    in1 <= '1';
    WAIT FOR 5 ns;

  END PROCESS;
END;