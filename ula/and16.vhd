LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and16 IS
    PORT (
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE behaviour OF and16 IS
BEGIN
    out0 <= in0 AND in1;
END ARCHITECTURE;