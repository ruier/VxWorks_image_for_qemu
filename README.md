# VxWorks_image_for_qemu

## 项目简介

本项目是在 Windows 系统编译运行 X86 平台 VxWorks 6.6 系统，使用的模拟软件是 qemu for Windows

Host：联想 thinkVISON 64 位 + Windows 10 专业版

target：pc-i440fx-2.10       Standard PC (i440FX + PIIX, 1996)

VxWorks： VxWorks 6.6 + workbench 3.0 （x86）

qemu：QEMU emulator version 2.10.1 (v2.10.1-11671-g7b8ea962d8-dirty)

## 所需资源

### qemu for Windows：

在官网下载的最新安装文件（64bit）：https://qemu.weilnetz.de/w64/qemu-w64-setup-20171006.exe

### VxWorks

收费软件，需购买

## 环境准备

1. 安装 qemu for Windows，请见：https://www.qemu.org/documentation/
2. 安装 VxWorks

## 编译 BootLoader

在 workbench 中新建 BSP BootLoader project – qemu_x86_boot，选择 pcPentium gnu 编译。然后制作启动盘，软盘启动盘:

```
mkboot a: bootrom

```

## 编译 VxWorks image

在 workbench 中新建 VIP project， BootLoader base 选择上面建立的 qemu_x86__boot，编译完成后，回到 qemu_x86_boot 工程，进入 shell 控制台：然后编译 st 镜像：

```
make vxWorks_st

```

构建一个空软盘并将 vxWorks_st 放进去，作为系统盘 vx.img

## 运行

在 cmd 控制台启动 qemu：

```
./qemu-system-i386.exe BOOTROM.IMG -fda vx.img

```

运行效果如图：

![启动完成](https://ruier.github.io/images/blog/qemu_vx_booted.png)

![查看进程](https://ruier.github.io/images/blog/qemu_vx_boot_i.png)
