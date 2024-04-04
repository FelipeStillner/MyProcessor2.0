library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
    port( 
        sel0                : in std_logic;
        sel1                : in std_logic;
        in0,in1,in2,in3     : in std_logic;
        out0                : out std_logic
    );
end entity;

architecture behaviour of mux4 is

begin
    out0 <= in0    when sel1='0' and sel0='0' else
            in1    when sel1='0' and sel0='1' else
            in2    when sel1='1' and sel0='0' else
            in3    when sel1='1' and sel0='1' else
            '0'; 
end architecture;