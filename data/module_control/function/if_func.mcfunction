#module_control:if_func
# module_control:_method_exist调用

$execute store success score res int run schedule function $(prefix)$(path) 1t replace
$schedule clear $(prefix)$(path)