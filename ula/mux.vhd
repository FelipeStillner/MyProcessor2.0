LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux IS
    PORT (
        sel : IN STD_LOGIC;
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF mux IS
BEGIN
    out0 <= in0 WHEN sel = '0' ELSE
        in1 WHEN sel = '1' ELSE
        "0000000000000000";
END ARCHITECTURE;