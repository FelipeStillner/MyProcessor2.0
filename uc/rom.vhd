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
    TYPE mem IS ARRAY (0 TO 127) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
    CONSTANT conteudo_rom : mem := (
        -- caso endereco => conteudo
        0 => "0000010101100100",
        1 => "0000100010000100",
        2 => "0000000001111000",
        3 => "0000000010001101",
        4 => "0000000010111100",
        5 => "0000000010111000",
        6 => "0000000100010011",
        7 => "0000000010111100",
        8 => "0001010000001110",
        9 => "0000000000011000",
        10 => "0000000010111100",
        11 => "0000000000000000",
        12 => "0000000000000000",
        13 => "0000000000000000",
        14 => "0000000000000000",
        15 => "0000000000000000",
        16 => "0000000000000000",
        17 => "0000000000000000",
        18 => "0000000000000000",
        19 => "0000000000000000",
        20 => "0000000010111000",
        21 => "0000000001111100",
        22 => "0000001000001110",
        23 => "0000000000011000",
        24 => "0000000010111100",
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