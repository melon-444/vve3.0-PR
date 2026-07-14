#vve_examples:car_simulator/_consts
# 创建常量

# 加载预设常量
function vve:_consts

# 手动设置常量
scoreboard players set vve_grab_friction int 9500
scoreboard players set vve_solid_friction int 9500
scoreboard players set vve_grab_friction_tan int 9500
scoreboard players set vve_solid_friction_tan int 9500
# 使用函数y=1/(x+1)对比例x进行映射后得到的值
scoreboard players set vve_solid_bounce_inv int 6896