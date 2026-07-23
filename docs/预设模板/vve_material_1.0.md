# `vve_material_1.0`

`vve_material_1.0` 是盒状自定义实体介质骨架模板。它创建一个可平移、旋转和缩放的 OBB 介质实例，在碰撞点进入盒体时返回实心介质响应。

模板源码位于 `memory_storage/vve_material_1.0/`。

## 数据与默认值

模板保存三轴尺寸、位置、线速度、角速度、局部坐标系和四元数姿态，但没有质量或惯量。默认尺寸为 `(1,1,1)`，默认位置与姿态由 `vve:object/_anchor_to` 建立。

`_class` 输出到 `storage <namespace>:class <module>_plate`。

## 实例与注册

`_new` 创建：

```text
interaction 介质根实体
└─ item_display 显示乘客
```

根实体带 `vve_cube_box`、`vve_material_box` 和 `vve_impulse_receiver`。`init` 注册 `module_control`，`set_operation` 把返回的 `module_id` 写入实例，并将 `vve_material_type` 设为 `8593`，使 `vve:call_material` 走动态方法分派。

默认显示物品是命令方块。模板随后移除 `vve_impulse_receiver` 标签，因此当前默认介质不会接收反作用冲量。

## 查询与响应

`check_material` 执行以下步骤：

1. 取碰撞点 `c_x/c_y/c_z` 相对介质中心的位置；
2. 使用实例的 `ivec/jvec/kvec` 转换到局部坐标；
3. 与 `scale` 的三个半轴比较，执行 OBB 包含判断；
4. 命中时调用 `response`。

`response` 计算最近盒面、接触法线与浸入深度，并根据速度选择附着层或反弹层。它还输出实心摩擦、位移修正、冲量及切向摩擦冲量。

## 主要接口

| 接口 | 作用 |
| --- | --- |
| `init` | 注册模块、创建对象数据并生成默认模板 |
| `_new` / `_del` | 创建或销毁介质实例 |
| `_get` / `_store` | 读取和保存介质姿态 |
| `_proj` / `_model` | 转换介质数据模板 |
| `_update_display` | 更新盒体显示范围 |
| `check_material` | 由 `vve:call_material` 动态调用的几何查询入口 |
| `response` | 生成当前命中的物理响应 |

## 运行边界

默认 `tick` 调用的 `main` 只执行 `_get` 和 `_store`，不会根据 `velocity` 或 `angular_vec` 推进介质。若介质需要移动，应由外部模块修改状态，或覆盖 `main` 加入运动学迭代和同步。

当前材质编号 `8593`、实心响应参数和命令方块显示都是占位默认值，实际介质应覆盖 `set_operation` 或 `response`。
