LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux_tb IS
END ENTITY;

ARCHITECTURE testbench OF mux_tb IS
  COMPONENT mux
    PORT (
      sel : IN STD_LOGIC;
      in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL sel : STD_LOGIC;
  SIGNAL in0, in1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
  MUX0 : mux PORT MAP(sel, in0, in1, out0);

  PROCESS
  BEGIN
    sel <= '0';
    in0 <= "0000000000000000";
    in1 <= "1111111111111111";
    WAIT FOR 5 ns;
    sel <= '1';
    WAIT FOR 5 ns;
  END PROCESS;
END;