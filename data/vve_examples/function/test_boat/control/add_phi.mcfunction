#vve_examples:test_boat/control/add_phi
# vve_examples:test_boat/control/set_rotation调用

scoreboard players operation stemp_x int = ivec_x int
scoreboard players operation stemp_y int = ivec_y int
scoreboard players operation stemp_z int = ivec_z int
scoreboard players operation stemp_x int /= 5 int
scoreboard players operation stemp_y int /= 5 int
scoreboard players operation stemp_z int /= 5 int
scoreboard players operation angular_x int += stemp_x int
scoreboard players operation angular_y int += stemp_y int
scoreboard players operation angular_z int += stemp_z int