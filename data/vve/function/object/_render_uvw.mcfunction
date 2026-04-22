#vve:object/_render_uvw
# 渲染局部坐标系
# 本接口需要使用gelib中的particles模块加载预设的粒子命令
# 需要传入世界实体为执行者

scoreboard players set vec_n int 50
scoreboard players set vec_scale int 3
function math:uvw/_render_debug