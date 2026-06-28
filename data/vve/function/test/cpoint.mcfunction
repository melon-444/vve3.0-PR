#vve:test/cpoint
# 使用碰撞点测试

data modify storage vve:io input set from storage vve:io cpoint_plate
function vve:cpoint/_proj
function vve:cpoint/_print
data modify entity 0-0-0-0-0 Pos set from storage vve:io cpoint_plate.center
execute as 0-0-0-0-0 at @s run function vve:_detect_slope