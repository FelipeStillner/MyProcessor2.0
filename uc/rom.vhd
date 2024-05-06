LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY rom IS
    PORT (
        clk : IN STD_LOGIC;
        endereco : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dado : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE a_rom OF rom IS
    TYPE mem IS ARRAY (0 TO 127) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
    CONSTANT conteudo_rom : mem := (
        -- caso endereco => conteudo
        0 => "00000000000000000000000000000000",
        1 => "00000000000001000000000100011111",
        2 => "00000000000000000000001000000000",
        3 => "00000000000000000000001100000000",
        4 => "00000000000000000000010000000000",
        5 => "00000000000000000000010100000000",
        6 => "00000000000010000000011000011111",
        7 => "00000000000000000000011100000000",
        8 => "00000000000000000000100000000000",
        9 => "00000000000000000000100100000000",
        10 => "00000000000000000000101000011111",
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