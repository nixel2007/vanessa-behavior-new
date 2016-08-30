#!/bin/bash
called_path=${0%/*}
stripped=${called_path#[^/]*}
real_path=`pwd`$stripped
#echo "called path: $called_path"
#echo "stripped: $stripped"
#echo "pwd: `pwd`"
#echo "real path: $real_path"

mode=$1
if [ -z "$mode" ]; then
    mode="../lib/CF/83NoSync"
fi

connstring=
USERPWD=

dir=`dirname $0`

export RUNNER_ENV=production

pushd $dir
oscript $real_path/init.os init-dev --src "$real_path/$mode"
oscript $real_path/init.os init-dev --dev --src "$real_path/$mode"
popd
