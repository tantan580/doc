###### 配置vscode

1）按下ctrl+shift+p组合键，然后输入task选择配置任务

2） 在vscode 界面上，按F5，选择C++(GDB//LLDB)，接着选择默认配置，会自动生成launch.json文件，这个文件是加载gdb的配置文件 ，也是用来调试的配置文件。

**参数解释：**

 1）`"program": "enter program name, for example ${workspaceFolder}/build/bin/kwin_x11",`

 说明 执行程序的路径，这个文件应该是通过make install 生成的二进制执行文件

2） `"args": [`

​                `"--replace"`

​            `],`

程序运行的命令行。通过--replace 可以替换当前的kwin-x11 进程

3）`"environment": [                {`

​                    `"name": "DISPLAY",`

​                    `"value": ":0.0"`

​                `}`

​            `],`

环境变量的配置，对于X11程序，每次运行要指定DISPLAY .可以在这里配置，可以设置必要的调试变量，这样就不用每次都输入环境了

4） `"miDebuggerPath": "/usr/bin/gdb",`

 指定 gdb 的路径

###### 总结

1）vscode在下面面板上运行cmake时，会自动在CMakeLists.txt的同级目录下生成build目录 

2）vscode自动生成项目目录结构--

1. vscode安装插件，project-tree
2. 安装之后按ctrl+shift+p，并输入Project Tree回车
3. 点击要生成目录的项目，回车
4. 将项目目录生成并存储到README.md中

3)LD_LIBRARY_PATH`是Linux环境变量名，该环境变量主要用于指定查找共享库（动态链接库）时除了默认路径之外的其他路径。