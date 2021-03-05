#!/bin/bash
sudo apt build-dep kwin -y
sudo apt build-dep dde-kwin -y
sudo apt build-dep kwin-x11 -y
sudo apt build-dep kwin-wayland -y
sudo apt install qt5-default cmake gdb   -y  
sudo apt install xserver-xorg-core-dbgsym  -y
sudo apt install qtcreator -y
