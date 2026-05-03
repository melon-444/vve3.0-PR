#vve:box_object/test/inertia/main

execute unless score test int matches -1 run return fail
scoreboard players set @s killtime 10

data modify storage math:io render_command set from storage math:class particle_commands.end_rod
execute as @e[tag=math_marker,limit=1] run function math:_render_coords