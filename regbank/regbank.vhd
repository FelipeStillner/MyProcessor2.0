LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY regbank IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        wr_en : IN STD_LOGIC;
        wr_src : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        wr_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        rd_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        reg3, reg4, reg5: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF regbank IS

    COMPONENT reg16 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL wr_en_vec : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL reg_out0 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out2 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out3 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out4 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out5 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out6 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg_out7 : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    REG160 : reg16 PORT MAP(clk, '1', wr_en_vec(0), wr_src, reg_out0);
    REG161 : reg16 PORT MAP(clk, rst, wr_en_vec(1), wr_src, reg_out1);
    REG162 : reg16 PORT MAP(clk, rst, wr_en_vec(2), wr_src, reg_out2);
    REG163 : reg16 PORT MAP(clk, rst, wr_en_vec(3), wr_src, reg_out3);
    REG164 : reg16 PORT MAP(clk, rst, wr_en_vec(4), wr_src, reg_out4);
    REG165 : reg16 PORT MAP(clk, rst, wr_en_vec(5), wr_src, reg_out5);
    REG166 : reg16 PORT MAP(clk, rst, wr_en_vec(6), wr_src, reg_out6);
    REG167 : reg16 PORT MAP(clk, rst, wr_en_vec(7), wr_src, reg_out7);

    data_out <= reg_out0 WHEN rd_reg = "000" ELSE
        reg_out1 WHEN rd_reg = "001" ELSE
        reg_out2 WHEN rd_reg = "010" ELSE
        reg_out3 WHEN rd_reg = "011" ELSE
        reg_out4 WHEN rd_reg = "100" ELSE
        reg_out5 WHEN rd_reg = "101" ELSE
        reg_out6 WHEN rd_reg = "110" ELSE
        reg_out7 WHEN rd_reg = "111" ELSE
        "0000000000000000";

    wr_en_vec <= "00000001" WHEN wr_reg = "000" AND wr_en = '1' ELSE
        "00000010" WHEN wr_reg = "001" AND wr_en = '1' ELSE
        "00000100" WHEN wr_reg = "010" AND wr_en = '1' ELSE
        "00001000" WHEN wr_reg = "011" AND wr_en = '1' ELSE
        "00010000" WHEN wr_reg = "100" AND wr_en = '1' ELSE
        "00100000" WHEN wr_reg = "101" AND wr_en = '1' ELSE
        "01000000" WHEN wr_reg = "110" AND wr_en = '1' ELSE
        "10000000" WHEN wr_reg = "111" AND wr_en = '1' ELSE
        "00000000";

    reg3 <= reg_out3;
    reg4 <= reg_out4;
    reg5 <= reg_out5;

END ARCHITECTURE;