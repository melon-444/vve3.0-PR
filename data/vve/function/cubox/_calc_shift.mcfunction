#vve:cubox/_calc_shift
# 计算位移
# 输入_this.scale{...}
# 输出_this.cube_shift_y

scoreboard players operation dec int = scale_u int
function math:dec/_sqr
scoreboard players operation inp int = dec int
scoreboard players operation dec int = scale_v int
function math:dec/_sqr
scoreboard players operation inp int += dec int
scoreboard players operation dec int = scale_w int
function math:dec/_sqr
scoreboard players operation inp int += dec int
function math:_sqrt
scoreboard players operation cube_shift_y int = res int
scoreboard players operation cube_shift_y int *= 50 int