LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sum7 IS
    PORT (
        cin : IN STD_LOGIC;
        in0, in1 : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        cout : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF sum7 IS

    COMPONENT sum IS
        PORT (
            cin : IN STD_LOGIC;
            in0, in1 : IN STD_LOGIC;
            out0 : OUT STD_LOGIC;
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL tmp : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN
    SUM0 : sum PORT MAP(cin, in0(0), in1(0), out0(0), tmp(0));
    SUM1 : sum PORT MAP(tmp(0), in0(1), in1(1), out0(1), tmp(1));
    SUM2 : sum PORT MAP(tmp(1), in0(2), in1(2), out0(2), tmp(2));
    SUM3 : sum PORT MAP(tmp(2), in0(3), in1(3), out0(3), tmp(3));
    SUM4 : sum PORT MAP(tmp(3), in0(4), in1(4), out0(4), tmp(4));
    SUM5 : sum PORT MAP(tmp(4), in0(5), in1(5), out0(5), tmp(5));
    SUM6 : sum PORT MAP(tmp(5), in0(6), in1(6), out0(6), tmp(6));
    cout <= tmp(6);
END ARCHITECTURE;