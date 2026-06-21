#vve:tensor/_print_uvw_inertia
# 输出uvw三个方向的惯量

scoreboard players set u int 10000
scoreboard players set v int 0
scoreboard players set w int 0
function vve:tensor/_calc_inertia
tellraw @a ["u inertia: ", {"score":{"name":"inertia","objective":"int"}}]

scoreboard players set u int 0
scoreboard players set v int 10000
scoreboard players set w int 0
function vve:tensor/_calc_inertia
tellraw @a ["v inertia: ", {"score":{"name":"inertia","objective":"int"}}]

scoreboard players set u int 0
scoreboard players set v int 0
scoreboard players set w int 10000
function vve:tensor/_calc_inertia
tellraw @a ["w inertia: ", {"score":{"name":"inertia","objective":"int"}}]