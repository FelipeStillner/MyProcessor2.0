LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY rom IS
    PORT (
        clk : IN STD_LOGIC;
        endereco : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        dado : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE a_rom OF rom IS
    TYPE mem IS ARRAY (0 TO 127) OF STD_LOGIC_VECTOR(11 DOWNTO 0);
    CONSTANT conteudo_rom : mem := (
        -- caso endereco => conteudo
        0 => "000000000010",
        1 => "100000000000",
        2 => "000000000000",
        3 => "000000000000",
        4 => "100000000000",
        5 => "000000000010",
        6 => "111100000011",
        7 => "000000000010",
        8 => "000000000010",
        9 => "000000000000",
        10 => "000000000000",
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