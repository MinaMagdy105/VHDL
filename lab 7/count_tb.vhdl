library ieee;
use ieee.std_logic_1164.all;    
use ieee.numeric_std.all;

entity count_tb is   -- entity declaration
generic(n: natural :=4);
end count_tb;
-----------------------------------------------------------------------
architecture TB of count_tb is

  component counter
  port(   clock: in std_logic;
    clear: in std_logic;
    count: in std_logic;
    Q:  out std_logic_vector(n-1 downto 0)
  );
  end component;

  signal T_clock:     std_logic;
  signal T_clear:     std_logic;
  signal T_count:     std_logic;
  signal T_Q:         std_logic_vector(n-1 downto 0);
begin
  U_counter: counter port map (T_clock, T_clear, T_count, T_Q);

  process     
  begin
  T_clock <= '0';   -- clock cycle is 10 ns
  wait for 5 ns;
  T_clock <= '1';
  wait for 5 ns;
  end process;

  process
  variable err_cnt: integer :=0;
  begin           
  T_clear <= '1';   -- Clear output
  T_count <= '1';
  wait for 20 ns; 
 
  T_clear <= '0';   -- Release the clear - Start counting
 
  -- test case 1
  wait for 10 ns;
  assert (unsigned(T_Q)=1) report "Failed case 1" severity error;
  if (unsigned(T_Q)/=1) then
      err_cnt := err_cnt+1;
  end if;
 
  -- test case 2
  wait for 10 ns;
  assert (unsigned(T_Q)=2) report "Failed case 2" severity error; 
  if (unsigned(T_Q)/=2) then
      err_cnt := err_cnt+1;
  end if;
    
  -- test case 3
  wait for 10 ns;
  assert (unsigned(T_Q)=3) report "Failed case 3" severity error;
  if (unsigned(T_Q)/=3) then
      err_cnt := err_cnt+1;
  end if;
    
  -- test case 4
  wait for 10 ns;
  -- test case 5
  wait for 10 ns;
  -- test case 6
  wait for 10 ns;
  -- test case 7
  wait for 10 ns;
  -- test case 8
  wait for 10 ns;
  -- test case 9
  wait for 10 ns;
  -- test case 10
  wait for 10 ns;
  -- test case 11
  wait for 10 ns;
  -- test case 12
  wait for 10 ns;
  -- test case 13
  wait for 10 ns;
  -- test case 14
  wait for 10 ns;
  -- test case 15
  wait for 10 ns;
  -- test case 16
  wait for 10 ns;
  assert (unsigned(T_Q)=0) report "Failed case 16" severity error;
  if (unsigned(T_Q)/=0) then
      err_cnt := err_cnt+1;
  end if;
  -- test case 17
  wait for 10 ns;
  -- test case 18
  wait for 10 ns;
  -- test case 19
  wait for 10 ns;
  -- test case 20
  wait for 20 ns; 
  T_clear <= '1';
  wait for 40 ns; 
  T_clear <= '0';   -- resume counting
  wait;
  end process;
end TB;
