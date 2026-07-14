#vve:block_reader/arrow/call_func
# vve:block_reader/main调用

data modify storage vve:io result set from entity @s inBlockState
execute if data storage vve:io result{Name:"minecraft:barrier"} run return run kill @s
execute store result storage math:io xyz[0] double 1 run scoreboard players get @s x
execute store result storage math:io xyz[1] double 1 run scoreboard players get @s y
execute store result storage math:io xyz[2] double 1 run scoreboard players get @s z
data modify entity 0-0-0-0-0 Pos set from storage math:io xyz
function vve:block_reader/arrow/_get
$execute at 0-0-0-0-0 positioned ~0.5 ~0.5 ~0.5 run function $(run_func)

kill @s