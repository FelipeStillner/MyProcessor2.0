LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux4 IS
    PORT (
        sel0 : IN STD_LOGIC;
        sel1 : IN STD_LOGIC;
        in0, in1, in2, in3 : IN STD_LOGIC;
        out0 : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF mux4 IS

BEGIN
    out0 <= in0 WHEN sel1 = '0' AND sel0 = '0' ELSE
        in1 WHEN sel1 = '0' AND sel0 = '1' ELSE
        in2 WHEN sel1 = '1' AND sel0 = '0' ELSE
        in3 WHEN sel1 = '1' AND sel0 = '1' ELSE
        '0';
END ARCHITECTURE;