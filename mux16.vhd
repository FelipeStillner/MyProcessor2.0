library ieee;
use ieee.std_logic_1164.all;

entity mux16 is
    port( 
        sel                 : in std_logic_vector(3 downto 0);
        in0,in1,in2,in3     : in std_logic_vector(15 downto 0);
        in4,in5,in6,in7     : in std_logic_vector(15 downto 0);
        in8,in9,inA,inB     : in std_logic_vector(15 downto 0);
        inC,inD,inE,inF     : in std_logic_vector(15 downto 0);
        out0                : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behaviour of mux16 is

begin
    out0 <= in0    when sel="0000" else
            in1    when sel="0001" else
            in2    when sel="0010" else
            in3    when sel="0011" else
            in4    when sel="0100" else
            in5    when sel="0101" else
            in6    when sel="0110" else
            in7    when sel="0111" else
            in8    when sel="1000" else
            in9    when sel="1001" else
            inA    when sel="1010" else
            inB    when sel="1011" else
            inC    when sel="1100" else
            inD    when sel="1101" else
            inE    when sel="1110" else
            inF    when sel="1111" else
            "0000000000000000"; 
end architecture;