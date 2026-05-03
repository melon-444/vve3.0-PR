#vve:cube/response_branch_0
# vve:cube/response调用
# vve:cublock/response调用

execute if score sstemp_abs_u int < sstemp_abs_w int \
	run return run function vve:cube/response_u
function vve:cube/response_w