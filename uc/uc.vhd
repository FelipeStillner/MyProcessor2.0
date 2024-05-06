LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY uc IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        state : OUT STD_LOGIC;
        addr : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
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
            dado : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT fft IS
        PORT (
            clk : IN STD_LOGIC;
            rst : IN STD_LOGIC;
            data_out : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL trash, jump_en : STD_LOGIC;
    SIGNAL data_in, sum_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
    SIGNAL opcode : STD_LOGIC_VECTOR(4 DOWNTO 0);
    SIGNAL imm : STD_LOGIC_VECTOR(15 DOWNTO 0);
BEGIN
    STM : fft PORT MAP(clk, rst, state);
    SUM : sum7 PORT MAP('0', addr, "0000001", sum_out, trash);
    PC : reg7 PORT MAP(not state, rst, '1', data_in, addr);
    ROM0 : rom PORT MAP(state, addr, data);

    imm <= data(31 downto 16);
    opcode <= data(4 downto 0);

    data_in <= imm(6 downto 0) when jump_en else
                sum_out;

    jump_en <=  '1' when opcode="11111" else
               '0';
END ARCHITECTURE;