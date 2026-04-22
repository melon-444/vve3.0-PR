#vve:object/_render_uvw_as
# 渲染实例的局部坐标系
# 本接口需要使用gelib中的particles模块加载预设的粒子命令
# 传入实例为执行者

function vve:object/_get
scoreboard players set vec_n int 50
scoreboard players set vec_scale int 3
execute as 0-0-0-0-0 run function math:uvw/_render_debug