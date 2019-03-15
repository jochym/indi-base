#!/bin/bash

set -x -e

# Build everything on master
echo "==> Building INDI Core"
mkdir -p build/libindi
pushd build/libindi
cmake -DINDI_BUILD_UNITTESTS=ON -DCMAKE_INSTALL_PREFIX=/usr/local/ . ../../libindi/ -DFIX_WARNINGS=ON -DCMAKE_BUILD_TYPE=$1
make
sudo make install
popd

exit 0

