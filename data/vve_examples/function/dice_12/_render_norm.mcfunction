#vve_examples:dice_12/_render_norm
# 传入执行位置
# 输入世界实体为执行者

scoreboard players set sstemp_n1_x int 0
scoreboard players set sstemp_n1_y int 8506
scoreboard players set sstemp_n1_z int 5257
scoreboard players set sstemp_n2_x int 8506
scoreboard players set sstemp_n2_y int 5257
scoreboard players set sstemp_n2_z int 0
scoreboard players set sstemp_n3_x int 5257
scoreboard players set sstemp_n3_y int 0
scoreboard players set sstemp_n3_z int 8506

scoreboard players set sstemp_n4_x int 0
scoreboard players set sstemp_n4_y int -8506
scoreboard players set sstemp_n4_z int 5257
scoreboard players set sstemp_n5_x int -8506
scoreboard players set sstemp_n5_y int 5257
scoreboard players set sstemp_n5_z int 0
scoreboard players set sstemp_n6_x int 5257
scoreboard players set sstemp_n6_y int 0
scoreboard players set sstemp_n6_z int -8506

scoreboard players set sstemp_n7_x int 0
scoreboard players set sstemp_n7_y int 8506
scoreboard players set sstemp_n7_z int -5257
scoreboard players set sstemp_n8_x int 8506
scoreboard players set sstemp_n8_y int -5257
scoreboard players set sstemp_n8_z int 0
scoreboard players set sstemp_n9_x int -5257
scoreboard players set sstemp_n9_y int 0
scoreboard players set sstemp_n9_z int 8506

scoreboard players set sstemp_n10_x int 0
scoreboard players set sstemp_n10_y int -8506
scoreboard players set sstemp_n10_z int -5257
scoreboard players set sstemp_n11_x int -8506
scoreboard players set sstemp_n11_y int -5257
scoreboard players set sstemp_n11_z int 0
scoreboard players set sstemp_n12_x int -5257
scoreboard players set sstemp_n12_y int 0
scoreboard players set sstemp_n12_z int -8506

data modify storage math:io render_command set from storage math:class particle_commands.red_dust
scoreboard players set vec_n int 50
scoreboard players set sstemp_scale int 3

scoreboard players operation vec_x int = sstemp_n1_x int
scoreboard players operation vec_y int = sstemp_n1_y int
scoreboard players operation vec_z int = sstemp_n1_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n2_x int
scoreboard players operation vec_y int = sstemp_n2_y int
scoreboard players operation vec_z int = sstemp_n2_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n3_x int
scoreboard players operation vec_y int = sstemp_n3_y int
scoreboard players operation vec_z int = sstemp_n3_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n4_x int
scoreboard players operation vec_y int = sstemp_n4_y int
scoreboard players operation vec_z int = sstemp_n4_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n5_x int
scoreboard players operation vec_y int = sstemp_n5_y int
scoreboard players operation vec_z int = sstemp_n5_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n6_x int
scoreboard players operation vec_y int = sstemp_n6_y int
scoreboard players operation vec_z int = sstemp_n6_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n7_x int
scoreboard players operation vec_y int = sstemp_n7_y int
scoreboard players operation vec_z int = sstemp_n7_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n8_x int
scoreboard players operation vec_y int = sstemp_n8_y int
scoreboard players operation vec_z int = sstemp_n8_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n9_x int
scoreboard players operation vec_y int = sstemp_n9_y int
scoreboard players operation vec_z int = sstemp_n9_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n10_x int
scoreboard players operation vec_y int = sstemp_n10_y int
scoreboard players operation vec_z int = sstemp_n10_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n11_x int
scoreboard players operation vec_y int = sstemp_n11_y int
scoreboard players operation vec_z int = sstemp_n11_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
function math:vec/_render_debug

scoreboard players operation vec_x int = sstemp_n12_x int
scoreboard players operation vec_y int = sstemp_n12_y int
scoreboard players operation vec_z int = sstemp_n12_z int
scoreboard players operation vec_x int *= sstemp_scale int
scoreboard players operation vec_y int *= sstemp_scale int
scoreboard players operation vec_z int *= sstemp_scale int
data modify storage math:io render_command set from storage math:class particle_commands.green_dust
function math:vec/_render_debug
data modify storage math:io render_command set from storage math:class particle_commands.red_dust