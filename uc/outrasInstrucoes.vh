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
        0 =>  "0000101000100100", 
        1 =>  "0000000000111110", 
        2 =>  "0000101000100100", 
        3 =>  "0000000000111000", 
        4 =>  "0000001000010011", 
        5 =>  "0000000000111100", 
        6 =>  "1111110100010010", 
        7 =>  "0000101000100100", 
        8 =>  "0000000000111000", 
        9 =>  "0000001000010011", 
        10 => "0000000000111100",
        11 => "1111110100011010",
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