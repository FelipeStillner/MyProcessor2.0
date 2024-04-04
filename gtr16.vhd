library ieee;
use ieee.std_logic_1164.all;

entity gtr16 is
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        cout    : out std_logic -- in0 > in1
    );
end entity;

architecture behaviour of gtr16 is

    component gtru16 is
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic_vector(15 downto 0);
            cout    : out std_logic
        );
    end component;

    component mux4 is
        port( 
            sel0                : in std_logic;
            sel1                : in std_logic;
            in0,in1,in2,in3     : in std_logic;
            out0                : out std_logic
        );
    end component;

    signal tmp0 : std_logic;
    signal pp   : std_logic;
    signal pn   : std_logic;
    signal np   : std_logic;
    signal nn   : std_logic;

begin
    tmp0 <= '0';
    np <= '1';
    pn <= '0';
    GTRU160 : gtru16 port map (tmp0, in0, in1, pp);
    nn <= pp;
    MUX40   : mux4 port map (in0(15), in1(15), pp, pn, np, nn, cout);
end architecture;