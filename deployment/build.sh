#!/usr/bin/env bash


name=${PWD##*/}
echo $1

build_folder=$2  # Get the build folder name from the second argument

cd "../$build_folder"

./App "../parameters/$1"

mv *"${1%.yml}"* /home/odin/TresoritDrive/Results/Task_specialization_results

echo "done"
