#vve:tensor/_print_inertias
# 输出惯性张量的惯量取值
# 需要传入世界实体为执行者

scoreboard players set x int 0
scoreboard players set y int 0
scoreboard players set z int 0

scoreboard players set r int 1000
scoreboard players set inp int 256
data modify storage math:io render_command set value "function vve:tensor/print_append"
function math:sphere/_render_cnt