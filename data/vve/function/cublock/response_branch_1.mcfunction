#vve:cublock/response_branch_1
# vve:cublock/response调用

execute if score sstemp_abs_v int < sstemp_abs_w int \
	run return run function vve:cublock/response_v
function vve:cublock/response_w