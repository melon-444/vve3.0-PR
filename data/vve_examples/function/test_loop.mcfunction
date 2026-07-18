#vve_examples:test_loop
# vve_examples:test调用

scoreboard players remove loop int 1

tag @e[tag=result,limit=1] remove result
summon text_display 0 0 0 {Tags:["vve_examples_test","test","text_render","result"],billboard:"center",brightness:{sky:15,block:15}}
data modify entity @e[tag=result,limit=1] text set value {"score":{"name":"loop","objective":"int"}}
scoreboard players set @e[tag=result,limit=1] killtime 50

data modify storage math:io render_command set value "tp @e[tag=result,limit=1] ~ ~ ~"
data modify entity 0-0-0-0-0 Pos set from storage math:io input[-1]
execute as 0-0-0-0-0 at @s run function math:_render

data modify storage math:io input prepend from storage math:io input[-1]
data remove storage math:io input[-1]

execute if score loop int matches 1.. run function vve_examples:test_loop