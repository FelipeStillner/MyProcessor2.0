library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port( 
        sel     : in std_logic;
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behaviour of mux is
begin
    out0 <= in0    when sel='0' else
            in1    when sel='1' else
            "0000000000000000"; 
end architecture;