LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY reg16_tb IS
END ENTITY;

ARCHITECTURE testbench OF reg16_tb IS
    COMPONENT reg16 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk, rst, wr_en : STD_LOGIC;
    SIGNAL data_in, data_out : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    REG160 : reg16 PORT MAP(clk, rst, wr_en, data_in, data_out);

    PROCESS
    BEGIN
        data_in <= "1111111111111111";
        rst <= '0';
        wr_en <= '0';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en <= '0';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        data_in <= "1010101010101010";
        rst <= '1';
        WAIT FOR 5 ns;
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        rst <= '0';
        WAIT FOR 5 ns;
        wr_en <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
    END PROCESS;
END;