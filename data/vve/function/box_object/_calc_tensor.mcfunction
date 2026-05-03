#vve:box_object/_calc_tensor
# 根据质量和边长计算惯性张量
# 输入_this.mass
# 输入_this.scale{...}
# 输出_this.tensor{...}

scoreboard players set tensor_xy int 0
scoreboard players set tensor_xz int 0
scoreboard players set tensor_yz int 0

scoreboard players operation dec int = scale_v int
function math:dec/_sqr
scoreboard players operation sstemp_v2 int = dec int
scoreboard players operation tensor_xx int = sstemp_v2 int
scoreboard players operation dec int = scale_w int
function math:dec/_sqr
scoreboard players operation sstemp_w2 int = dec int
scoreboard players operation tensor_xx int += sstemp_w2 int
scoreboard players operation tensor_xx int /= 120 int
scoreboard players operation tensor_xx int *= mass int

scoreboard players operation dec int = scale_u int
function math:dec/_sqr
scoreboard players operation sstemp_u2 int = dec int
scoreboard players operation tensor_yy int = sstemp_u2 int
scoreboard players operation tensor_yy int += sstemp_w2 int
scoreboard players operation tensor_yy int /= 120 int
scoreboard players operation tensor_yy int *= mass int

scoreboard players operation tensor_zz int = sstemp_u2 int
scoreboard players operation tensor_zz int += sstemp_v2 int
scoreboard players operation tensor_zz int /= 120 int
scoreboard players operation tensor_zz int *= mass int