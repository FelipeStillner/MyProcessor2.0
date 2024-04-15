LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16_tb IS
END ENTITY;

ARCHITECTURE testbench OF mux16_tb IS

  COMPONENT mux16 IS
    PORT (
      sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      in0, in1, in2, in3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      in4, in5, in6, in7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      in8, in9, inA, inB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      inC, inD, inE, inF : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL in0, in1, in2, in3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL in4, in5, in6, in7 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL in8, in9, inA, inB : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL inC, inD, inE, inF : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
  MUX160 : mux16 PORT MAP(sel, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, inA, inB, inC, inD, inE, inF, out0);

  PROCESS
  BEGIN
    sel <= "0000";
    in0 <= "0000000000001111";
    in1 <= "0000000000001110";
    in2 <= "0000000000001101";
    in3 <= "0000000000001100";
    in4 <= "0000000000001011";
    in5 <= "0000000000001010";
    in6 <= "0000000000001001";
    in7 <= "0000000000001000";
    in8 <= "0000000000000111";
    in9 <= "0000000000000110";
    inA <= "0000000000000101";
    inB <= "0000000000000100";
    inC <= "0000000000000011";
    inD <= "0000000000000010";
    inE <= "0000000000000001";
    inF <= "0000000000000000";
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