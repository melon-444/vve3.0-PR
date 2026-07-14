#vve_examples:dice_12/_callback
# 回调函数

function vve_examples:dice_12/_get
function vve_examples:dice_12/_get_value

# 按得到的分数生成展示骰子
execute if score $optplayer dice_var matches 1 run rotate @s 180 0

execute if score res int matches 1 at @s run return run function vve_examples:dice_12/face_up/1
execute if score res int matches 2 at @s run return run function vve_examples:dice_12/face_up/2
execute if score res int matches 3 at @s run return run function vve_examples:dice_12/face_up/3
execute if score res int matches 4 at @s run return run function vve_examples:dice_12/face_up/4
execute if score res int matches 5 at @s run return run function vve_examples:dice_12/face_up/5
execute if score res int matches 6 at @s run return run function vve_examples:dice_12/face_up/6
execute if score res int matches 7 at @s run return run function vve_examples:dice_12/face_up/7
execute if score res int matches 8 at @s run return run function vve_examples:dice_12/face_up/8
execute if score res int matches 9 at @s run return run function vve_examples:dice_12/face_up/9
execute if score res int matches 10 at @s run return run function vve_examples:dice_12/face_up/10
execute if score res int matches 11 at @s run return run function vve_examples:dice_12/face_up/11
execute if score res int matches 12 at @s run return run function vve_examples:dice_12/face_up/12