LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ula IS
    PORT (
        sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        clk : IN STD_LOGIC;
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        carry, neg, over : OUT STD_LOGIC;
        cond : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF ula IS

    COMPONENT reg1 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en : IN STD_LOGIC;
            data_in : IN STD_LOGIC;
            data_out : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT and16
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT gtr16 IS
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            cout : OUT STD_LOGIC -- in0 > in1
        );
    END COMPONENT;

    COMPONENT eq16 IS
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            cout : OUT STD_LOGIC -- in0 == in1
        );
    END COMPONENT;

    COMPONENT mux16 IS
        PORT (
            sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            in0, in1, in2, in3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            in4, in5, in6, in7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            in8, in9, inA, inB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            inC, inD, inE, inF : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT or16
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT sub16
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT sum16
        PORT (
            cin : IN STD_LOGIC;
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT xor16 IS
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT leftshift16 IS
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL s_and16, s_or16, s_xor16, s_sum16, s_sub16, s_lft16 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL nop : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL cout_sub, a, cout_sum, cout, eq, gtr : STD_LOGIC;

BEGIN
    -- Nothing Important
    nop <= "0000000000000000";

    -- Operations Components
    AND160 : and16 PORT MAP(in0, in1, s_and16);
    OR160 : or16 PORT MAP(in0, in1, s_or16);
    XOR160 : xor16 PORT MAP(in0, in1, s_xor16);
    SUM160 : sum16 PORT MAP('0', in0, in1, s_sum16, cout_sum);
    SUB60 : sub16 PORT MAP(in0, in1, s_sub16, a);
    LFT60 : leftshift16 PORT MAP(in0, in1, s_lft16);

    -- Select Operation output
    MUX160 : mux16 PORT MAP(sel, s_and16, s_or16, s_xor16, s_sum16, s_sub16, s_lft16, in0, in0, in0, in0, in0, in0, in0, in0, in0, in0, out0);

    -- Flags 
    EQ160 : eq16 PORT MAP(in0, in1, eq);
    GTR160 : gtr16 PORT MAP(in0, in1, gtr);
    CAR0 : reg1 PORT MAP(clk, '0', '1', cout, carry);
    NEG0 : reg1 PORT MAP(clk, '0', '1', out0(15), neg);
    OVER0 : reg1 PORT MAP(clk, '0', '1', '0', over);

    cond <= NOT eq WHEN sel = "1000" ELSE
        gtr WHEN sel = "1001" ELSE
        '0';

    cout <= cout_sum WHEN sel = "0011" ELSE
        cout_sub WHEN sel = "0100" ELSE
        '0';
    cout_sub <= '0' WHEN (Unsigned(in0) <= Unsigned(in1)) ELSE
        '1';
END ARCHITECTURE;