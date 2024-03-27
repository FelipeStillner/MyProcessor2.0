library ieee;
use ieee.std_logic_1164.all;

entity sum16 is
    port( 
        cin     : in std_logic;
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
end entity;

architecture behaviour of sum16 is

    component sum is
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic;
            out0    : out std_logic;
            cout    : out std_logic
        );
    end component;

    signal tmp : std_logic_vector(15 downto 0);

begin
    SUM0 : sum port map (cin    , in0(0) , in1(0) , out0(0) , tmp(0) );
    SUM1 : sum port map (tmp(0) , in0(1) , in1(1) , out0(1) , tmp(1) );
    SUM2 : sum port map (tmp(1) , in0(2) , in1(2) , out0(2) , tmp(2) );
    SUM3 : sum port map (tmp(2) , in0(3) , in1(3) , out0(3) , tmp(3) );
    SUM4 : sum port map (tmp(3) , in0(4) , in1(4) , out0(4) , tmp(4) );
    SUM5 : sum port map (tmp(4) , in0(5) , in1(5) , out0(5) , tmp(5) );
    SUM6 : sum port map (tmp(5) , in0(6) , in1(6) , out0(6) , tmp(6) );
    SUM7 : sum port map (tmp(6) , in0(7) , in1(7) , out0(7) , tmp(7) );
    SUM8 : sum port map (tmp(7) , in0(8) , in1(8) , out0(8) , tmp(8) );
    SUM9 : sum port map (tmp(8) , in0(9) , in1(9) , out0(9) , tmp(9) );
    SUM10: sum port map (tmp(9) , in0(10), in1(10), out0(10), tmp(10));
    SUM11: sum port map (tmp(10), in0(11), in1(11), out0(11), tmp(11));
    SUM12: sum port map (tmp(11), in0(12), in1(12), out0(12), tmp(12));
    SUM13: sum port map (tmp(12), in0(13), in1(13), out0(13), tmp(13));
    SUM14: sum port map (tmp(13), in0(14), in1(14), out0(14), tmp(14));
    SUM15: sum port map (tmp(14), in0(15), in1(15), out0(15), tmp(15));
    cout <= tmp(15);
end architecture;