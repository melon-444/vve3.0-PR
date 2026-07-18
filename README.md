# vve3.0使用文档

&gt; 适用版本：1.21.5 \~ 26.2  
&gt; 前置依赖：math3.1, math3.1_lalib, math3.1_gelib  
&gt; 命名空间：vve, vve_examples, module_control  

---

## 1.基本介绍

### 什么是vve？

vve (vanilla vehicle engine) 是一款由小豆8593 (游戏ID：xiaodou123) 开发的以性能和实用性为主的原版Minecraft物理引擎数据包。

<details>
<summary>vve的诞生历史</summary>
<div style="background-color: #3936dc34; border-radius: 10px; padding: 20px; position: relative;">
最早的vve1诞生于mc1.17时代，那时展示实体尚未出现。vve1探索了使用盔甲架组成多实体结构的技术，已经能够模拟出汽车、飞机、船等多种多样的载具效果。

【[mc命令] 载具引擎(vve)演示视频】 https://www.bilibili.com/video/BV1yU4y1k7Ag/

受限于当时的原版命令技术，vve1引擎的性能压力成为主要瓶颈。当时在游戏中几乎只能实时运行1~3辆载具。

vve2诞生于一年后的mc1.19.4时代，一个重要的技术更新：展示实体出现了。vve2探索了基于展示实体的刚体模拟技术，实现了球陀螺状刚体的碰撞、着陆、摩擦等复杂效果，并提出了vve的重要概念：碰撞点模型。

【[mc命令] 刚体物理引擎vve_2.0开发日志】 https://www.bilibili.com/video/BV13j411o7wN/

vve2引擎并没有支持惯性张量的计算，其次vve2不支持模拟载具，最后性能仍然是vve2获得实用性的一个瓶颈：当时最多实时模拟10~20个刚体。
</div>
</details>

随着近些年作者对原版MC性能理论的建立，以及进行了越来越多的性能测试，作者决定开发一个整合了前两代经验的vve3引擎。

vve3实现了对性能的精准把控，最多可以支持上百个物体实时运行。在功能上，vve既可以模拟载具，又可以模拟像多面体骰子这样的小物件，支持了对惯性张量的计算。

【可以在MC跑团了？纯指令物理模拟实例——跑团骰子【模组发布】】 https://www.bilibili.com/video/BV1LX9fB8Ek3/

### 可以用vve来做什么？

1. 设计质点模型：

        性能最好的物理模型。质点模型也可以使用介质探测函数，  
        与刚体共享同一套世界介质模型。

2. 设计刚体模型：  

        由多个碰撞点支撑的物理体，使用四元数旋转，可以进行着陆与姿态修正，  
        支持外部访问其局部坐标系。

3. 设计介质模型：

        通常是静止不动的世界元素，分为实体和方块两类。  
        支持斜面、曲面等复杂建模。

以上是vve3最基本的三类模型。更复杂的物理体由以上三者组合，并加上特殊功能的程序来实现。

## 2.安装方法

除了vve3本体数据包之外，您还需要安装以下几个依赖：

