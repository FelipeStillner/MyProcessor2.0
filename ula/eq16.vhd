LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eq16 IS
    PORT (
        in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
        cout : OUT STD_LOGIC
    );
END ENTITY;

ARCHITECTURE behaviour OF eq16 IS

    COMPONENT xor16 IS
        PORT (
            in0, in1 : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
            out0 : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL x : STD_LOGIC_VECTOR(15 DOWNTO 0);

BEGIN
    XOR0 : xor16 PORT MAP(in0, in1, x);
    cout <= NOT(x(0) OR x(1) OR x(2) OR x(3) OR x(4) OR x(5) OR x(6) OR x(7) OR x(8) OR x(9) OR x(10) OR x(11) OR x(12) OR x(13) OR x(14) OR x(15));
END ARCHITECTURE;