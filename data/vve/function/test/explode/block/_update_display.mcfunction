#vve:test/explode/block/_update_display
# 更新展示设置
# 传入block实例为执行者
# 输出storage vve:io result

scoreboard players operation dec int = scale_u int
function math:dec/_sqr
scoreboard players operation inp int = dec int
scoreboard players operation dec int = scale_v int
function math:dec/_sqr
scoreboard players operation inp int += dec int
scoreboard players operation dec int = scale_w int
function math:dec/_sqr
scoreboard players operation inp int += dec int
function math:_sqrt
scoreboard players operation sstemp_max int = res int
scoreboard players operation sstemp_max int *= 100 int

# 同步展示实体NBT
data modify storage vve:io result set value {transformation:{right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[0.0f,0.0f,0.0f],left_rotation:[0.0f,0.0f,0.0f,1.0f],translation:[0.0f,0.0f,0.0f]}}

#execute store result storage math:io scale[] float 0.0002 run scoreboard players get a int
#data modify storage vve:io result.transformation.scale set from storage math:io scale

execute store result storage math:io xyzw[0] float 0.0001 run scoreboard players get quat_x int
execute store result storage math:io xyzw[1] float 0.0001 run scoreboard players get quat_y int
execute store result storage math:io xyzw[2] float 0.0001 run scoreboard players get quat_z int
execute store result storage math:io xyzw[3] float 0.0001 run scoreboard players get quat_w int
data modify storage vve:io result.transformation.left_rotation set from storage math:io xyzw

data modify storage math:io translation set value [-0.5f,0.0f,-0.5f]
execute store result storage math:io translation[1] float -0.00005 run scoreboard players get sstemp_max int
execute store result score sstemp_y int run data get storage math:io translation[1] 10000
execute store result storage math:io translation[1] float 0.0001 run scoreboard players remove sstemp_y int 5000
data modify storage vve:io result.transformation.translation set from storage math:io translation

execute on passengers run data modify entity @s {} merge from storage vve:io result

# 同步交互实体NBT
data modify storage vve:io result set value {width:0.0f,height:0.0f}

execute store result storage vve:io result.width float 0.0001 run scoreboard players get sstemp_max int
execute store result storage vve:io result.height float 0.0001 run scoreboard players get sstemp_max int

scoreboard players operation sstemp_y int = y int
scoreboard players operation sstemp_max int /= 2 int
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation sstemp_y int -= sstemp_max int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get z int
data modify storage vve:io result.Pos set from storage math:io xyz

data modify entity @s {} merge from storage vve:io result