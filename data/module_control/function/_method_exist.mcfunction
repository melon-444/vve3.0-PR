#module_control:_method_exist
# 模块是否存在对应方法
# 以模块实例为执行者
# 输入macro {path:""}
# 占用storage module_control:io index
# 输出storage module_control:io result
# 输出<res,int>

# 弹出模块信息
execute store result storage module_control:io index int 1 run scoreboard players get @s module_id
function module_control:data/get_index with storage module_control:io {}

$data modify storage module_control:io result.path set value "$(path)"
function module_control:if_func with storage module_control:io result