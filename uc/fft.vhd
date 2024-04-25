LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY fft IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        data_out : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF fft IS
    SIGNAL registro : STD_LOGIC;
BEGIN
    PROCESS (clk, rst) -- acionado se houver mudança em clk, rst ou wr_en
    BEGIN
        IF rst = '1' THEN
            registro <= '0';
        ELSIF rising_edge(clk) THEN
            registro <= NOT registro;
        END IF;
    END PROCESS;

    data_out <= registro; -- conexao direta, fora do processo
END ARCHITECTURE;