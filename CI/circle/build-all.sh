#!/bin/bash

set -x -e

br=( master develop package travis pull )

build_all () {
    CI/circle/build-core.sh
    CI/circle/build-libs.sh
    #CI/circle/build-3rdparty.sh
}


if [ .${CIRCLE_BRANCH%_*} == '.drv' -a `lsb_release -si` == 'Ubuntu' ] ; then
    # Driver build branch
    build_all
else
    for i in "${br[@]}"
    do
       if [ .${CIRCLE_BRANCH%/*} == .$i ]; then
        build_all
       elif [[ ${CIRCLE_BRANCH%/*} =~ [a-zA-Z][a-zA-Z]*-patch-[0-9][0-9]* ]]; then
        build_all
       fi
    done
fi
