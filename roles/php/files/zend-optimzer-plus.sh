#!/bin/bash

set -e

file=$0
trap "rm $file; exit" 0 1 2 3 15

cd /usr/local/src

if [ -d "ZendOptimizerPlus" ]; then
  echo "changed=False msg='already installed'"
  exit 0
fi

git clone git://github.com/zend-dev/ZendOptimizerPlus.git
cd ZendOptimizerPlus
git reset --hard v7.0.2
PHP_AUTOCONF=autoconf phpize

./configure \
  --with-php-config=/usr/bin/php-config

make -j2
make install

if [ $? -eq 0 ]; then
  echo "changed=True msg='installed successfully'"
  git clean -q -d -x -f
  exit 0
else
  echo "failed=True msg='make ZendOptimizerPlus failed'"
  exit 1
fi
