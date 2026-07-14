#vve_examples:dice_6/_print_value_as
# 打印骰子点数
# 传入实例为执行者

function vve_examples:dice_6/_get
function vve_examples:dice_6/_get_value
tellraw @a ["roll_value: ", {"score":{"name":"res","objective":"int"}}]

scoreboard players add time d6_test 1
execute if score res int matches 1 run scoreboard players add 1 d6_test 1
execute if score res int matches 2 run scoreboard players add 2 d6_test 1
execute if score res int matches 3 run scoreboard players add 3 d6_test 1
execute if score res int matches 4 run scoreboard players add 4 d6_test 1
execute if score res int matches 5 run scoreboard players add 5 d6_test 1
execute if score res int matches 6 run scoreboard players add 6 d6_test 1