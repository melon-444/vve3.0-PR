#vve_examples:dice_12/_print_value_as
# 打印骰子点数
# 传入实例为执行者

function vve_examples:dice_12/_get
function vve_examples:dice_12/_get_value
tellraw @a ["roll_value: ", {"score":{"name":"res","objective":"int"}}]


scoreboard players add time d12_test 1
execute if score res int matches 1 run scoreboard players add 1 d12_test 1
execute if score res int matches 2 run scoreboard players add 2 d12_test 1
execute if score res int matches 3 run scoreboard players add 3 d12_test 1
execute if score res int matches 4 run scoreboard players add 4 d12_test 1
execute if score res int matches 5 run scoreboard players add 5 d12_test 1
execute if score res int matches 6 run scoreboard players add 6 d12_test 1
execute if score res int matches 7 run scoreboard players add 7 d12_test 1
execute if score res int matches 8 run scoreboard players add 8 d12_test 1
execute if score res int matches 9 run scoreboard players add 9 d12_test 1
execute if score res int matches 10 run scoreboard players add 10 d12_test 1
execute if score res int matches 11 run scoreboard players add 11 d12_test 1
execute if score res int matches 12 run scoreboard players add 12 d12_test 1