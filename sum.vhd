library ieee;
use ieee.std_logic_1164.all;

entity sum is
    port( 
        cin     : in std_logic;
        in0,in1 : in std_logic;
        out0    : out std_logic;
        cout    : out std_logic
    );
end entity;

architecture behaviour of sum is
begin
    out0 <= cin xor (in0 xor in1);
    cout <= (cin and (in0 xor in1)) or (in0 and in1);
end architecture;