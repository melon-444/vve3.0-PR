#vve_examples:impulse_lamp/_update_display
# 更新展示设置
# 传入impulse_lamp实例为执行者

function vve:cublock/_update_display

data modify storage vve:io result set value {}
# 计算局部坐标
scoreboard players operation u int = a int
scoreboard players operation v int = a int
scoreboard players operation w int = a int
function math:uvw/_tofvec
execute store result storage math:io translation[0] float -0.0001 run scoreboard players get fvec_x int
execute store result storage math:io translation[1] float -0.0001 run scoreboard players operation fvec_y int += cube_shift_y int
execute store result storage math:io translation[2] float -0.0001 run scoreboard players get fvec_z int
data modify storage vve:io result.transformation.translation set from storage math:io translation
execute store result storage math:io scale[] float 0.0002 run scoreboard players get a int
data modify storage vve:io result.transformation.scale set from storage math:io scale
execute on passengers run data modify entity @s {} merge from storage vve:io result

execute if score light_duration int matches 0 run function vve_examples:impulse_lamp/_light_off
execute if score light_duration int matches 1.. run function vve_examples:impulse_lamp/_light_on