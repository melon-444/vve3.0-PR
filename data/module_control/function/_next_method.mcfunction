#module_control:_next_method
# 继续调用模块实例的方法
# 输入storage module_control:io result
# 输入macro {path:""}
# 输出storage module_control:io result

$data modify storage module_control:io result.path set value "$(path)"
function module_control:run_func with storage module_control:io result