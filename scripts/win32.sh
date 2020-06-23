git submodule update --init --recursive

cd td
rm -rf build
mkdir build
cd build
cmake -A Win32 -DCMAKE_INSTALL_PREFIX:PATH=.. -DTD_ENABLE_JNI=ON -DCMAKE_TOOLCHAIN_FILE:FILEPATH=../../vcpkg/scripts/buildsystems/vcpkg.cmake ..
cmake --build . --target install --config Release --verbose
cd ../..
rm -rf build
mkdir build
cd build
cmake -A Win32 -DCMAKE_INSTALL_PREFIX:PATH=../td/tdlib -DCMAKE_TOOLCHAIN_FILE:FILEPATH=../vcpkg/scripts/buildsystems/vcpkg.cmake -DTd_DIR:PATH=$(readlink -e ../td/lib/cmake/Td) ..
cmake --build . --target install --config Release
mv Release/tdjni.dll ..
