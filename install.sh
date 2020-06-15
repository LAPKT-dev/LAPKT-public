#!/bin/bash
cmake --clean-first -B build -S ./src -DCMAKE_INSTALL_PREFIX=release
cmake --build build -j $(grep -c ^processor /proc/cpuinfo) 
cmake --install build --component Development --prefix release

