#!/bin/bash


declare -a arr=(

"DOL_m01-Xh5-Yh1_default.yml"
"DOL_m01-Xh5-Yh1_NoRelatedness.yml"
"DOL_m01-Xh5-Yh1_Xn0.yml"
"DOL_m01-Xh5-Yh05_default.yml"
"DOL_m01-Xh5-Yh05_NoRelatedness.yml"
"DOL_m01-Xh5-Yh05_Xn0.yml"
"DOL_m01-Xh5-Yh005_default.yml"
"DOL_m01-Xh5-Yh005_NoRelatedness.yml"
"DOL_m01-Xh5-Yh005_Xn0.yml"
"DOL_m02-Xh5-Yh1_default.yml"
"DOL_m02-Xh5-Yh1_NoRelatedness.yml"
"DOL_m02-Xh5-Yh1_Xn0.yml"
"DOL_m02-Xh5-Yh05_default.yml"
"DOL_m02-Xh5-Yh05_NoRelatedness.yml"
"DOL_m02-Xh5-Yh05_Xn0.yml"
"DOL_m02-Xh5-Yh005_default.yml"
"DOL_m02-Xh5-Yh005_NoRelatedness.yml"
"DOL_m02-Xh5-Yh005_Xn0.yml"
"DOL_m03-Xh5-Yh1_default.yml"
"DOL_m03-Xh5-Yh1_NoRelatedness.yml"
"DOL_m03-Xh5-Yh1_Xn0.yml"
"DOL_m03-Xh5-Yh05_default.yml"
"DOL_m03-Xh5-Yh05_NoRelatedness.yml"
"DOL_m03-Xh5-Yh05_Xn0.yml"
"DOL_m03-Xh5-Yh005_default.yml"
"DOL_m03-Xh5-Yh005_NoRelatedness.yml"
"DOL_m03-Xh5-Yh005_Xn0.yml"
"NoDOL_m01-Xh5-Yh1_default.yml"
"NoDOL_m01-Xh5-Yh1_NoRelatedness.yml"
"NoDOL_m01-Xh5-Yh1_Xn0.yml"
"NoDOL_m01-Xh5-Yh05_default.yml"
"NoDOL_m01-Xh5-Yh05_NoRelatedness.yml"
"NoDOL_m01-Xh5-Yh05_Xn0.yml"
"NoDOL_m01-Xh5-Yh005_default.yml"
"NoDOL_m01-Xh5-Yh005_NoRelatedness.yml"
"NoDOL_m01-Xh5-Yh005_Xn0.yml"
"NoDOL_m02-Xh5-Yh1_default.yml"
"NoDOL_m02-Xh5-Yh1_NoRelatedness.yml"
"NoDOL_m02-Xh5-Yh1_Xn0.yml"
"NoDOL_m02-Xh5-Yh05_default.yml"
"NoDOL_m02-Xh5-Yh05_NoRelatedness.yml"
"NoDOL_m02-Xh5-Yh05_Xn0.yml"
"NoDOL_m02-Xh5-Yh005_default.yml"
"NoDOL_m02-Xh5-Yh005_NoRelatedness.yml"
"NoDOL_m02-Xh5-Yh005_Xn0.yml"
"NoDOL_m03-Xh5-Yh1_default.yml"
"NoDOL_m03-Xh5-Yh1_NoRelatedness.yml"
"NoDOL_m03-Xh5-Yh1_Xn0.yml"
"NoDOL_m03-Xh5-Yh05_default.yml"
"NoDOL_m03-Xh5-Yh05_NoRelatedness.yml"
"NoDOL_m03-Xh5-Yh05_Xn0.yml"
"NoDOL_m03-Xh5-Yh005_default.yml"
"NoDOL_m03-Xh5-Yh005_NoRelatedness.yml"
"NoDOL_m03-Xh5-Yh005_Xn0.yml"

)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
