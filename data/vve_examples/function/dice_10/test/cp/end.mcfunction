#vve_examples:dice_10/test/cp/end

execute as @e[tag=math_marker,limit=1] run function vve:test_coord/_topos
execute at @e[tag=math_marker,limit=1] run fill ~-2 ~-1 ~-2 ~2 ~-1 ~2 air

scoreboard players operation tempid int = @s vve_id
execute as @e[tag=dice_10_text_render] if score @s int = tempid int run function vve:id/_return
kill @e[tag=dice_10_text_render]

function vve_examples:dice_10/_del