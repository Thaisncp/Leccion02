  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY memoria2 IS
	port(
		clk : in std_logic;
		en : in std_logic;
		we : in std_logic;
		rst : in std_logic;
		addr : in std_logic_vector(9 downto 0);
		di : in std_logic_vector(15 downto 0);
		do : out std_logic_vector(15 downto 0)
		);
  END memoria2;

  ARCHITECTURE behavior OF memoria2 IS 

  type ram_type is array (1023 downto 0) of std_logic_vector (15 downto 0);
  
  SIGNAL ram : ram_type;
   begin
process(clk)       

  BEGIN

		if clk'event and clk = '1' then 
		if en = '1' then
		if we = '1' then
		ram(conv_integer(addr)) <= di;
		end if;
		
		if rst = '1' then 
		do <= (others => '0');
		else
		do <= ram(conv_integer(addr));
		end if;
		end if;
		end if;
		end process; 

  END;
