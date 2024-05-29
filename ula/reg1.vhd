LIBRARY ieee; 
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY reg1 IS
   PORT (
      clk : IN STD_LOGIC;
      rst : IN STD_LOGIC;
      wr_en : IN STD_LOGIC;
      data_in : IN STD_LOGIC;
      data_out : OUT STD_LOGIC
   );
END ENTITY;

ARCHITECTURE behaviour OF reg1 IS
   SIGNAL registro : STD_LOGIC;
BEGIN
   PROCESS (clk, rst, wr_en) -- acionado se houver mudança em clk, rst ou wr_en
   BEGIN
      IF rst = '1' THEN
         registro <= '0';
      ELSIF wr_en = '1' THEN
         IF rising_edge(clk) THEN
            registro <= data_in;
         END IF;
      END IF;
   END PROCESS;

   data_out <= registro; -- conexao direta, fora do processo
END ARCHITECTURE;