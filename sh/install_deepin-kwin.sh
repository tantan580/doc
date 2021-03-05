#!/bin/bash
cd ~/kwin/build/
cmake ~/kwin/src/deepin-kwin -DCMAKE_BUILD_TYPE=Debug
mkdir deepin-kwin
cd ~/kwin/build/deepin-kwin
sudo make install -j16

