#vve:box_object/test/inertia/render_append
# vve:box_object/test/inertia/start调用

scoreboard players operation uvec_x int -= x int
scoreboard players operation uvec_y int -= y int
scoreboard players operation uvec_z int -= z int
scoreboard players operation u int = uvec_x int
scoreboard players operation v int = uvec_y int
scoreboard players operation w int = uvec_z int
function vve:tensor/_calc_inertia
#tellraw @a ["inertia: ", {"score":{"name":"inertia","objective":"int"}}]
scoreboard players operation uvec_x int *= inertia int
scoreboard players operation uvec_y int *= inertia int
scoreboard players operation uvec_z int *= inertia int
scoreboard players operation uvec_x int /= 1000 int
scoreboard players operation uvec_y int /= 1000 int
scoreboard players operation uvec_z int /= 1000 int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation uvec_x int += x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation uvec_y int += y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation uvec_z int += z int
data modify storage math:io input append from storage math:io xyz