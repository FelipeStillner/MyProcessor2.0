library ieee;
use ieee.std_logic_1164.all;

entity ula is
    port( 
        sel     : in std_logic_vector(3 downto 0);
        in0,in1 : in std_logic_vector(15 downto 0);
        out0    : out std_logic_vector(15 downto 0);
        cout    : out std_logic
    );
end entity;

architecture behaviour of ula is

    component and16
        port( 
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0)
        );
    end component;

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

    component or16
        port( 
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0)
        );
    end component;

    component sum16
        port( 
            cin     : in std_logic;
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0);
            cout    : out std_logic
        );
    end component;

    component xor16 is
        port( 
            in0,in1 : in std_logic_vector(15 downto 0);
            out0    : out std_logic_vector(15 downto 0)
        );
    end component;

    signal s_and16, s_or16 : std_logic_vector(15 downto 0);
    signal s_sum16         : std_logic_vector(15 downto 0);
    signal n               : std_logic_vector(15 downto 0);
    signal t1, t2          : std_logic;
    
begin
    n <= "0000000000000000";
    t1 <= '0';
    AND160 : and16 port map(in0, in1, s_and16);
    OR160  : or16 port map(in0, in1, s_or16);
    XOR160 : xor16 port map(in0, in1, s_or16);
    SUM160 : sum16 port map(t1, in0, in1, s_sum16, t2);
    MUX160 : mux16 port map(sel, s_and16, s_or16, s_sum16, n, n, n, n, n, n, n, n, n, n, n, n, n, out0);
end architecture;