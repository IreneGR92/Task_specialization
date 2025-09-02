#!/bin/bash


declare -a arr=(

"DOL-NoOblig_m01-Xh3-Yh01_Xn0.yml"
"DOL-NoOblig_m01-Xh5-Yh01_Xn0.yml"
"DOL-NoOblig_m01-Xh7-Yh01_Xn0.yml"
"DOL-NoOblig_m02-Xh3-Yh01_Xn0.yml"
"DOL-NoOblig_m02-Xh5-Yh01_Xn0.yml"
"DOL-NoOblig_m02-Xh7-Yh01_Xn0.yml"
"DOL-NoOblig_m03-Xh3-Yh01_Xn0.yml"
"DOL-NoOblig_m03-Xh5-Yh01_Xn0.yml"
"DOL-NoOblig_m03-Xh7-Yh01_Xn0.yml"

"DOL-NoOblig_m01-Xh3-Yh01_default.yml"
"DOL-NoOblig_m01-Xh5-Yh01_default.yml"
"DOL-NoOblig_m01-Xh7-Yh01_default.yml"
"DOL-NoOblig_m02-Xh3-Yh01_default.yml"
"DOL-NoOblig_m02-Xh5-Yh01_default.yml"
"DOL-NoOblig_m02-Xh7-Yh01_default.yml"
"DOL-NoOblig_m03-Xh3-Yh01_default.yml"
"DOL-NoOblig_m03-Xh5-Yh01_default.yml"
"DOL-NoOblig_m03-Xh7-Yh01_default.yml"

"DOL-NoOblig_m01-Xh3-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m01-Xh5-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m01-Xh7-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m02-Xh3-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m02-Xh5-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m02-Xh7-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m03-Xh3-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m03-Xh5-Yh01_NoRelatedness.yml"
"DOL-NoOblig_m03-Xh7-Yh01_NoRelatedness.yml"

)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
