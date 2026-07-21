#vve_examples:sphere/main
# vve_examples:sphere/tick调用
# 实体对象主程序

function vve_examples:sphere/_get

scoreboard players set inp int 150
data modify storage math:io render_command set from storage math:class particle_commands.end_rod
execute as 0-0-0-0-0 run function math:sphere/_render_cnt

function vve_examples:sphere/_store