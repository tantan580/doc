https://it.uniontech.com/proxy/proxy.pac  公司代理

# 调试命令

## 检查

ls -l /usr/lib/aarch64-linux-gnu/libkwin.so*

若不对，建立软链接

sudo ln -s /usr/lib/aarch64-linux-gnu/libkwin.so.5.15.5 /usr/lib/aarch64-linux-gnu/libkwin.so.5 

## 调试工具及命令

### libinput

apt install libinput-tools

libinput debug-eventsk #使用它可以看一些底层发上来的input信号

### dbus

dbus-monitor | tee log #定向到文件

### 窗口

`\#!/bin/sh export DISPLAY=:0export QT_PLUGIN_PATH=/home/xyr/workspace/deepin-kwin-deploy/lib/x86_64-linux-gnu/plugins:$QT_PLUGIN_PATHexport QT_QPA_PLATFORM_PLUGIN_PATH=/home/xyr/workspace/deepin-kwin-deploy/lib/x86_64-linux-gnu/plugins/platforms:$QT_QPA_PLATFORM_PLUGIN_PATH# 指定查找运行库的位置export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib/x86_64-linux-gnu/ #export QT_LOGGING_RULES="kwin_core=true" # 用来选择输出log的种类 #":"后的"appFilePath=..."会传递给QPlatformIntegration::create调用# appFilePath 的值会覆盖 QCoreApplication::applicationPath，以确保kwin崩溃自动重启时也是启动的kwin_no_scale脚本/home/xyr/workspace/build-deepin-kwin-unknown-Debug/bin/kwin_x11 -platform dde-kwin-xcb --replace $@ #2> /home/$USER/kwin-$CURRENT_TIME.log`

xwininfo -root -tree | grep kwin_killer 

xev -id "kill 窗口ID" :看看收了哪个消息

xev -root |grep  “某个消息”

sudo libinput debug-events --show-keycodes  #监听键盘事件

qdbus org.kde.KWin /KWin showDebugConsole #查看client类型

qdbus org.kde.KWin /Effects activeEffects

qdbus org.kde.KWin /KWin showDebugConsole 

qdbus org.kde.KWin /Screenshot screenshotFullscreen 

qdbus org.kde.KWin /Screenshot interactive   #命令截取窗口

qdbus org.kde.KWin /Screenshot screenshotForWindow 



gsettings set com.deepin.dde.keyboard repeat-enable false  #关闭重复按键

dpkg -S libkwayland-shell.so #查找文件

 /etc/xdg/kwinrc

~/.config/kwinrc

sudo journalctl -b | tee ***.log #系统日志路径

#### x11窗口属性

x11下用xprop 工具看x11窗口的属性

xprop是查询窗口属性标识的(atom)，x

wininfo是查询窗口属性以及窗口的层次都可以。

 窗口id使用xwininfo.

#### wayland

export WAYLAND_DEBUG=server #调试wayland

qdbus com.deepin.daemon.KWayland /com/deepin/daemon/KWayland/Output ListOutput



**gsettings list-recursively com.deepin.dde.display**     

**gsettings list-recursively com.deepin.daemon.Display**     

**gsettings list-recursively com.deepin.xsettings | grep scale**



cd /sys/class/drm/card0-DP-1 #HDIM扩展屏     

cd /sys/class drm/card0-eDP-1 #主屏

![img](https://uploader.shimo.im/f/Xhe5oRsVLXBoxH3B.png!thumbnail)



##### UOS启动顺序

1.kwin会拉greeter 

2.使用greeter登录后，kwin杀掉greeter和kwin自己

3.然后再启动一遍kwin

sudo cat /var/log/lightdm/seat0-greeter.log   //看greeter的日志



vim /usr/share/xgreeters/lightdm-deepin-greeter.desktop(桌面启动）

# 显卡

## 常用命令

lspci -v | grep VGA -A10 #查询显卡

find /usr -name dri  #查找driver的路径

export LIBGL_DRIVERS_PATH=/usr/lib/mips64el-linux-gnuabi64/dri #设置环境变量选择驱动路径

export LIBGL_DEBUG=verbose #后运行3d程序会出来提示选择的是哪个驱动

LIBGL_ALWAYS_SOFTWARE=true GALLIUM_DRIVER=llvmpipe glxgears #指定glxgears使用llvm的driver

1. 判断驱动

   glxinfo|grep "OpenGL renderer"  

2. 查看amdgpu驱动的状态

lsmod | grep amdgpu





## 设置环境变量

vi /etc/profile 

export CLASSPATH=./JAVA_HOME/lib;$JAVA_HOME/jre/lib

source /etc/profile #执行这行代码后才会生效

# 调试

## coredump

sudo coredumpctl gdb  #崩溃调试

coredumpctl | tail

coredump info 进程号









# 虚拟机

sudo apt install open-vm-tools  #分辨率会保持和桌面一致

sudo apt install open-vm-tools-desktop  #会有复制粘贴）

# VSCODE

客户端安装（调试机）

sudo apt install openssh-client

生成密钥对,并拷贝公钥到服务器上

ssh-keygen

ssh-copy-id -i ~/.ssh/id_rsa.pub [user@192.168.1.4](mailto:user@192.168.1.4)

服务端（deepin-kwin)的机器sudo apt install openssh-server

# qtcreator

远程界面调试：ssh -X [tanfang@10.20.33.82](mailto:tanfang@10.20.33.82)                             

 然后启动qtcreator                             

修改环境变量：

kwin_x11 -platform dde-kwin-xcb --replace

这样才可以远程调试在qtcreator设置系统环境变量 ：

DISPLAY =:0

# 打包

sudo apt install devscripts

debian/rules里修改

override_dh_shlibdeps:

​    dh_shlibdeps --dpkg-shlibdeps-params=--ignore-missing-info

然后运行sudo debuild -us -uc -nc



# 软件

meld  --->比较文件

vscode 插件 ：Eclipse Keymap (alt + 左移，右移  用于看前一个记录）

