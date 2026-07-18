#vve_examples:roll_head/exit_spectating
# vve_examples:roll_head/main_spectator调用

tag @s remove spectating

execute as @a[tag=tmp] run function vve:id/_return

execute as @a[tag=tmp] at @s run tp @s ~ ~1.62 ~
scoreboard players set angle int 0
execute as @a[tag=tmp] at @s run function vve:shader/roll_instant_from_angle

schedule function vve_examples:roll_head/roll_angle_zero 10t replace

gamemode creative @a[tag=tmp]

tag @a[tag=tmp] remove tmp