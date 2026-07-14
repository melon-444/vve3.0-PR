#vve:block_reader/_get_start_pos
# 获取指定层起始坐标
# 输入层编号<inp,int>
# 输出vec{<vec_x,int,1>,<vec_y,int,1>,<vec_z,int,1>}
# 输出执行者坐标
# 传入实体为执行者

# 获取xz坐标
execute store result score vec_x int store result storage math:io xyz[0] double 1 run data get storage vve:io block_reader_pos[0]
execute store result score vec_z int store result storage math:io xyz[2] double 1 run data get storage vve:io block_reader_pos[2]

# 计算y坐标
scoreboard players operation vec_y int = inp int
scoreboard players operation vec_y int *= 3 int
execute store result storage math:io xyz[1] double 1 run scoreboard players remove vec_y int 63

data modify entity @s Pos set from storage math:io xyz