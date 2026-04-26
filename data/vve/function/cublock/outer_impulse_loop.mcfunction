#vve:cublock/outer_impluse_loop
# vve:cublock/_outer_impluse调用

data modify storage vve:io input set from storage vve:io result[0]
function vve:impulse/_proj
function vve:object/_apply_impulse

data remove storage vve:io result[0]
execute if data storage vve:io result[0] run function vve:cublock/outer_impluse_loop