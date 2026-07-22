#vve_examples:dice_6/test/spring/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:dice_6/_get
#function vve_examples:dice_6/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:dice_6/test/spring/store_frame with storage vve_examples:io {}

execute as @e[tag=dice_6,tag=test] run function vve_examples:dice_6/main_c

# 获取弹簧端点
scoreboard players operation u int = a int
scoreboard players set v int 0
scoreboard players set w int 0
execute as @e[tag=dice_6,tag=test,name="A",limit=1] run function math:uvw/_tovec_as
scoreboard players operation fvec_x int = vec_x int
scoreboard players operation fvec_y int = vec_y int
scoreboard players operation fvec_z int = vec_z int
scoreboard players operation u int = a int
scoreboard players operation u int *= -1 int
scoreboard players set v int 0
scoreboard players set w int 0
execute as @e[tag=dice_6,tag=test,name="B",limit=1] run function math:uvw/_tovec_as
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation vec_x int -= fvec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation vec_y int -= fvec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation vec_z int -= fvec_z int
data modify entity @e[tag=math_marker,limit=1] Pos set from storage math:io xyz
execute as @e[tag=math_marker,limit=1] positioned 0.0 0.0 0.0 facing entity @s feet run function math:uvw/_anchor_to
# 渲染弹簧
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get fvec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get fvec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get fvec_z int
data modify entity @e[tag=math_marker,limit=1] Pos set from storage math:io xyz
scoreboard players set vec_n int 150
#data modify storage math:io render_command set value "function math:rgb/_render_debug_2"
data modify storage math:io render_command set value "function vve_examples:dice_6/test/spring/render"
scoreboard players set psi int 0
scoreboard players set r int 0
scoreboard players set g int 255
scoreboard players set b int 0
execute as @e[tag=math_marker,limit=1] at @s run function math:vec/_render_no_arrow
# 计算弹簧形变
execute as @e[tag=math_marker,limit=1] run function math:vec/_unit
#tellraw @a ["res: ", {"score":{"name":"res","objective":"int"}}]
scoreboard players remove res int 4000
scoreboard players operation impulse_fx int = uvec_x int
scoreboard players operation impulse_fy int = uvec_y int
scoreboard players operation impulse_fz int = uvec_z int
scoreboard players operation impulse_fx int *= res int
scoreboard players operation impulse_fy int *= res int
scoreboard players operation impulse_fz int *= res int
scoreboard players operation impulse_fx int /= -10000 int
scoreboard players operation impulse_fy int /= -10000 int
scoreboard players operation impulse_fz int /= -10000 int
# 计算B物体弹力冲量
execute store result score temp_x int run scoreboard players operation impulse_x int = fvec_x int
execute store result score temp_y int run scoreboard players operation impulse_y int = fvec_y int
execute store result score temp_z int run scoreboard players operation impulse_z int = fvec_z int
scoreboard players operation impulse_x int += vec_x int
scoreboard players operation impulse_y int += vec_y int
scoreboard players operation impulse_z int += vec_z int
execute as @e[tag=dice_6,tag=test,name="B",limit=1] run function vve:object/_apply_impulse_trunc_as
# 计算A物体弹力冲量
scoreboard players operation impulse_x int = temp_x int
scoreboard players operation impulse_y int = temp_y int
scoreboard players operation impulse_z int = temp_z int
scoreboard players operation impulse_fx int *= -1 int
scoreboard players operation impulse_fy int *= -1 int
scoreboard players operation impulse_fz int *= -1 int
execute as @e[tag=dice_6,tag=test,name="A",limit=1] run function vve:object/_apply_impulse_trunc_as

#scoreboard players set inp int 7500
#execute if score test_n int matches 60..72 at @s positioned ~-1 ~0.5 ~ rotated -90.0 0.0 run function vve_examples:dice_6/_poke_here_i_as
#execute as 0-0-0-0-0 run function vve:impulse/_render

scoreboard players add test_n int 1