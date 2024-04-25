LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processor0 IS
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
END ENTITY;

ARCHITECTURE behaviour OF processor0 IS
    COMPONENT ula IS
        PORT (
            sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            eq : OUT STD_LOGIC;
            gtr : OUT STD_LOGIC;
            cout_sum : OUT STD_LOGIC;
            cout_sub : OUT STD_LOGIC
        );
    END COMPONENT;

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

    COMPONENT reg16 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT mux IS
        PORT (
            sel : IN STD_LOGIC;
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL acu, regbank_in, regbank_out : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL eq, gtr, cout_sum, cout_sub : STD_LOGIC;
BEGIN
    MUX0 : mux PORT MAP(sel_wr, imm, ula_out, regbank_in);
    REG160 : reg16 PORT MAP(clk, rst, wr_en_acc, ula_out, acu);
    REGBANK0 : regbank PORT MAP(clk, rst, wr_en_regbank, regbank_in, wr_reg, rd_reg, regbank_out);
    ULA0 : ula PORT MAP(sel, regbank_out, acu, ula_out, eq, gtr, cout_sum, cout_sub);
END;