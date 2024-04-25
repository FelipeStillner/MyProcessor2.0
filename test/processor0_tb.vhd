LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY processor0_tb IS
END ENTITY;

ARCHITECTURE testbench OF processor0_tb IS
    COMPONENT processor0 IS
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
    PROC0 : processor0 PORT MAP(sel, imm, sel_wr, clk, rst, wr_en_regbank, wr_en_acc, wr_reg, rd_reg, ula_out);

    PROCESS
    BEGIN
        -- Reseta o banco de registradores e o acumulador
        rst <= '1';
        WAIT FOR 5 ns;
        rst <= '0';

        -- Escreve no reg1 o imediato e já le e coloca em uma entrada da ula
        -- Realiza a operação OR na ULA entre o valor do reg1 e o valor no acumulador
        -- imm = 1248, 
        -- reg1 = imm = 1248, 
        -- in0 = reg1 = 1248,
        -- in1 = acu = 0000,
        -- Ula_out = in0 or in1 = 1248
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

        -- Escreve no acumulador o resultado da ULA
        -- acu = ula_out = 1248
        wr_en_acc <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;

        -- Escreve no reg2 o imediato e já le e coloca em uma entrada da ula
        -- Realiza a operação OR na ULA entre o valor do reg2 e o valor no acumulador
        -- imm = 8421, 
        -- reg2 = imm = 8421, 
        -- in0 = reg2 = 8421,
        -- in1 = acu = 1248,
        -- ula_out = in0 or in1 = 9669
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

        -- Escreve no acumulador o resultado da ULA
        -- acu = ula_out = 9669
        wr_en_acc <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;

        -- Le o valor do reg1 coloca em uma entrada da ula
        -- Realiza a operação Soma na ULA entre o valor do reg1 e o valor no acumulador
        -- in0 = reg1 = 1248,
        -- in1 = acu = 9669,
        -- ula_out = in0 + in1 = A8B1
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

        -- Escreve no acumulador o resultado da ULA
        -- Escreve no reg4 o resultado da ula
        -- acu = ula_out = A8B1
        -- reg4 = ula_out = A8B1
        wr_reg <= "100";
        wr_en_regbank <= '1';
        wr_en_acc <= '1';
        clk <= '0';
        WAIT FOR 5 ns;
        clk <= '1';
        WAIT FOR 5 ns;
        wr_en_acc <= '0';

    END PROCESS;
END;