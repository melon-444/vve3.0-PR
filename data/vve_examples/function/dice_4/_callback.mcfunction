#vve_examples:dice_4/_callback
# 回调函数

function vve_examples:dice_4/_get
function vve_examples:dice_4/_get_value

# 按得到的分数生成展示骰子
execute if score $optplayer dice_var matches 1 run rotate @s 180 0

execute if score res int matches 1 at @s run return run function vve_examples:dice_4/face_up/1
execute if score res int matches 2 at @s run return run function vve_examples:dice_4/face_up/2
execute if score res int matches 3 at @s run return run function vve_examples:dice_4/face_up/3
execute if score res int matches 4 at @s run return run function vve_examples:dice_4/face_up/4