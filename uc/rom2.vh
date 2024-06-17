LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY rom IS
    PORT (
        clk : IN STD_LOGIC;
        endereco : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dado : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE a_rom OF rom IS
    TYPE mem IS ARRAY (-64 TO 127) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    CONSTANT conteudo_rom : mem := (
        -- caso endereco => conteudo
        0 => "0000001000101100", -- LU r1 2     : 00000010 001 01100
        1 => "0000010001001100", -- LU r2 4     : 00000100 010 01100
        2 => "0000000000111000", -- MOVTA r1    : 00000000 001 11000
        3 => "0000000100001111", -- ADDI r0 1   : 00000001 000 01111
        4 => "0000000000111100", -- MOVFA r1    : 00000000 001 11100
        5 => "0000000001011000", -- MOVTA r2    : 00000000 010 11000
        6 => "0000001100001111", -- ADDI r0 3   : 00000011 000 01111
        7 => "0000000001011100", -- MOVFA r2    : 00000000 010 11100
        8 => "0000101001100100", -- LD r3 10    : 00001010 011 00100
        9 => "0000000000000000", -- NOP         : 00000000 000 00000
        10 => "1111111101111110", -- DJNZ r3 -1 : 11111111 011 11110
        -- abaixo: casos omissos => (zero em todos os bits)
        OTHERS => (OTHERS => '0')
    );
BEGIN
    PROCESS (clk)
    BEGIN
        IF (rising_edge(clk)) THEN
            dado <= conteudo_rom(to_integer(signed(endereco)));
        END IF;
    END PROCESS;
END ARCHITECTURE;