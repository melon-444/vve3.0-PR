#vve:object/_receive_over
# 结束响应接收过程
# 输入receiver{...}
# 输出{<grab_layer_response,int>,<friction_response,int>,<shift_response,int>,<impulse_response,int>}
# 输出impulse{...}, shift{...}, friction{...}, grab_layer{...}, bounce_layer{...}
# 需要传入世界实体为执行者

# 结算材质
execute if score material_receiver_response int matches -2147483647.. run scoreboard players operation material_response int = material_receiver_response int

# 结算实心层
scoreboard players operation bounce_layer_response int = bounce_layer_receiver_response int

# 结算附着层
scoreboard players operation grab_layer_response int = grab_layer_receiver_response int
#execute store result storage math:io xyz[0] double 0.0001 run scoreboard players get grab_layer_receiver_nvec_x int
#execute store result storage math:io xyz[1] double 0.0001 run scoreboard players get grab_layer_receiver_nvec_y int
#execute store result storage math:io xyz[2] double 0.0001 run scoreboard players get grab_layer_receiver_nvec_z int
#data modify entity @s Pos set from storage math:io xyz
#execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1.0
#data modify storage math:io xyz set from entity @s Pos
#execute store result score nvec_x int run data get storage math:io xyz[0] 10000
#execute store result score nvec_x int run data get storage math:io xyz[1] 10000
#execute store result score nvec_x int run data get storage math:io xyz[2] 10000
scoreboard players operation nvec_x int = grab_layer_receiver_nvec_x int
scoreboard players operation nvec_y int = grab_layer_receiver_nvec_y int
scoreboard players operation nvec_z int = grab_layer_receiver_nvec_z int

# 结算摩擦
scoreboard players operation friction_response int = friction_receiver_response int

# 结算位移
execute if score shift_receiver_response int matches 1 run scoreboard players set shift_response int 1
scoreboard players operation shift_x int = shift_receiver_x int
scoreboard players operation shift_y int = shift_receiver_y int
scoreboard players operation shift_z int = shift_receiver_z int

# 结算冲量
execute if score impulse_receiver_response int matches 1.. run scoreboard players set impulse_response int 1
scoreboard players operation impulse_x int = impulse_receiver_sx int
scoreboard players operation impulse_y int = impulse_receiver_sy int
scoreboard players operation impulse_z int = impulse_receiver_sz int
scoreboard players operation impulse_x int /= impulse_receiver_response int
scoreboard players operation impulse_y int /= impulse_receiver_response int
scoreboard players operation impulse_z int /= impulse_receiver_response int
scoreboard players operation impulse_x int += impulse_receiver_x int
scoreboard players operation impulse_y int += impulse_receiver_y int
scoreboard players operation impulse_z int += impulse_receiver_z int

scoreboard players operation impulse_fx int = impulse_receiver_fx int
scoreboard players operation impulse_fy int = impulse_receiver_fy int
scoreboard players operation impulse_fz int = impulse_receiver_fz int
scoreboard players operation impulse_fx int /= impulse_receiver_response int
scoreboard players operation impulse_fy int /= impulse_receiver_response int
scoreboard players operation impulse_fz int /= impulse_receiver_response int