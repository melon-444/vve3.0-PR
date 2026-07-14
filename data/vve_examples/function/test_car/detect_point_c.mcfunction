#vve_examples:test_car/detect_point_c

scoreboard players operation vec_x int = x int
scoreboard players operation vec_y int = y int
scoreboard players operation vec_z int = z int
scoreboard players operation vec_x int -= vx int
scoreboard players operation vec_y int -= vy int
scoreboard players operation vec_z int -= vz int
function math:uvw/_vecto_as
# 实例OBB进行clamp
scoreboard players operation sstemp_s0 int = @s scale_u
scoreboard players operation sstemp_s1 int = @s scale_v
scoreboard players operation sstemp_s2 int = @s scale_w
execute store result score sstemp_r0 int run scoreboard players operation sstemp_s0 int /= 2 int
execute store result score sstemp_r1 int run scoreboard players operation sstemp_s1 int /= 2 int
execute store result score sstemp_r2 int run scoreboard players operation sstemp_s2 int /= 2 int
scoreboard players operation sstemp_r0 int *= -1 int
scoreboard players operation sstemp_r1 int *= -1 int
scoreboard players operation sstemp_r2 int *= -1 int
scoreboard players operation u int > sstemp_r0 int
scoreboard players operation v int > sstemp_r1 int
scoreboard players operation w int > sstemp_r2 int
scoreboard players operation u int < sstemp_s0 int
scoreboard players operation v int < sstemp_s1 int
scoreboard players operation w int < sstemp_s2 int
function math:uvw/_tovec_as
function math:uvw/_vecto
# 临时对象OBB进行clamp
scoreboard players operation sstemp_s0 int = scale_u int
scoreboard players operation sstemp_s1 int = scale_v int
scoreboard players operation sstemp_s2 int = scale_w int
execute store result score sstemp_r0 int run scoreboard players operation sstemp_s0 int /= 2 int
execute store result score sstemp_r1 int run scoreboard players operation sstemp_s1 int /= 2 int
execute store result score sstemp_r2 int run scoreboard players operation sstemp_s2 int /= 2 int
scoreboard players operation sstemp_r0 int *= -1 int
scoreboard players operation sstemp_r1 int *= -1 int
scoreboard players operation sstemp_r2 int *= -1 int
scoreboard players operation u int > sstemp_r0 int
scoreboard players operation v int > sstemp_r1 int
scoreboard players operation w int > sstemp_r2 int
scoreboard players operation u int < sstemp_s0 int
scoreboard players operation v int < sstemp_s1 int
scoreboard players operation w int < sstemp_s2 int
function math:uvw/_tovec

# 进行介质探测
execute store result storage math:io xyz[0] double 0.0001 run scoreboard players operation c_x int = vec_x int
execute store result storage math:io xyz[1] double 0.0001 run scoreboard players operation c_y int = vec_y int
execute store result storage math:io xyz[2] double 0.0001 run scoreboard players operation c_z int = vec_z int
data modify entity 0-0-0-0-0 Pos set from storage math:io xyz
scoreboard players operation c_vx int = vx int
scoreboard players operation c_vy int = vy int
scoreboard players operation c_vz int = vz int
scoreboard players operation c_mass int = mass int
execute as 0-0-0-0-0 at @s run function vve:_detect_box
scoreboard players operation bounce_layer_receiver_response int += bounce_layer_response int
execute if score grab_layer_response int matches 1 run function vve:object/_receive_grab_layer
scoreboard players operation friction_receiver_response int < friction_response int
execute if score shift_response int matches 1 run function vve_examples:test_car/_receive_shift
execute if score impulse_response int matches 1 run function vve:object/_dec_impulse