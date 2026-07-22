#vve:object/_apply_impulse_trunc_as
# 为实例应用冲量响应
# 输入<mass,int>
# 输入<inertia,int,100>
# 输入impulse{...}
# 传入实例为执行者

function vve:object/_get
execute as 0-0-0-0-0 run function vve:object/_apply_impulse_trunc
function vve:object/_store