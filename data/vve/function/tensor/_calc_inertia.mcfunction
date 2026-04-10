#vve:tensor/_calc_inertia
# 根据惯性张量计算转动惯量
# 输入uvw{<u,int,1w>,<v,int,1w>,<w,int,1w>}
# 输出<inertia,int,100>

scoreboard players operation inertia int = u int
scoreboard players operation inertia int *= u int
scoreboard players operation inertia int /= 10000 int
scoreboard players operation inertia int *= tensor_xx int
scoreboard players operation inertia int /= 10000 int

scoreboard players operation sstemp int = v int
scoreboard players operation sstemp int *= v int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation sstemp int *= tensor_yy int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation inertia int += sstemp int

scoreboard players operation sstemp int = w int
scoreboard players operation sstemp int *= w int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation sstemp int *= tensor_zz int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation inertia int += sstemp int

scoreboard players operation sstemp int = u int
scoreboard players operation sstemp int *= v int
scoreboard players operation sstemp int /= 5000 int
scoreboard players operation sstemp int *= tensor_xy int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation inertia int -= sstemp int

scoreboard players operation sstemp int = u int
scoreboard players operation sstemp int *= w int
scoreboard players operation sstemp int /= 5000 int
scoreboard players operation sstemp int *= tensor_xz int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation inertia int -= sstemp int

scoreboard players operation sstemp int = v int
scoreboard players operation sstemp int *= w int
scoreboard players operation sstemp int /= 5000 int
scoreboard players operation sstemp int *= tensor_yz int
scoreboard players operation sstemp int /= 10000 int
scoreboard players operation inertia int -= sstemp int