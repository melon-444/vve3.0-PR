#vve:object/_poke_here_i_as
# 设置一个作用点为执行位置，方向为执行朝向，大小为inp的冲量
# 输入<inp,int,1w>
# 输入<mass,int>
# 输入<inertia,int,100>
# 输入执行位置
# 输入执行朝向
# 需要传入实例为执行者

function vve:object/_get
execute as 0-0-0-0-0 run function vve:object/_poke_here_i
function vve:object/_store