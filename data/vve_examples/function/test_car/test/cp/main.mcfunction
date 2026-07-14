#vve_examples:test_car/test/cp/main

#function vve:point/_get
#data modify storage math:io render_command set from storage math:class particle_commands.red_dust
#execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get vx int
#execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get vy int
#execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get vz int
#data modify entity 0-0-0-0-0 Pos set from storage math:io xyz
#execute as 0-0-0-0-0 positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^0.5
#data modify storage math:io xyz set from entity 0-0-0-0-0 Pos
#execute store result score vx int run data get storage math:io xyz[0] 10000
#execute store result score vy int run data get storage math:io xyz[1] 10000
#execute store result score vz int run data get storage math:io xyz[2] 10000
#execute as 0-0-0-0-0 run function vve:point/_render_velocity

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

#tellraw @a "---"
#tellraw @a ["test_n: ", {"score":{"name":"test_n","objective":"int"}}]

#function vve_examples:test_car/_get
#function vve_examples:test_car/_model
#execute store result storage vve_examples:io frame int 1 run scoreboard players get test_n int
#function vve_examples:test_car/test/cp/store_frame with storage vve_examples:io {}

function vve_examples:test_car/main_c

#scoreboard players set test int 1
scoreboard players add test_n int 1