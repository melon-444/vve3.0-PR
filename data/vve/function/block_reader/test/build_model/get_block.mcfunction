#vve:block_reader/test/build_model/get_block

#tellraw @a ["get_block: ", {"nbt":"result","storage":"vve:io"}]
#tellraw @a ["uvw: ",{"score":{"name":"u","objective":"int"}},", ",{"score":{"name":"v","objective":"int"}},", ",{"score":{"name":"w","objective":"int"}}]
execute as @e[tag=test,limit=1] run function vve:block_reader/test/build_model/_add_block