LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY gtr16 IS
    PORT (
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        cout : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF gtr16 IS

    COMPONENT gtr IS
        PORT (
            cin : IN STD_LOGIC;
            in0, in1 : IN STD_LOGIC;
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL tmp : STD_LOGIC_VECTOR(15 DOWNTO 1);
    SIGNAL cin : STD_LOGIC;

BEGIN
    cin <= '0';
    GRT0 : gtr PORT MAP(cin, in0(0), in1(0), tmp(1));
    GRT1 : gtr PORT MAP(tmp(1), in0(1), in1(1), tmp(2));
    GRT2 : gtr PORT MAP(tmp(2), in0(2), in1(2), tmp(3));
    GRT3 : gtr PORT MAP(tmp(3), in0(3), in1(3), tmp(4));
    GRT4 : gtr PORT MAP(tmp(4), in0(4), in1(4), tmp(5));
    GRT5 : gtr PORT MAP(tmp(5), in0(5), in1(5), tmp(6));
    GRT6 : gtr PORT MAP(tmp(6), in0(6), in1(6), tmp(7));
    GRT7 : gtr PORT MAP(tmp(7), in0(7), in1(7), tmp(8));
    GRT8 : gtr PORT MAP(tmp(8), in0(8), in1(8), tmp(9));
    GRT9 : gtr PORT MAP(tmp(9), in0(9), in1(9), tmp(10));
    GRTA : gtr PORT MAP(tmp(10), in0(10), in1(10), tmp(11));
    GRTB : gtr PORT MAP(tmp(11), in0(11), in1(11), tmp(12));
    GRTC : gtr PORT MAP(tmp(12), in0(12), in1(12), tmp(13));
    GRTD : gtr PORT MAP(tmp(13), in0(13), in1(13), tmp(14));
    GRTE : gtr PORT MAP(tmp(14), in0(14), in1(14), tmp(15));
    GRTF : gtr PORT MAP(tmp(15), in0(15), in1(15), cout);
END ARCHITECTURE;