#vve:test/cpoint
# 使用碰撞点测试

data modify storage vve:io input set from storage vve:io cpoint_plate
function vve:cpoint/_proj
function vve:cpoint/_print
data modify entity 0-0-0-0-0 Pos set from storage vve:io cpoint_plate.center
execute as 0-0-0-0-0 at @s run function vve:_detect_slope
function math:nvec/_print
tellraw @a ["shift_response: ", {"score":{"name":"shift_response","objective":"int"}}]
function vve:shift/_print