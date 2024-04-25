LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fft_tb IS
END ENTITY;

ARCHITECTURE testbench OF fft_tb IS
  COMPONENT fft
    PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      data_out : OUT STD_LOGIC
    );
  END COMPONENT;

  SIGNAL clk, rst : STD_LOGIC;
  SIGNAL data_out : STD_LOGIC;

BEGIN
  FFT160 : fft PORT MAP(clk, rst, data_out);

  PROCESS
  BEGIN
    rst <= '1';
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

  END PROCESS;
END;