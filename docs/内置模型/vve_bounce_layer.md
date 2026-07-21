# `vve:bounce_layer`

`vve:bounce_layer` 表示碰撞点已经进入介质较深、需要反弹处理的接触层。实现位于 `data/vve/function/bounce_layer/`。

## 数据与信号

模型与附着层共用接触几何：

```text
bounce_layer_response
grab_depth
nvec = [nvec_x, nvec_y, nvec_z]
```

当前目录只提供 `init`，将 `bounce_layer_response` 置零；具体反弹位移、冲量和摩擦由 `cube`、普通实心介质等响应函数直接生成。

## 行为

深层响应通常会：

1. 设置 `bounce_layer_response = 1`；
2. 取消同一点的 `grab_layer_response`；
3. 根据侵入深度输出 `shift`；
4. 根据沿法线进入速度和材质反弹参数输出 `impulse`；
5. 加入切向摩擦。

刚体汇总时累计反弹接触数量，并复用接触法线统计。对于水、岩浆等流体，层响应还会保留代表性流体材质，供浮力与声音系统使用。
