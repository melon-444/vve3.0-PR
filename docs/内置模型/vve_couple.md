# `vve:couple`

`vve:couple` 表示力偶矩响应，也就是不包含合力平动部分、只改变刚体角速度的三维向量。

实现位于 `data/vve/function/couple/`，函数前缀为 `vve:couple/`。

## 数据

```text
couple_response   # 是否存在力偶矩
couple_x/y/z      # 世界坐标力偶矩向量，10000 = 1
```

`init` 初始化响应信号；`_clear` 同时把信号和三个向量分量清零；`_print` 用于调试输出。

## 产生方式

在 `_c` 碰撞方案中，每个偏心冲量 `J` 根据相对质心位矢 `r` 转换为：

```text
couple += r x J
```

计算由 `vve:impulse/_add_couple` 或高精度版本完成。遍历结束后，`_add_over` 按有效冲量响应点数量对累计力偶矩取平均。

## 应用

标量惯量刚体调用 `vve:object/_apply_couple`；惯性张量刚体调用 `vve:box_object/_apply_couple`。两者都要求已经加载物体姿态和惯量，并以提供局部坐标系的世界实体为执行者。
