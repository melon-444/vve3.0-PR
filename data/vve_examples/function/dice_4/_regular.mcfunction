#vve_examples:dice_4/_regular
# 规整化姿态，消除法向角速度
# 输入nvec{...}
# 输入receiver{...}
# 需要传入世界实体为执行者

function math:uvw/_nvec_to
scoreboard players set cos int -2147483648
# 设置各面法向量
scoreboard players set sstemp_n1_x int 0
scoreboard players set sstemp_n1_y int 10000
scoreboard players set sstemp_n1_z int 0

scoreboard players set sstemp_n2_x int 0
scoreboard players set sstemp_n2_y int -3333
scoreboard players set sstemp_n2_z int 9428

scoreboard players set sstemp_n3_x int -8165
scoreboard players set sstemp_n3_y int -3333
scoreboard players set sstemp_n3_z int -4714

scoreboard players set sstemp_n4_x int 8165
scoreboard players set sstemp_n4_y int -3333
scoreboard players set sstemp_n4_z int -4714
# 与各面法向量点乘
scoreboard players operation sstemp_d1 int = u int
scoreboard players operation sstemp_d1 int *= sstemp_n1_x int
scoreboard players operation sstemp_m int = v int
scoreboard players operation sstemp_m int *= sstemp_n1_y int
scoreboard players operation sstemp_d1 int += sstemp_m int
scoreboard players operation sstemp_m int = w int
scoreboard players operation sstemp_m int *= sstemp_n1_z int
scoreboard players operation sstemp_d1 int += sstemp_m int
scoreboard players operation sstemp_d1 int /= 10000 int
scoreboard players operation cos int > sstemp_d1 int

scoreboard players operation sstemp_d2 int = u int
scoreboard players operation sstemp_d2 int *= sstemp_n2_x int
scoreboard players operation sstemp_m int = v int
scoreboard players operation sstemp_m int *= sstemp_n2_y int
scoreboard players operation sstemp_d2 int += sstemp_m int
scoreboard players operation sstemp_m int = w int
scoreboard players operation sstemp_m int *= sstemp_n2_z int
scoreboard players operation sstemp_d2 int += sstemp_m int
scoreboard players operation sstemp_d2 int /= 10000 int
scoreboard players operation cos int > sstemp_d2 int

scoreboard players operation sstemp_d3 int = u int
scoreboard players operation sstemp_d3 int *= sstemp_n3_x int
scoreboard players operation sstemp_m int = v int
scoreboard players operation sstemp_m int *= sstemp_n3_y int
scoreboard players operation sstemp_d3 int += sstemp_m int
scoreboard players operation sstemp_m int = w int
scoreboard players operation sstemp_m int *= sstemp_n3_z int
scoreboard players operation sstemp_d3 int += sstemp_m int
scoreboard players operation sstemp_d3 int /= 10000 int
scoreboard players operation cos int > sstemp_d3 int

scoreboard players operation sstemp_d4 int = u int
scoreboard players operation sstemp_d4 int *= sstemp_n4_x int
scoreboard players operation sstemp_m int = v int
scoreboard players operation sstemp_m int *= sstemp_n4_y int
scoreboard players operation sstemp_d4 int += sstemp_m int
scoreboard players operation sstemp_m int = w int
scoreboard players operation sstemp_m int *= sstemp_n4_z int
scoreboard players operation sstemp_d4 int += sstemp_m int
scoreboard players operation sstemp_d4 int /= 10000 int
scoreboard players operation cos int > sstemp_d4 int
# 选择贴合面
execute if score cos int = sstemp_d1 int run return run function vve_examples:dice_4/regular/surface_1
execute if score cos int = sstemp_d2 int run return run function vve_examples:dice_4/regular/surface_2
execute if score cos int = sstemp_d3 int run return run function vve_examples:dice_4/regular/surface_3
execute if score cos int = sstemp_d4 int run return run function vve_examples:dice_4/regular/surface_4