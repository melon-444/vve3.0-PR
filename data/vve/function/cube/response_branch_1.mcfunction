#vve:cube/response_branch_1
# vve:cube/response调用

execute if score sstemp_abs_v int < sstemp_abs_w int \
	run return run function vve:cube/response_v
function vve:cube/response_w