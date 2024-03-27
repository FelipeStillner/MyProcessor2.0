library ieee;
use ieee.std_logic_1164.all;

entity eq16 is
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
end entity;

architecture behaviour of eq16 is

    component xor16 is
        port( 
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0)
        );
    end component;

    signal x : std_logic_vector(15 downto 0);

begin
    XOR0 : xor16 port map(in0, in1, x);
    cout <= not(x(0) or x(1) or x(2) or x(3) or x(4) or x(5) or x(6) or x(7) or x(8) or x(9) or x(10) or x(11) or x(12) or x(13) or x(14) or x(15));
end architecture;