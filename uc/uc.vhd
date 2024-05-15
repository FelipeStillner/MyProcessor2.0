LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uc IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        ld : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        sel : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        muxUla : 
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

    SIGNAL trash, jump_en, fetch, decode, execute : STD_LOGIC;
    SIGNAL data_in, sum_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL data : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL addr : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL state : STD_LOGIC_VECTOR(1 DOWNTO 0);
    SIGNAL opc : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL imm : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL reg : STD_LOGIC_VECTOR(2 DOWNTO 0);

BEGIN
    STM : maq_estados PORT MAP(clk, rst, state);
    SUM : sum7 PORT MAP('0', addr, "0000001", sum_out, trash);
    PC : reg7 PORT MAP(decode, rst, '1', data_in, addr);
    ROM0 : rom PORT MAP(fetch, addr, data);

    opc <= data(4 DOWNTO 0);
    reg <= data(7 DOWNTO 5);
    imm <= data(15 DOWNTO 8);

    data_in <= imm(6 downto 0) when jump_en else
                sum_out;
    jump_en <=  '1' when op="10" else
               '0';
    
    fetch <= '1' when state = "00" else 
            '0';
    decode <= '1' when state = "01" else 
            '0';
    execute <= '1' when state = "10" else 
            '0';

    
    
    -- ULA        
    sel <= '0' & opc(4 downto 2) when opc(0) = '0' else 
            "0000";

END ARCHITECTURE;