LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY sub16 IS
    PORT (
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
        cout : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF sub16 IS

    COMPONENT sum16 IS
        PORT (
            cin : IN STD_LOGIC;
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
            cout : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT xor16 IS
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL cin : STD_LOGIC_VECTOR(15 DOWNTO 0);
    SIGNAL tmp : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    cin <= "1111111111111111";
    XOR160 : xor16 PORT MAP(in1, cin, tmp);
    SUM160 : sum16 PORT MAP(cin(1), in0, tmp, out0, cout);
END ARCHITECTURE;