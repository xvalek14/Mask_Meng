----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:09 11/01/2019 
-- Design Name: 
-- Module Name:    color_output_mux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity color_output_mux is
    Port ( floor_obj, wall_obj, stone_obj, player_obj, food_obj : in  STD_LOGIC_VECTOR (2 downto 0);
           floor_sel,wall_sel, stone_sel, player_sel, food_sel : in  STD_LOGIC;
			  R,G,B: out std_logic);
end color_output_mux;

architecture Behavioral of color_output_mux is

signal color_out : std_logic_vector(2 downto 0);

begin

color_out <= floor_obj when (floor_sel = '1') else
				wall_obj when(wall_sel ='1') else
				player_obj when (player_sel = '1') else
				stone_obj when (stone_sel = '1') else
				food_obj when (food_sel = '1') else
				"000";
				
R <= color_out(2);
G <= color_out(1);
B <= color_out(0);

end Behavioral;

