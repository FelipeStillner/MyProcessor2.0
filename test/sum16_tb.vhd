LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sum16_tb IS
END ENTITY;

ARCHITECTURE testbench OF sum16_tb IS
  COMPONENT sum16
    PORT (
      cin : IN STD_LOGIC;
      in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      cout : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL cin : STD_LOGIC;
  SIGNAL in0, in1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL cout : STD_LOGIC;

BEGIN
  SUM160 : sum16 PORT MAP(cin, in0, in1, out0, cout);

  PROCESS
  BEGIN
    cin <= '0';
    in0 <= "0011011100110011";
    in1 <= "0101010101000001";
    WAIT FOR 5 ns;
    cin <= '0';
    in0 <= "1111111111111111";
    in1 <= "0000000000000000";
    WAIT FOR 5 ns;
    cin <= '1';
    in0 <= "0011001100110011";
    in1 <= "0101010101010101";
    WAIT FOR 5 ns;
    cin <= '1';
    in0 <= "1111111111111111";
    in1 <= "0000000000000000";
    WAIT FOR 5 ns;
  END PROCESS;
END;