#vve_examples:test_car/test/cp/poke

scoreboard players set inp int 150000
scoreboard players set mass int 17
scoreboard players set inertia int 1000
execute as @e[name=A,limit=1] at @s positioned ~ ~1.155 ~ rotated -90.0 0.0 run function vve:object/_poke_here_i_as