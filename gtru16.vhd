library ieee;
use ieee.std_logic_1164.all;

entity gtru16 is
    port( 
        cin     : in std_logic;
        in0,in1 : in std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
end entity;

architecture behaviour of gtru16 is

    component gtru is
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic;
            cout    : out std_logic
        );
    end component;

    signal tmp : std_logic_vector(15 downto 1);

begin
    GRTU0 : gtru port map (cin    , in0(0) , in1(0) , tmp(1));
    GRTU1 : gtru port map (tmp(1) , in0(1) , in1(1) , tmp(2));
    GRTU2 : gtru port map (tmp(2) , in0(2) , in1(2) , tmp(3));
    GRTU3 : gtru port map (tmp(3) , in0(3) , in1(3) , tmp(4));
    GRTU4 : gtru port map (tmp(4) , in0(4) , in1(4) , tmp(5));
    GRTU5 : gtru port map (tmp(5) , in0(5) , in1(5) , tmp(6));
    GRTU6 : gtru port map (tmp(6) , in0(6) , in1(6) , tmp(7));
    GRTU7 : gtru port map (tmp(7) , in0(7) , in1(7) , tmp(8));
    GRTU8 : gtru port map (tmp(8) , in0(8) , in1(8) , tmp(9));
    GRTU9 : gtru port map (tmp(9) , in0(9) , in1(9) , tmp(10));
    GRTUA : gtru port map (tmp(10), in0(10), in1(10), tmp(11));
    GRTUB : gtru port map (tmp(11), in0(11), in1(11), tmp(12));
    GRTUC : gtru port map (tmp(12), in0(12), in1(12), tmp(13));
    GRTUD : gtru port map (tmp(13), in0(13), in1(13), tmp(14));
    GRTUE : gtru port map (tmp(14), in0(14), in1(14), tmp(15));
    GRTUF : gtru port map (tmp(15), in0(15), in1(15), cout);
end architecture;