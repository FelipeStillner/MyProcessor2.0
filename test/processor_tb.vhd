LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processor_tb IS
END ENTITY;

ARCHITECTURE testbench OF processor_tb IS
    COMPONENT processor IS
        PORT (
            sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            imm : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            sel_wr : IN STD_LOGIC;
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en_regbank : IN STD_LOGIC;
            wr_en_acc : IN STD_LOGIC;
            wr_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            rd_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            ula_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL clk, rst, wr_en_acc, wr_en_regbank, sel_wr : STD_LOGIC;
    SIGNAL wr_reg, rd_reg : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL ula_out, imm : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    PROC0 : processor PORT MAP(sel, imm, sel_wr, clk, rst, wr_en_regbank, wr_en_acc, wr_reg, rd_reg, ula_out);

    PROCESS
    BEGIN
        rst <= '1';
        WAIT FOR 5 ns;
        rst <= '0';
        wr_en_acc <= '0';
        sel <= "0001";
        imm <= "0001001001001000";
        sel_wr <= '0';
        wr_en_regbank <= '1';
        wr_reg <= "001";
        rd_reg <= "001";
        
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '0';

        sel <= "0001";
        imm <= "1000010000100001";
        sel_wr <= '0';
        wr_en_regbank <= '1';
        wr_en_acc <= '0';
        wr_reg <= "010";
        rd_reg <= "010";

        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '0';

        sel <= "0011";
        imm <= "1000010000100001";
        sel_wr <= '1';
        wr_en_regbank <= '0';
        wr_en_acc <= '0';
        wr_reg <= "010";
        rd_reg <= "001";

        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '0';

    END PROCESS;
END;