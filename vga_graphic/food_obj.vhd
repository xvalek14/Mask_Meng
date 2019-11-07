----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:12:23 11/05/2019 
-- Design Name: 
-- Module Name:    food_obj - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

entity food_obj is
port(
	pix_x, pix_y : in  STD_LOGIC_VECTOR (10 downto 0);
           enable, clk : in  STD_LOGIC;
           color : out  STD_LOGIC_VECTOR (2 downto 0));
end food_obj;

architecture Behavioral of food_obj is

type ROM_type is array(0 to 4095) of std_logic_vector(2 downto 0);
constant rom : ROM_type := (
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "010", "010", "010", "010", 
"010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "110", "010", "010", "010", "010", "010", 
"010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "110", "010", "010", "010", "010", 
"010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "110", "010", "110", "010", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", "010", "010", 
"010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "000", "000", "000", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "110", "110", "110", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "000", "110", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "000", "000", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "000", "000", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "000", "000", "000", "000", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "000", "000", "000", "000", "000", "110", 
"110", "110", "110", "110", "110", "000", "000", "000", "000", "000", "000", "000", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "000", "000", "000", "000", "000", "000", "000", 
"110", "110", "000", "000", "000", "110", "000", "000", "000", "000", "000", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "000", "000", "000", "000", "000", "000", "000", 
"110", "000", "000", "000", "000", "000", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "000", "000", "000", "000", "000", "000", "000", 
"110", "000", "000", "000", "000", "000", "110", "110", "110", "110", "110", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "000", "000", "000", "000", "000", "000", "000", 
"110", "000", "000", "000", "000", "000", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "000", "000", "000", "000", "000", "000", "000", 
"110", "000", "000", "000", "000", "000", "110", "110", "110", "110", "110", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "000", "000", "000", "000", "000", "000", "000", 
"110", "110", "000", "000", "000", "110", "000", "000", "000", "000", "000", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "000", "000", "000", "000", "000", "110", 
"110", "110", "110", "110", "110", "000", "000", "000", "000", "000", "000", "000", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "000", "000", "000", "000", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", "110", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "000", "000", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "000", "000", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "000", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "000", "110", "110", "110", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "000", "000", "000", "000", "000", "000", "110", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "000", "000", "000", "110", "110", "110", "110", "110", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "110", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "110", 
"110", "010", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "010", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "010", "010", "010", 
"010", "010", "010", "010", "010", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "110", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "010", "110", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "110", "010", "010", "010", "010", 
"010", "010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "010", "010", "010", "010", 
"010", "010", "010", "010", "010", "010", "110", "110", "110", "110", "110", "110", "110", "110", "110", "110", 
"110", "110", "110", "110", "110", "110", "110", "010", "110", "010", "110", "010", "010", "010", "010", "010", 
"010", "010", "010", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", 
"000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "000", 
"000", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", "111", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", 
"000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000", "000");

signal cntx, cnty: integer := 0;

begin

	cntx <= to_integer(unsigned(pix_x));
	cnty <= to_integer(unsigned(pix_y));
	
	process(clk,cntx, cnty, enable)
	begin
		if(rising_edge(clk)) then
			if(enable = '1') then
				color <= rom((cntx mod 64)*64 + (cnty mod 64));
			else
				color <= "000";
			end if;
		end if;
	end process;

end Behavioral;

