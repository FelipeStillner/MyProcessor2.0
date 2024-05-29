LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ula_tb IS
END ENTITY;

ARCHITECTURE testbench OF ula_tb IS
  COMPONENT ula IS
    PORT (
      sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      clk : IN STD_LOGIC;
      out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
      carry : OUT STD_LOGIC;
      cond : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL in0, in1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
  SIGNAL carry, cond, clk : STD_LOGIC;

BEGIN
  ULA0 : ula PORT MAP(sel, in0, in1, clk, out0, carry, cond);

  PROCESS
  BEGIN
    in0 <= "1111111111111111";
    in1 <= "0000000000000001";
    sel <= "0011";
    clk <= '0';
    WAIT FOR 5 ns;
    clk <= '1';
    WAIT FOR 5 ns;

    in0 <= "1111111111111111";
    in1 <= "0000000000000000";
    sel <= "0011";
    clk <= '0';
    WAIT FOR 5 ns;
    clk <= '1';
    WAIT FOR 5 ns;

    in0 <= "1111111111111111";
    in1 <= "1111111111111111";
    sel <= "0011";
    clk <= '0';
    WAIT FOR 5 ns;
    clk <= '1';
    WAIT FOR 5 ns;

    in0 <= "1111111011111111";
    in1 <= "0000000000000001";
    sel <= "0011";
    clk <= '0';
    WAIT FOR 5 ns;
    clk <= '1';
    WAIT FOR 5 ns;
    
  END PROCESS;
END;