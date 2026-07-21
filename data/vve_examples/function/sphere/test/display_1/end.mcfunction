#vve_examples:sphere/test/display_1/end

scoreboard players set vve_gravity int 300

execute as @e[tag=dice_6,tag=test] run function vve_examples:dice_6/_del
function vve_examples:sphere/_del