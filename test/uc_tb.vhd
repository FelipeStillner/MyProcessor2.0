LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY uc_tb IS
END ENTITY;

ARCHITECTURE testbench OF uc_tb IS
  COMPONENT uc IS
    PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC
    );
  END COMPONENT;

  SIGNAL clk, rst: STD_LOGIC;

BEGIN
  UC0 : uc PORT MAP(clk, rst);

  PROCESS
  BEGIN
    rst <= '1';
    clk <= '1';
    WAIT FOR 5 ns;

    rst <= '0';
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
  END PROCESS;
END;