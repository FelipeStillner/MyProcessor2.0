LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xor16 IS
    PORT (
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF xor16 IS
BEGIN
    out0 <= in0 XOR in1;
END ARCHITECTURE;