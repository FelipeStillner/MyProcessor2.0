LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processador_tb IS
END ENTITY;

ARCHITECTURE testbench OF processador_tb IS
    COMPONENT processor0 IS
        PORT (
            clk, rst : IN STD_LOGIC;
            state : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            pc : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            instruction : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            reg3, reg4, reg5 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            accData : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            ula_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL clk, rst : STD_LOGIC;
    SIGNAL state : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL pc : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL instruction : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg3, reg4, reg5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL accData : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL result : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    PROC0 : processor0 PORT MAP(clk, rst, state, pc, instruction, reg3, reg4, reg5, accData, result);

    PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR 1 ns;
        rst <= '0';
        WAIT FOR 1 ns;

        l1 : for k in 0 to 850 loop
            clk <= '0';
            WAIT FOR 1 ns;
            clk <= '1';
            WAIT FOR 1 ns;
        end loop l1;

    END PROCESS;
END;