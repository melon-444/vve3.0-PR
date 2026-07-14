#vve:test_coord/_get_relative
# 获取相对坐标
# 输入执行位置

tp 0-0-0-0-0 ~ ~ ~
data modify storage math:io xyz set from entity 0-0-0-0-0 Pos
execute store result score u int run data get storage math:io xyz[0] 10000
execute store result score v int run data get storage math:io xyz[1] 10000
execute store result score w int run data get storage math:io xyz[2] 10000
scoreboard players operation u int -= vve_test_x int
scoreboard players operation v int -= vve_test_y int
scoreboard players operation w int -= vve_test_z int
scoreboard players operation u int /= 1000 int
scoreboard players operation v int /= 1000 int
scoreboard players operation w int /= 1000 int

data modify storage vve:io sign_u set value ""
execute if score u int matches ..-1 run data modify storage vve:io sign_u set value "-"
execute if score u int matches ..-1 run scoreboard players operation u int *= -1 int
scoreboard players operation temp_u int = u int
execute store result storage vve:io u int 1 run scoreboard players operation u int /= 10 int
execute store result storage vve:io temp_u int 1 run scoreboard players operation temp_u int %= 10 int

data modify storage vve:io sign_v set value ""
execute if score v int matches ..-1 run data modify storage vve:io sign_v set value "-"
execute if score v int matches ..-1 run scoreboard players operation v int *= -1 int
scoreboard players operation temp_v int = v int
execute store result storage vve:io v int 1 run scoreboard players operation v int /= 10 int
execute store result storage vve:io temp_v int 1 run scoreboard players operation temp_v int %= 10 int

data modify storage vve:io sign_w set value ""
execute if score w int matches ..-1 run data modify storage vve:io sign_w set value "-"
execute if score w int matches ..-1 run scoreboard players operation w int *= -1 int
scoreboard players operation temp_w int = w int
execute store result storage vve:io w int 1 run scoreboard players operation w int /= 10 int
execute store result storage vve:io temp_w int 1 run scoreboard players operation temp_w int %= 10 int

function vve:test_coord/get_relative_macro with storage vve:io {}