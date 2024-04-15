LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux16 IS
    PORT (
        sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        in0, in1, in2, in3 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        in4, in5, in6, in7 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        in8, in9, inA, inB : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        inC, inD, inE, inF : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF mux16 IS

BEGIN
    out0 <= in0 WHEN sel = "0000" ELSE
        in1 WHEN sel = "0001" ELSE
        in2 WHEN sel = "0010" ELSE
        in3 WHEN sel = "0011" ELSE
        in4 WHEN sel = "0100" ELSE
        in5 WHEN sel = "0101" ELSE
        in6 WHEN sel = "0110" ELSE
        in7 WHEN sel = "0111" ELSE
        in8 WHEN sel = "1000" ELSE
        in9 WHEN sel = "1001" ELSE
        inA WHEN sel = "1010" ELSE
        inB WHEN sel = "1011" ELSE
        inC WHEN sel = "1100" ELSE
        inD WHEN sel = "1101" ELSE
        inE WHEN sel = "1110" ELSE
        inF WHEN sel = "1111" ELSE
        "0000000000000000";
END ARCHITECTURE;