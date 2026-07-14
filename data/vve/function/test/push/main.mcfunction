#vve:test/push/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10
#execute if score test_n int matches 1 run scoreboard players set test int 1

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]
execute as @e[tag=vve_cubox] run function vve:cubox/main
execute as @e[tag=vve_cubox] run function vve:sound/_get
execute as 0-0-0-0-0 run function vve:sound/main
execute as @e[tag=vve_cubox] run function vve:sound/_store

scoreboard players set inp int 3500
execute if score test_n int matches ..40 as @e[name=A,limit=1] at @s positioned ~0.0 ~2.75 ~0.0 rotated 0.0 0.0 run function vve:object/_poke_here_i_as

scoreboard players add test_n int 1
return fail
execute as @e[name=A,limit=1] run function vve:object/_get
# 冲量作用位置
scoreboard players operation impulse_x int = x int
scoreboard players operation impulse_y int = y int
scoreboard players operation impulse_z int = z int
# 冲量矢量
scoreboard players operation impulse_fx int = kvec_x int
scoreboard players operation impulse_fy int = kvec_y int
scoreboard players operation impulse_fz int = kvec_z int
scoreboard players operation impulse_fx int *= inp int
scoreboard players operation impulse_fy int *= inp int
scoreboard players operation impulse_fz int *= inp int
scoreboard players operation impulse_fx int /= 10000 int
scoreboard players operation impulse_fy int /= 10000 int
scoreboard players operation impulse_fz int /= 10000 int
execute as 0-0-0-0-0 run function vve:object/_apply_impulse
execute as @e[name=A,limit=1] run function vve:object/_store