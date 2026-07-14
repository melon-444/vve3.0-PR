#vve:block_reader/_print
# 打印临时对象数据

tellraw @a ["_this: ", "{"]
tellraw @a ["    ", "task_processing: ", {"nbt":"block_reader_dict", "storage":"vve:io"}, ","]
tellraw @a ["    ", "free_index: ", {"nbt":"block_reader_free", "storage":"vve:io"}, ","]
tellraw @a ["    ", "start_pos: ", {"nbt":"block_reader_pos", "storage":"vve:io"}, ","]
tellraw @a ["    ", "size: ", {"nbt":"block_reader_size", "storage":"vve:io"}, ","]
tellraw @a ["    ", "processing_cnt: ", {"nbt":"block_reader_cnt", "storage":"vve:io"}, ","]
tellraw @a ["    ", "task_queue: ", {"nbt":"block_reader_tasks", "storage":"vve:io"}, ","]
tellraw @a ["    ", "work_index: ", {"nbt":"block_reader_work", "storage":"vve:io"}]
tellraw @a "}"