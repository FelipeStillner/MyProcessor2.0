LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ula IS
    PORT (
        sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        eq : OUT STD_LOGIC;
        gtr : OUT STD_LOGIC;
        cout_sum : OUT STD_LOGIC;
        cout_sub : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF ula IS

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

BEGIN
    -- Nothing Important
    nop <= "0000000000000000";

    -- Operations Components
    AND160 : and16 PORT MAP(in0, in1, s_and16);
    OR160 : or16 PORT MAP(in0, in1, s_or16);
    XOR160 : xor16 PORT MAP(in0, in1, s_xor16);
    SUM160 : sum16 PORT MAP('0', in0, in1, s_sum16, cout_sum);
    SUB60 : sub16 PORT MAP(in0, in1, s_sub16, cout_sub);
    LFT60 : leftshift16 PORT MAP(in0, in1, s_lft16);

    -- Select Operation output
    MUX160 : mux16 PORT MAP(sel, s_and16, s_or16, s_xor16, s_sum16, s_sub16, s_lft16, nop, nop, nop, nop, nop, nop, nop, nop, nop, nop, out0);

    -- Flags for comparison
    EQ160 : eq16 PORT MAP(in0, in1, eq);
    GTR160 : gtr16 PORT MAP(in0, in1, gtr);
END ARCHITECTURE;