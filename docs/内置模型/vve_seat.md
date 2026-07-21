# `vve:seat`

`vve:seat` 使用 Minecraft `interaction` 实体提供可配置宽度和高度的座椅或交互位置。实现位于 `data/vve/function/seat/`，函数前缀为 `vve:seat/`。

## 数据

```text
seat {
    width
    height
}
```

两个字段按 `10000 = 1` 缩放，并分别同步到交互实体的 `width` 与 `height` NBT。默认 `_class` 生成全零模板 `storage vve:class seat_plate`，使用前应设置有效尺寸。

## 创建方式

`_new` 在执行位置召唤新的 `interaction` 实体并输出 `@e[tag=result,limit=1]`。`_be` 可以用 `storage vve:io input` 初始化已有实体；`_prescript` 则用已经加载的临时对象把外部实体修饰为座椅。

```mcfunction
data modify storage vve:io input set from storage vve:class seat_plate
data modify storage vve:io input.width set value 1.0d
data modify storage vve:io input.height set value 1.0d
execute positioned ~ ~1 ~ run function vve:seat/_new
```

## 接口

| 接口 | 作用 |
| --- | --- |
| `_proj` / `_model` | 数据模板与临时对象转换 |
| `_get` / `_store` | 实体记分板与临时对象转换 |
| `_update_display` | 将宽高写入交互实体 NBT |
| `_be` / `_prescript` | 把已有实体初始化为座椅 |
| `_new` / `_del` | 创建或销毁座椅实体 |
| `tick/main` | 遍历实例，目前只读写状态，不主动移动 |

座椅模型本身不实现乘客控制或跟随物体。作为车辆或刚体乘客使用时，应由所属模块负责骑乘关系和位置同步。
