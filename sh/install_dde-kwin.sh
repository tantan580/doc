#!/bin/bash
cd ~/kwin/build/
cmake ~/kwin/src/dde-kwin -DCMAKE_BUILD_TYPE=Debug
mkdir dde-kwin
cd ~/kwin/build/dde-kwin
sudo make install -j16

