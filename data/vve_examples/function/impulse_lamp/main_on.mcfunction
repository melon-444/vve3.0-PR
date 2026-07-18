#vve_examples:impulse_lamp/main_on
# vve_examples:impulse_lamp/main_c调用

execute at @s positioned ~ ~0.5 ~ run function vve_examples:impulse_lamp/light/_new

execute unless entity @s[tag=vve_surface] if score impulse_response int matches 1 run scoreboard players operation light_duration int = vve_examples_impulse_lamp_duration int
execute if data storage vve:io result[0] run scoreboard players operation light_duration int = vve_examples_impulse_lamp_duration int

scoreboard players remove light_duration int 1
execute if score light_duration int matches 0 run function vve_examples:impulse_lamp/s_off