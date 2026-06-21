#vve:tensor/print_append
# vve:tensor/_print_inertias调用

scoreboard players operation uvec_x int -= x int
scoreboard players operation uvec_y int -= y int
scoreboard players operation uvec_z int -= z int
scoreboard players operation u int = uvec_x int
scoreboard players operation v int = uvec_y int
scoreboard players operation w int = uvec_z int
function vve:tensor/_calc_inertia
tellraw @a ["inertia: ", {"score":{"name":"inertia","objective":"int"}}]