LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processor IS
    PORT (
        sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        eq : OUT STD_LOGIC;
        gtr : OUT STD_LOGIC;
        cout_sum : OUT STD_LOGIC;
        cout_sub : OUT STD_LOGIC;
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        wr_en : IN STD_LOGIC;
        wr_src : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        wr_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        rd_reg : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF processor IS
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

BEGIN
END;