#!/usr/bin/env bash


name=${PWD##*/}
echo $@

cd ../build/
./App "../parameters/$@"


sleep 10
echo "done"
