#!/bin/bash
wkon py2 || { echo 'error !'; exit 1; }

CMAKE_BUILD_TYPE=Release
BUILD_DIR=build.$(echo ${CMAKE_BUILD_TYPE} | tr '[:upper:]' '[:lower:]')
rm -fr ${BUILD_DIR}
mkdir ${BUILD_DIR}
pushd ${BUILD_DIR}
cmake -DCMAKE_BUILD_TYPE=$CMAKE_BUILD_TYPE -DCMAKE_INCLUDE_PATH=$CONDA_ENV_PATH/include -DCMAKE_LIBRARY_PATH=$CONDA_ENV_PATH/lib ../

make -j 4
popd
