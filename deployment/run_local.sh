#!/bin/bash


declare -a arr=(


"DOL_m01-Xh3-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m01-Xh3-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m01-Xh5-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m01-Xh5-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m01-Xh7-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m01-Xh7-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m02-Xh3-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m02-Xh3-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m02-Xh5-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m02-Xh5-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m02-Xh7-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m02-Xh7-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m03-Xh3-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m03-Xh3-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m03-Xh5-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m03-Xh5-Yh01_Xn0_Xo5_Geront.yml"
"DOL_m03-Xh7-Yh01_Xn0_Xo3_Geront.yml"
"DOL_m03-Xh7-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Xo5_Geront.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Xo3_Geront.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Xo5_Geront.yml"


)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
