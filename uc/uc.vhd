LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uc IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        execute : OUT STD_LOGIC;
        imm : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        reg : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        sel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        muxUla, muxReg, muxAcc : OUT STD_LOGIC;
        clkReg, clkAcc, clkUla : OUT STD_LOGIC;
        wrenReg, wrenAcc : OUT STD_LOGIC;
        state : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        pc : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        instruction : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        cond : IN STD_LOGIC;
        carry, neg, over, zero, one : IN STD_LOGIC;
        wrenRam, muxReg2 : OUT STD_LOGIC;
        djnz : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE a_uc OF uc IS
    COMPONENT reg7 IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            wr_en : IN STD_LOGIC;
            data_in : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            data_out : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
    END COMPONENT;
    COMPONENT sum7
        PORT (
            cin : IN STD_LOGIC;
            in0, in1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;
    COMPONENT rom IS
        PORT (
            clk : IN STD_LOGIC;
            endereco : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
            dado : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT maq_estados IS
        PORT (
            clk, rst : IN STD_LOGIC;
            estado : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL trash, jump_en, fetch, decode : STD_LOGIC;
    SIGNAL data_in, sum_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL addr, next_addr : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL opc : STD_LOGIC_VECTOR(4 DOWNTO 0);

BEGIN
    STM : maq_estados PORT MAP(clk, rst, state);
    SUM : sum7 PORT MAP('0', addr, next_addr, sum_out, trash);
    PC0 : reg7 PORT MAP(decode, rst, '1', data_in, addr);
    ROM0 : rom PORT MAP(fetch, addr, data);

    pc <= addr;
    instruction <= data;

    opc <= data(4 DOWNTO 0);
    reg <= data(7 DOWNTO 5);
    imm <= data(15 DOWNTO 8) & "00000000" WHEN opc = "01100" ELSE
        "00000000" & data(15 DOWNTO 8);

    data_in <= imm(6 DOWNTO 0) WHEN jump_en ELSE
        sum_out;
    jump_en <= '1' WHEN opc = "01110" ELSE
        '0';
    -- ULA        
    sel <= (NOT opc(0)) & opc(4 DOWNTO 2) WHEN opc(0) = '1' OR opc(1 DOWNTO 0) = "10" ELSE
        "0011" WHEN opc = "10100" OR opc = "10000" ELSE
        "1111";

    -- MUX
    muxUla <= '1' WHEN opc(1 DOWNTO 0) = "11" OR opc = "10000" OR opc = "10100" ELSE
        '0';
    muxAcc <= '1' WHEN opc = "11000" ELSE
        '0';
    muxReg <= '1' WHEN opc = "00100" OR opc = "01100" ELSE
        '0';
    muxReg2 <= '1' WHEN opc = "10100" ELSE
        '0';

    -- WREN
    wrenReg <= '1' WHEN opc = "00100" OR opc = "01100" OR opc = "11100" OR opc = "10100" OR opc = "11110" ELSE
        '0';
    wrenAcc <= '1';
    wrenRam <= '1' WHEN opc = "10000" ELSE
        '0';

    -- clks
    clkReg <= clk;
    clkAcc <= execute;
    clkUla <= '1' WHEN (execute = '1') AND ((opc(0) = '1') OR opc = "11110") ELSE
        '0';

    -- Branch relativo
    next_addr <= imm(6 DOWNTO 0) WHEN (opc(1 DOWNTO 0) = "10" AND cond = '1') ELSE
        imm(6 DOWNTO 0) WHEN (opc = "10010" AND carry = '1') ELSE
        imm(6 DOWNTO 0) WHEN (opc = "10110" AND neg = '1') ELSE
        imm(6 DOWNTO 0) WHEN (opc = "11010" AND over = '1') ELSE
        imm(6 DOWNTO 0) WHEN (opc = "11110" AND one = '0') ELSE
        imm(6 DOWNTO 0) WHEN (opc = "00010" AND zero = '1') ELSE
        "0000001";

    -----------------------------------------------------------

    fetch <= '1' WHEN state = "00" ELSE
        '0';
    decode <= '1' WHEN state = "10" ELSE
        '0';
    execute <= '1' WHEN state = "01" ELSE
        '0';

    djnz <= '1' WHEN opc = "11110" ELSE
        '0';
END ARCHITECTURE;