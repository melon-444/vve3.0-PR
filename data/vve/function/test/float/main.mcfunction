#vve:test/float/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

function vve:cublock/main_l
function vve:sound/_get
execute as 0-0-0-0-0 run function vve:sound/main
function vve:sound/_store