LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY uc_tb IS
END ENTITY;

ARCHITECTURE testbench OF uc_tb IS
  COMPONENT uc
    PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      state : OUT STD_LOGIC;
      addr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
      data : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
  END COMPONENT;

  SIGNAL clk, rst, state : STD_LOGIC;
  SIGNAL addr : STD_LOGIC_VECTOR(6 DOWNTO 0);
  SIGNAL data : STD_LOGIC_VECTOR(11 DOWNTO 0);

BEGIN
  UC0 : uc PORT MAP(clk, rst, state, addr, data);

  PROCESS
  BEGIN
    rst <= '1';
    WAIT FOR 5 ns;

    rst <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

    clk <= '0';
    WAIT FOR 5 ns;

    clk <= '1';
    WAIT FOR 5 ns;

  END PROCESS;
END;