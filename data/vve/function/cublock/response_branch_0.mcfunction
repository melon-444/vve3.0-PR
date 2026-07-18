#vve:cublock/response_branch_0
# vve:cublock/response调用

execute if score sstemp_abs_u int < sstemp_abs_w int \
	run return run function vve:cublock/response_u
function vve:cublock/response_w