library ieee;
use ieee.std_logic_1164.all;

entity mux16_tb is
end entity;

architecture testbench of mux16_tb is
    
    component mux16 is
        port( 
            sel                 : in std_logic_vector(3 downto 0);
            in0,in1,in2,in3     : in std_logic_vector(15 downto 0);
            in4,in5,in6,in7     : in std_logic_vector(15 downto 0);
            in8,in9,inA,inB     : in std_logic_vector(15 downto 0);
            inC,inD,inE,inF     : in std_logic_vector(15 downto 0);
            out0                : out std_logic_vector(15 downto 0)
        );
    end component;

  signal  sel             : std_logic_vector(3 downto 0);
  signal  in0,in1,in2,in3 : std_logic_vector(15 downto 0);
  signal  in4,in5,in6,in7 : std_logic_vector(15 downto 0);
  signal  in8,in9,inA,inB : std_logic_vector(15 downto 0);
  signal  inC,inD,inE,inF : std_logic_vector(15 downto 0);
  signal  out0            : std_logic_vector(15 downto 0);
 
begin
  MUX160: mux16 port map (sel, in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, inA, inB, inC, inD, inE, inF, out0);

  process
  begin
    sel <= "0000";
    in0 <= "0000000000001111";
    in1 <= "0000000000001110";
    in2 <= "0000000000001101";
    in3 <= "0000000000001100";
    in4 <= "0000000000001011";
    in5 <= "0000000000001010";
    in6 <= "0000000000001001";
    in7 <= "0000000000001000";
    in8 <= "0000000000000111";
    in9 <= "0000000000000110";
    inA <= "0000000000000101";
    inB <= "0000000000000100";
    inC <= "0000000000000011";
    inD <= "0000000000000010";
    inE <= "0000000000000001";
    inF <= "0000000000000000";
    wait for 5 ns;
    sel <= "0001";
    wait for 5 ns;
    sel <= "0010";
    wait for 5 ns;
    sel <= "0011";
    wait for 5 ns;
    sel <= "0100";
    wait for 5 ns;
    sel <= "0101";
    wait for 5 ns;
    sel <= "1111";
    wait for 5 ns;
  end process;
end;