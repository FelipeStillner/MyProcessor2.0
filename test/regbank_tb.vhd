LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY regbank_tb IS
END ENTITY;

ARCHITECTURE testbench OF regbank_tb IS
    COMPONENT regbank IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en : IN STD_LOGIC;
            wr_src : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            wr_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            rd_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    signal clk, rst, wr_en : std_logic;
    signal wr_reg, rd_reg : std_logic_vector(2 downto 0);
    signal wr_src, data_out : std_logic_vector(15 downto 0);

BEGIN
    REGBANK160 : regbank PORT MAP(clk, rst, wr_en, wr_src, wr_reg, rd_reg, data_out);

    PROCESS
    BEGIN
        rst <= '0';
        wr_en <= '0';
        wr_src <= "0000000000000000";
        wr_reg <= "001";
        rd_reg <= "000";

        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        wr_src <= "1000100000001000";
        wr_reg <= "001";
        wr_en <= '1';

        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        rd_reg <= "001";
        
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        rst <= '1';
        
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        rst <= '0';
        rd_reg <= "001";
        
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        wr_src <= "1111111111111111";
        wr_reg <= "000";
        wr_en <= '1';
        
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        rd_reg <= "000";
        
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        wr_src <= "1111111111111111";
        wr_reg <= "100";
        wr_en <= '1';
        
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;

        rd_reg <= "100";

        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
        
    END PROCESS;
END;