# `vve:shift_origin`

`vve:shift_origin` 记录位移响应对应的原始采样位置，主要供载具底盘算法把“发生位移的世界点”与“它来自哪个局部底盘点”配对。

实现位于 `data/vve/function/shift_origin/`，函数前缀为 `vve:shift_origin/`。

## 数据

```text
shift_origin_response
shift_ox
shift_oy
shift_oz
```

`init` 只初始化响应信号。当前 `.doc.mcfo` 中三个字段的左侧名称重复写成 `shift_ox`，但实际占位记分板分别是 `shift_ox/shift_oy/shift_oz`，应以后者为准。

## 使用位置

普通刚体只需要最终 `shift`，通常不读取本模型。`vve:vehicle/_iter_cpoints_c` 会把位移点与来源点分别存入 `storage vve:io shift_points` 和 `shift_origins`，再由姿态规整算法分析底盘支撑分布。

这是内部辅助协议，没有向通用模型承诺独立的创建、投影或持久化接口。
