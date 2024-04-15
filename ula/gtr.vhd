LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY gtr IS
    PORT (
        cin : IN STD_LOGIC;
        in0, in1 : IN STD_LOGIC;
        cout : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF gtr IS
BEGIN
    cout <= (cin AND in0) OR ((NOT in1) AND (cin OR in0));
END ARCHITECTURE;