* 前置数据包
  1. [数学库](https://github.com/xiaodou8593/math3.1) 3.1.2及以上版本
  2. [线性代数库](https://github.com/xiaodou8593/math3.1_lalib) 3.1.2及以上版本
  3. [图形库](https://github.com/xiaodou8593/math3.1_gelib) 3.1.2及以上版本（可选，用于可视化测试）
* 模块构建器
  1. [mot](https://github.com/xiaodou8593/mot_2.0) 2.0.0及以上版本

请手动初始化所有数据包：

```bash
function math:_init
function math:_init_la
function vve:_init
```

如果额外安装了图形库：

```bash
function math:_init_ge
function math:particles/_load_1214
```
<details>
<summary>对于原版模组作者</summary>
如果您是原版模组作者，希望所有数据包在load时自动加载，请打开`#minecraft:load`标签的函数，追加以下内容：

```bash
function math:_version
execute unless score version int matches 312.. run return run tellraw @a {"text":"[vve3]: 依赖错误，请安装math3.1.2及以上版本！","color":"red","click_event":{"action":"open_url","url":"https://github.com/xiaodou8593/math3.1"}}
execute unless score math_init_version int = version int run function math:_init

function math:_version_la
execute unless score version_la int matches 312.. run return run tellraw @a {"text":"[vve3]: 依赖错误，请安装math3.1.2_lalib及以上版本！","color":"red","click_event":{"action":"open_url","url":"https://github.com/xiaodou8593/math3.1_lalib"}}
execute unless score math_la_init_version int = version_la int run function math:_init_la

function vve:_version
execute unless score version_vve int matches 301.. run return run tellraw @a {"text":"[vve3]: 版本错误，请安装vve3.0.1及以上版本！","color":"red","click_event":{"action":"open_url","url":"https://github.com/xiaodou8593/vve3.0"}}
execute unless score vve_init_version int = version_vve int run function vve:_init
```

如果您也希望图形库自动加载：

```bash
function math:_version_ge
execute unless score version_ge int matches 312.. run return run tellraw @a {"text":"[vve3]: 依赖错误，请安装math3.1.2_gelib及以上版本！","color":"red","click_event":{"action":"open_url","url":"https://github.com/xiaodou8593/math3.1_gelib"}}
execute unless score math_ge_init_version int = version_ge int run function math:_init_ge
function math:particles/_load_1214
```
</details>

## 3.快速开始

运行mot2.0.ahk，快捷创建一个数据包。

在datapacks目录下，按快捷键ctrl+p。

* 输入数据包名称：vve_test
* 输入命名空间：vve_test

模块目录(data/vve_test/function文件夹)此时自动弹出，在此处按ctrl+m运行mot记忆栈，输入以下命令：

```
push vve_block_1.0
```

使窗口焦点回到模块目录，按快捷键ctrl+o创建对象格式文档。**请注意该步操作在运行push命令之后，才能加载预设字段。**

回到mot记忆栈，依次运行以下命令构建模块：

```
run
init
sync
stop
pop
```

接下来，我们继续为模块构建自动化测试：

```
push vve_test_1.0
run
init
sync
stop
pop
stop
```

回到mc聊天栏执行命令，重新加载数据包，运行自动化测试：

```
reload
# 如果是地形正常生成的世界，请使用fill确保测试坐标附近空旷
execute positioned 0 100 0 run fill ~-20 ~-9 ~-20 ~20 ~9 ~20 air
function vve_test:test/_auto
```

由于vve_block_1.0是无介质刚体模型，物体之间没有碰撞检测。因此应观察到前四个测试正常运行，而inter_bounce碰撞测试中两个方块相互穿过。

接下来我们介绍模块的常用接口。

* `$(module_prefix)`代表模块的前缀
* `$(project_name)`代表模块的命名空间
* `$(module_name)`代表模块名

对于一个路径形如`data/namespace/function/foo/bar`的模块来说：

* `$(module_prefix)`为`"namespace:foo/bar/"`
* `$(project_name)`为`"namespace"`
* `$(module_name)`为`"bar"`

对于上面的示例模块来说：
* `$(module_prefix)`为`"vve_test:"`
* `$(project_name)`为`"vve_test"`
* `$(module_name)`为`"vve_test"`

一个物体模块的常用接口如下：

1. `$(module_prefix)init`

        初始化模块，创建所需的记分板和数据结构，并调用`$(module_prefix)_class`和`$(module_prefix)_consts`两个接口。

2. `$(module_prefix)_class`

        构建物体的数据模板。默认该物体的坐标、速度、角速度为0，  
        初始姿态为z+方向0横滚角。  
        <a,int,1w>为半边长，默认为0.25格  
        <mass,int,1>为质量，默认为17kg  
        <inertia,int,100>为惯量，默认为5kg·m^2
        修改物体尺寸时，请注意惯量需要平方倍缩放。例如物体放大为2倍，惯量应放大为4倍。
        修改物体质量时，请注意惯量需要等比例缩放。例如质量放大为3倍，惯量应放大为3倍。
        数据模板储存在storage $(project_name):class $(module_name)_plate这个位置以供使用。

3. `$(module_prefix)_consts`

        设置该模块所需的常量。

4. `$(module_prefix)_new`

        输入物体的数据模板，并传入一个执行位置，生成模块实例。
        实例的根实体输出为entity @e[tag=result,limit=1]
        使用方法如下：
        data modify storage $(project_name):io input set from storage $(project_name):class $(module_name)_plate
        function $(module_prefix)_proj
        # 使用世界实体和vve:object/_anchor_to方法加载当前位置和朝向的位置和姿态
        execute as @e[tag=math_marker,limit=1] run function vve:object/_anchor_to
        function $(module_prefix)_model
        data modify storage $(project_name):io input set from storage $(project_name):io result
        data modify entity @e[tag=math_marker,limit=1] Pos set from storage $(project_name):io input.center
        execute at @e[tag=math_marker,limit=1] run function $(module_prefix)_new
        execute as @e[tag=result,limit=1] run say hi

5. `$(module_prefix)_del`

        传入实例根实体为执行者，销毁模块实例。
        使用方法如下：
        execute @e[tag=$(project_name)_$(module_name),limit=1,sort=nearest] run function $(module_prefix)_del

## 4.文档导航