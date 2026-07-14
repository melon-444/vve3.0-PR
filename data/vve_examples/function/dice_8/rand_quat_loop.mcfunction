#vve_examples:dice_8/rand_quat_loop
# vve_examples:dice_8/_rand_quat调用

data remove storage vve_examples:io result[0]
scoreboard players remove loop int 1
execute if score loop int matches 1.. run function vve_examples:dice_8/rand_quat_loop