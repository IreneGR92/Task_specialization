#!/bin/bash


declare -a arr=(

# Default

"DOL_m01-Xh3-Yh01_Xn0_Xo10_Default.yml"
"DOL_m01-Xh5-Yh01_Xn0_Xo10_Default.yml"
"DOL_m01-Xh7-Yh01_Xn0_Xo10_Default.yml"
"DOL_m02-Xh3-Yh01_Xn0_Xo10_Default.yml"
"DOL_m02-Xh5-Yh01_Xn0_Xo10_Default.yml"
"DOL_m02-Xh7-Yh01_Xn0_Xo10_Default.yml"
"DOL_m03-Xh3-Yh01_Xn0_Xo10_Default.yml"
"DOL_m03-Xh5-Yh01_Xn0_Xo10_Default.yml"
"DOL_m03-Xh7-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Xo10_Default.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Xo10_Default.yml"


# Bias 1

"DOL_m01-Xh3-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m01-Xh3-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m01-Xh3-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m01-Xh5-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m01-Xh7-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m02-Xh3-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m02-Xh5-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m02-Xh7-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m03-Xh3-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m03-Xh5-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo45_Bias1.yml"
"DOL_m03-Xh7-Yh01_Xn0_Xo10_Bias1.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo15_Bias1.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo45_Bias1.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Xo10_Bias1.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo15_Bias1.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo45_Bias1.yml"


# Dispersal 50%

#"DOL_m01-Xh3-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m01-Xh3-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo45_Dispersal05.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo10_Dispersal05.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo45_Dispersal05.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo10_Dispersal05.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo45_Dispersal05.yml"


# Half relatedness

#"DOL_m01-Xh3-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m01-Xh3-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo45_HalfRel.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo10_HalfRel.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo45_HalfRel.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo10_HalfRel.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo45_HalfRel.yml"


)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
