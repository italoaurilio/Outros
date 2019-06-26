library ieee;
use ieee.std_logic_1164.all;

entity FFJK is
port(
		J, K: in std_logic;
		clear : in std_logic;
		preset : in std_logic;
		clk : in std_logic;
		Q, Qbar : out std_logic;
		load : in std_logic
	);
end FFJK;

architecture archFFJK of FFJK is
	signal Qs : std_logic;
begin
	process(clk, clear, preset)
	begin
		if(clear ='0') then
			QS <= '0';
		elsif(preset ='0') then
			Qs <= '1';
		elsif(clk'event and clk='0' and load = '1') then
			if(J = '0' and K = '0') then
				Qs <= not Qs;
			elsif(J = '0' and K = '1') then
				Qs <= '1';
			elsif(J = '1' and K = '0') then
				Qs <= '0';
			end if;
		end if;
	end process;
	
	Q <= Qs;
	Qbar <= not(Qs);
	
end archFFJK;