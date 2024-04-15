LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sum IS
    PORT (
        cin : IN STD_LOGIC;
        in0, in1 : IN STD_LOGIC;
        out0 : OUT STD_LOGIC;
        cout : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF sum IS
BEGIN
    out0 <= cin XOR (in0 XOR in1);
    cout <= (cin AND (in0 XOR in1)) OR (in0 AND in1);
END ARCHITECTURE;