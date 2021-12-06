#!/bin/bash

git submodule update --init --recursive

pushd td
rm -rf build
mkdir build
cd build

export CXXFLAGS="-stdlib=libc++"
export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr/local \
  -DTD_ENABLE_JNI=ON \
  -GNinja .. || exit 1

sudo cmake --build . --target install || exit 1

popd
rm -rf build
mkdir build
pushd build

cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr/local \
  -GNinja .. || exit 1

sudo cmake --build . --target install || exit 1
popd
