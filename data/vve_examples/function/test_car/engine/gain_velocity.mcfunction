#vve_examples:test_car/engine/gain_velocity
# vve_examples:test_car/engine/main调用

scoreboard players operation dec int = kvec_x int
scoreboard players operation idec int = temp_p int
function math:dec/_mult
scoreboard players operation dec int /= mass int
scoreboard players operation vx int += dec int

scoreboard players operation dec int = kvec_y int
scoreboard players operation idec int = temp_p int
function math:dec/_mult
scoreboard players operation dec int /= mass int
scoreboard players operation vy int += dec int

scoreboard players operation dec int = kvec_z int
scoreboard players operation idec int = temp_p int
function math:dec/_mult
scoreboard players operation dec int /= mass int
scoreboard players operation vz int += dec int

execute if score temp_p int matches ..-1 run function vve_examples:test_car/engine/backward_friction

#scoreboard players operation vec_x int = kvec_x int
#scoreboard players operation vec_y int = kvec_y int
#scoreboard players operation vec_z int = kvec_z int
#scoreboard players operation vec_x int *= temp_p int
#scoreboard players operation vec_y int *= temp_p int
#scoreboard players operation vec_z int *= temp_p int
#scoreboard players operation vec_x int /= mass int
#scoreboard players operation vec_y int /= mass int
#scoreboard players operation vec_z int /= mass int
#
#scoreboard players operation vx int += vec_x int
#scoreboard players operation vy int += vec_y int
#scoreboard players operation vz int += vec_z int