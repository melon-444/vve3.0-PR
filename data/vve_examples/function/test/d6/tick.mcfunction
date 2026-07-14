execute unless score #start d6_test matches 1 run return fail

scoreboard players add #timer d6_test 1

execute if score #timer d6_test matches 3.. run scoreboard players set #timer d6_test 0


execute unless score #timer d6_test matches 0 run return fail

execute as @p at @s anchored eyes positioned ^ ^ ^0.5 as @e[tag=math_marker,limit=1] run function vve_examples:dice_6/_roll