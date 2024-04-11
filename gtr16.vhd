library ieee;
use ieee.std_logic_1164.all;

entity gtr16 is
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
end entity;

architecture behaviour of gtr16 is

    component gtr is
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic;
            cout    : out std_logic
        );
    end component;

    signal tmp : std_logic_vector(15 downto 1);
    signal cin : std_logic;

begin
    cin <= '0';
    GRT0 : gtr port map (cin    , in0(0) , in1(0) , tmp(1));
    GRT1 : gtr port map (tmp(1) , in0(1) , in1(1) , tmp(2));
    GRT2 : gtr port map (tmp(2) , in0(2) , in1(2) , tmp(3));
    GRT3 : gtr port map (tmp(3) , in0(3) , in1(3) , tmp(4));
    GRT4 : gtr port map (tmp(4) , in0(4) , in1(4) , tmp(5));
    GRT5 : gtr port map (tmp(5) , in0(5) , in1(5) , tmp(6));
    GRT6 : gtr port map (tmp(6) , in0(6) , in1(6) , tmp(7));
    GRT7 : gtr port map (tmp(7) , in0(7) , in1(7) , tmp(8));
    GRT8 : gtr port map (tmp(8) , in0(8) , in1(8) , tmp(9));
    GRT9 : gtr port map (tmp(9) , in0(9) , in1(9) , tmp(10));
    GRTA : gtr port map (tmp(10), in0(10), in1(10), tmp(11));
    GRTB : gtr port map (tmp(11), in0(11), in1(11), tmp(12));
    GRTC : gtr port map (tmp(12), in0(12), in1(12), tmp(13));
    GRTD : gtr port map (tmp(13), in0(13), in1(13), tmp(14));
    GRTE : gtr port map (tmp(14), in0(14), in1(14), tmp(15));
    GRTF : gtr port map (tmp(15), in0(15), in1(15), cout);
end architecture;