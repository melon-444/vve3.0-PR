#vve:vehicle/_render_shift
# 渲染底盘位移点
# 输入storage vve:io shift_points
# 输入storage vve:io shift_origins
# 输入storage vve:io not_shift_points
# 需要传入世界实体为执行者
# 需要安装math3.1_gelib

data modify storage math:io input set from storage vve:io shift_points
data modify storage math:io input append from storage vve:io not_shift_points[]
data modify storage math:io render_command set from storage math:class particle_commands.flame
function math:_render_coords

data modify storage math:io input set from storage vve:io shift_origins
data modify storage math:io render_command set from storage math:class particle_commands.soul_fire_flame
function math:_render_coords