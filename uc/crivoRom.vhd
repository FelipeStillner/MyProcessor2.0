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
        0 => "0100000001000100",
        1 => "0000000100100100",
        2 => "0000000000111000",
        3 => "0000000000110000",
        4 => "0000000000111000",
        5 => "0000000100001111",
        6 => "0000000000111100",
        7 => "0000000001011000",
        8 => "1111101000100010",
        9 => "0000001011100100",

        10 => "0000000000000000",
        11 => "0000000011111000",
        12 => "0000000011011100",
        13 => "0000000001111100",
        14 => "0000000011111000",
        15 => "0000000011011000",
        16 => "0000000011101101",
        17 => "0000000011011100",
        18 => "0000000011011000",
        19 => "0000000000010000",
        20 => "0000000001011000",
        21 => "1111101011000110",
        22 => "0000000000000000",

        23 => "0000000011111000",
        24 => "0000000100001111",
        25 => "0000000011111100",
        26 => "0000000011111000",
        27 => "0001000011000110",
        28 => "0000000011111000",
        29 => "0000000010110100",
        30 => "0000000010111000",
        31 => "0000001000000010",
        32 => "0001011000001110",
        33 => "0000101000001110",
        34 => "0000000000000000",
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