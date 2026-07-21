# `vve:tensor`

`vve:tensor` 保存对称三维惯性张量，并计算刚体绕任意方向旋转时的等效惯量。实现位于 `data/vve/function/tensor/`，函数前缀为 `vve:tensor/`。

## 数据结构

```text
tensor_xx tensor_yy tensor_zz
tensor_xy tensor_xz tensor_yz
```

对称张量只需保存六个独立分量，按 `100 = 1` 缩放。`box_object`、`cubox` 和 `vehicle` 将它作为物体数据的一部分。

## 计算接口

`vve:tensor/_calc_inertia` 接收局部坐标中的单位转轴 `(u,v,w)`，计算：

```text
inertia = axis^T * tensor * axis
```

输出写入 `inertia`，供力偶矩或偏心冲量换算角速度变化。

`_print` 输出六个分量；`_print_uvw_inertia` 输出三个局部主轴方向的惯量；`_print_inertias` 和 `_render` 用于观察张量在不同方向上的取值，其中渲染接口需要图形库。

## 使用要求

均匀长方体可使用 `vve:box_object/_calc_tensor` 根据质量和三轴尺寸生成张量。自定义不规则物体需要自行计算张量，并保证张量相对于模型质心和局部坐标系定义。质量、缩放或质心改变后，旧张量不能继续直接使用。
