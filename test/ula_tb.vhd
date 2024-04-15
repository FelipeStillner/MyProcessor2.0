LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ula_tb IS 
END ENTITY;

ARCHITECTURE testbench OF ula_tb IS
  COMPONENT ula IS
    PORT (
      sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      eq : OUT STD_LOGIC;
      gtr : OUT STD_LOGIC;
      cout_sum : OUT STD_LOGIC;
      cout_sub : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL in0, in1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL cout_sum, cout_sub, eq, gtr : STD_LOGIC;

BEGIN
  ULA0 : ula PORT MAP(sel, in0, in1, out0, eq, gtr, cout_sum, cout_sub);

  PROCESS
  BEGIN
    in0 <= "0011001100110011";
    in1 <= "0101010101010101";
    sel <= "0000";
    WAIT FOR 5 ns;
    sel <= "0001";
    WAIT FOR 5 ns;
    sel <= "0010";
    WAIT FOR 5 ns;
    sel <= "0011";
    WAIT FOR 5 ns;
    sel <= "0100";
    WAIT FOR 5 ns;
    sel <= "0101";
    WAIT FOR 5 ns;
    sel <= "1111";
    WAIT FOR 5 ns;

    in0 <= "1111000011110000";
    in1 <= "1010101010101010";
    sel <= "0000";
    WAIT FOR 5 ns;
    sel <= "0001";
    WAIT FOR 5 ns;
    sel <= "0010";
    WAIT FOR 5 ns;
    sel <= "0011";
    WAIT FOR 5 ns;
    sel <= "0100";
    WAIT FOR 5 ns;
    sel <= "0101";
    WAIT FOR 5 ns;
    sel <= "1111";
    WAIT FOR 5 ns;

    in0 <= "0000000000000000";
    in1 <= "1111111111111111";
    sel <= "0000";
    WAIT FOR 5 ns;
    sel <= "0001";
    WAIT FOR 5 ns;
    sel <= "0010";
    WAIT FOR 5 ns;
    sel <= "0011";
    WAIT FOR 5 ns;
    sel <= "0100";
    WAIT FOR 5 ns;
    sel <= "0101";
    WAIT FOR 5 ns;
    sel <= "1111";
    WAIT FOR 5 ns;

    in0 <= "1100110111101111";
    in1 <= "0000000100100011";
    sel <= "0000";
    WAIT FOR 5 ns;
    sel <= "0001";
    WAIT FOR 5 ns;
    sel <= "0010";
    WAIT FOR 5 ns;
    sel <= "0011";
    WAIT FOR 5 ns;
    sel <= "0100";
    WAIT FOR 5 ns;
    sel <= "0101";
    WAIT FOR 5 ns;
    sel <= "1111";
    WAIT FOR 5 ns;

    in0 <= "0000000000000101";
    in1 <= "0000000000000101";
    sel <= "0000";
    WAIT FOR 5 ns;
    sel <= "0001";
    WAIT FOR 5 ns;
    sel <= "0010";
    WAIT FOR 5 ns;
    sel <= "0011";
    WAIT FOR 5 ns;
    sel <= "0100";
    WAIT FOR 5 ns;
    sel <= "0101";
    WAIT FOR 5 ns;
    sel <= "1111";
    WAIT FOR 5 ns;
  END PROCESS;
END;