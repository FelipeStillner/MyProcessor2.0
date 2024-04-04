library ieee;
use ieee.std_logic_1164.all;

entity sub16 is
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
end entity;

architecture behaviour of sub16 is

    component sum16 is
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0);
            cout    : out std_logic
        );
    end component;

    component xor16 is
        port( 
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0)
        );
    end component;

    signal cin    : std_logic_vector(15 downto 0);
    signal tmp    : std_logic_vector(15 downto 0);

begin
    cin <= "1111111111111111";
    XOR160 : xor16 port map (in1, cin, tmp);
    SUM160 : sum16 port map (cin(1), in0, tmp, out0, cout);
end architecture;