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

    signal cin : std_logic_vector(15 downto 0);

begin
    cin(0) <= '0';
    GRT0 : gtr port map (cin(0) , in0(0) , in1(0) , cin(1));
    GRT1 : gtr port map (cin(1) , in0(1) , in1(1) , cin(2));
    GRT2 : gtr port map (cin(2) , in0(2) , in1(2) , cin(3));
    GRT3 : gtr port map (cin(3) , in0(3) , in1(3) , cin(4));
    GRT4 : gtr port map (cin(4) , in0(4) , in1(4) , cin(5));
    GRT5 : gtr port map (cin(5) , in0(5) , in1(5) , cin(6));
    GRT6 : gtr port map (cin(6) , in0(6) , in1(6) , cin(7));
    GRT7 : gtr port map (cin(7) , in0(7) , in1(7) , cin(8));
    GRT8 : gtr port map (cin(8) , in0(8) , in1(8) , cin(9));
    GRT9 : gtr port map (cin(9) , in0(9) , in1(9) , cin(10));
    GRTA : gtr port map (cin(10), in0(10), in1(10), cin(11));
    GRTB : gtr port map (cin(11), in0(11), in1(11), cin(12));
    GRTC : gtr port map (cin(12), in0(12), in1(12), cin(13));
    GRTD : gtr port map (cin(13), in0(13), in1(13), cin(14));
    GRTE : gtr port map (cin(14), in0(14), in1(14), cin(15));
    GRTF : gtr port map (cin(15), in0(15), in1(15), cout);
end architecture;