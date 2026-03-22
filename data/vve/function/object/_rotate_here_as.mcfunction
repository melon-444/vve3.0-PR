#vve:object/_rotate_here_as
# 设置一个转轴朝向执行位置，大小为距离的角速度
# 输入执行位置
# 需要传入实例为执行者

function vve:object/_get
execute as 0-0-0-0-0 run function vve:object/_rotate_here
function vve:object/_store