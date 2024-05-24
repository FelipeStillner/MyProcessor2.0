LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processor0 IS
    PORT (
        clk, rst : IN STD_LOGIC;
        state : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        pc : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        instruction : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        reg3, reg4, reg5: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        accData: OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        ula_out: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
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
            cout_sub : OUT STD_LOGIC;
            cond : OUT STD_LOGIC
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
            data_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            reg3, reg4, reg5: OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
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

    COMPONENT uc IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            execute : OUT STD_LOGIC;
            imm : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            reg : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            sel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
            muxUla, muxReg, muxAcc : OUT STD_LOGIC;
            clkReg, clkAcc : OUT STD_LOGIC;
            wrenReg, wrenAcc : OUT STD_LOGIC;
            state : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
            pc : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            instruction : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            cond : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL s0, s1 : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL eq, gtr, cout_sum, cout_sub, cond : STD_LOGIC;

    SIGNAL wrenReg : STD_LOGIC;
    SIGNAL srcReg : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL r : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL regData : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL wrenAcc : STD_LOGIC;
    SIGNAL srcAcc : STD_LOGIC_VECTOR(15 DOWNTO 0);

    SIGNAL execute : STD_LOGIC;
    SIGNAL imm : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL reg : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL muxUla, muxReg, muxAcc : STD_LOGIC;
    SIGNAL clkReg, clkAcc : STD_LOGIC;

BEGIN
    ACC : reg16 PORT MAP(clkAcc, rst, wrenAcc, srcAcc, accData);
    REGBANK0 : regbank PORT MAP(execute, rst, wrenReg, srcReg, r, r, regData, reg3, reg4, reg5);
    ULA0 : ula PORT MAP(sel, accData, s1, ula_out, eq, gtr, cout_sum, cout_sub, cond);
    UC0 : uc PORT MAP(clk, rst, execute, imm, r, sel, muxUla, muxReg, muxAcc, clkReg, clkAcc, wrenReg, wrenAcc, state, pc, instruction, cond);

    MUXULA0 : mux PORT MAP(muxUla, regData, imm, s1);
    MUXACC0 : mux PORT MAP(muxAcc, ula_out, regData, srcAcc);
    MUXREG0 : mux PORT MAP(muxReg, accData, imm, srcReg);
END;