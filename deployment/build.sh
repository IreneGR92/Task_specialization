#!/usr/bin/env bash


name=${PWD##*/}
echo $1

parameter_name=${1%.yml}

build_folder=$2  # Get the build folder name from the second argument

cd "../$build_folder"

./App "../parameters/$1"

cp last_generation_parameters_"$parameter_name".txt /home/odin/TresoritDrive/Results/Task_specialization_results
cp main_parameters_"$parameter_name".txt /home/odin/TresoritDrive/Results/Task_specialization_results

echo "done"
