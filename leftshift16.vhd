library ieee;
use ieee.std_logic_1164.all;

entity leftshift16 is
    port( 
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behaviour of leftshift16 is
begin
    out0 <= (in0) when (in1 = "0000000000000000") else
           (in0(14 downto 0) & "0") when (in1 = "0000000000000001") else
           (in0(13 downto 0) & "00") when (in1 = "0000000000000010") else
           (in0(12 downto 0) & "000") when (in1 = "0000000000000011") else
           (in0(11 downto 0) & "0000") when (in1 = "0000000000000100") else
           (in0(10 downto 0) & "00000") when (in1 = "0000000000000101") else
           (in0(9 downto 0) & "000000") when (in1 = "0000000000000110") else
           (in0(8 downto 0) & "0000000") when (in1 = "0000000000000111") else
           (in0(7 downto 0) & "00000000") when (in1 = "0000000000001000") else
           (in0(6 downto 0) & "000000000") when (in1 = "0000000000001001") else
           (in0(5 downto 0) & "0000000000") when (in1 = "0000000000001010") else
           (in0(4 downto 0) & "00000000000") when (in1 = "0000000000001011") else
           (in0(3 downto 0) & "000000000000") when (in1 = "0000000000001100") else
           (in0(2 downto 0) & "0000000000000") when (in1 = "0000000000001101") else
           (in0(1 downto 0) & "00000000000000") when (in1 = "0000000000001110") else
           (in0(0 downto 0) & "000000000000000") when (in1 = "0000000000001111") else
           "0000000000000000";
end architecture;

