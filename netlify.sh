#!/bin/sh

set -e

jekyll build
rm -rf htmltest
mkdir -p htmltest
# our baseUrl is /docs so we need to create that structure for htmltest
# otherwise it would fail to find absolute links like /docs/3.5
cp -a _site htmltest/docs

cd /tmp
wget https://github.com/wjdp/htmltest/releases/download/v0.10.1/htmltest_0.10.1_linux_amd64.tar.gz
echo "TESTTEESTEETST"
sleep 10
tar xvzf htmltest_0.10.1_linux_amd64.tar.gz
echo "TESTTEESTEETST2"
sleep 10
mv htmltest /usr/local/bin
cd -
htmltest -s

