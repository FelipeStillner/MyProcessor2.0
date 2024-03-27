library ieee;
use ieee.std_logic_1164.all;

entity and16 is
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behaviour of and16 is
begin
    out0 <= in0 and in1;
end architecture;