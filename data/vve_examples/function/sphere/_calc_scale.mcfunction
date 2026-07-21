#vve_examples:sphere/_calc_scale

scoreboard players operation scale_u int = r int
scoreboard players operation scale_u int *= 2 int
scoreboard players operation scale_u int *= 7953 int
scoreboard players operation scale_u int /= 13775 int
scoreboard players add scale_u int 1
execute store result score scale_v int store result score scale_w int run scoreboard players operation scale_u int *= 10 int