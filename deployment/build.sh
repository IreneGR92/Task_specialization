#!/usr/bin/env bash


name=${PWD##*/}
echo $@

cd ../build/
./App "../parameters/$@"

mv *$@* /home/odin/TresoritDrive/Results/Task_specialization_results

echo "done"
