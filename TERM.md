前言

所有的功能都分为用户态和内核态。

比如opengl接口，也分为用户态接口就是我们通常看到的glxxx命令和gpu驱动（就是glxxx命令最后真正在内核怎么运行的），也可以理解为用户态是我们显示可见的一些命令， 内核态就是内核把这些命令怎么去交给硬件运行了

1）KMS

Kernel Mode Setting：用于显示设置分辨率 buffer等等，drm包括kms + 显存buffer管理。

2）OpenGL Mesa

打包不同显卡命令到个显卡共享buffer。

3）DRM

libdrm有些小的demo啊，想想显存数据咋存储的stride pitch这些，linear或者一块一块 方便邻近像素处理，纹理的放大 插值处理，这些都是硬件显存如何存储数据， 一行就是pitch尺寸然后下一行 这就是线性存储，然后硬件存储好了，最后才能显示到屏幕上。