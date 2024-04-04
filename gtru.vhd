library ieee;
use ieee.std_logic_1164.all;

entity gtru is
    port( 
        cin     : in std_logic;
        in0,in1 : in std_logic;
        cout    : out std_logic
    );
end entity;

architecture behaviour of gtru is
begin
    cout <= (cin and in0) or ((not in1) and (cin or in0));
end architecture;