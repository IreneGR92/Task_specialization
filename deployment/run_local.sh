#!/bin/bash


declare -a arr=(

"DOL_m01-Xh3-Yh01_default_Geront.yml"
"DOL_m01-Xh5-Yh01_default_Geront.yml"
"DOL_m01-Xh7-Yh01_default_Geront.yml"
"DOL_m02-Xh3-Yh01_default_Geront.yml"
"DOL_m02-Xh5-Yh01_default_Geront.yml"
"DOL_m02-Xh7-Yh01_default_Geront.yml"
"DOL_m03-Xh3-Yh01_default_Geront.yml"
"DOL_m03-Xh5-Yh01_default_Geront.yml"
"DOL_m03-Xh7-Yh01_default_Geront.yml"
"DOL_m015-Xh3-Yh01_default_Geront.yml"
"DOL_m015-Xh5-Yh01_default_Geront.yml"
"DOL_m015-Xh7-Yh01_default_Geront.yml"
"DOL_m025-Xh3-Yh01_default_Geront.yml"
"DOL_m025-Xh5-Yh01_default_Geront.yml"
"DOL_m025-Xh7-Yh01_default_Geront.yml"
"NoDOL_m01-Xh3-Yh01_default_Geront.yml"
"NoDOL_m01-Xh5-Yh01_default_Geront.yml"
"NoDOL_m01-Xh7-Yh01_default_Geront.yml"
"NoDOL_m02-Xh3-Yh01_default_Geront.yml"
"NoDOL_m02-Xh5-Yh01_default_Geront.yml"
"NoDOL_m02-Xh7-Yh01_default_Geront.yml"
"NoDOL_m03-Xh3-Yh01_default_Geront.yml"
"NoDOL_m03-Xh5-Yh01_default_Geront.yml"
"NoDOL_m03-Xh7-Yh01_default_Geront.yml"
"NoDOL_m015-Xh3-Yh01_default_Geront.yml"
"NoDOL_m015-Xh5-Yh01_default_Geront.yml"
"NoDOL_m015-Xh7-Yh01_default_Geront.yml"
"NoDOL_m025-Xh3-Yh01_default_Geront.yml"
"NoDOL_m025-Xh5-Yh01_default_Geront.yml"
"NoDOL_m025-Xh7-Yh01_default_Geront.yml"

"DOL_m01-Xh3-Yh01_NoRelatedness_Geront.yml"
"DOL_m01-Xh5-Yh01_NoRelatedness_Geront.yml"
"DOL_m01-Xh7-Yh01_NoRelatedness_Geront.yml"
"DOL_m02-Xh3-Yh01_NoRelatedness_Geront.yml"
"DOL_m02-Xh5-Yh01_NoRelatedness_Geront.yml"
"DOL_m02-Xh7-Yh01_NoRelatedness_Geront.yml"
"DOL_m03-Xh3-Yh01_NoRelatedness_Geront.yml"
"DOL_m03-Xh5-Yh01_NoRelatedness_Geront.yml"
"DOL_m03-Xh7-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m01-Xh3-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m01-Xh5-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m01-Xh7-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m02-Xh3-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m02-Xh5-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m02-Xh7-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m03-Xh3-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m03-Xh5-Yh01_NoRelatedness_Geront.yml"
"NoDOL_m03-Xh7-Yh01_NoRelatedness_Geront.yml"

"DOL_m01-Xh3-Yh01_Xn0_Geront.yml"
"DOL_m01-Xh5-Yh01_Xn0_Geront.yml"
"DOL_m01-Xh7-Yh01_Xn0_Geront.yml"
"DOL_m02-Xh3-Yh01_Xn0_Geront.yml"
"DOL_m02-Xh5-Yh01_Xn0_Geront.yml"
"DOL_m02-Xh7-Yh01_Xn0_Geront.yml"
"DOL_m03-Xh3-Yh01_Xn0_Geront.yml"
"DOL_m03-Xh5-Yh01_Xn0_Geront.yml"
"DOL_m03-Xh7-Yh01_Xn0_Geront.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Geront.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Geront.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Geront.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Geront.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Geront.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Geront.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Geront.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Geront.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Geront.yml"


#"DOL_m01-Xh3-Yh01_default_Scramb.yml"
#"DOL_m01-Xh5-Yh01_default_Scramb.yml"
#"DOL_m01-Xh7-Yh01_default_Scramb.yml"
#"DOL_m02-Xh3-Yh01_default_Scramb.yml"
#"DOL_m02-Xh5-Yh01_default_Scramb.yml"
#"DOL_m02-Xh7-Yh01_default_Scramb.yml"
#"DOL_m03-Xh3-Yh01_default_Scramb.yml"
#"DOL_m03-Xh5-Yh01_default_Scramb.yml"
#"DOL_m03-Xh7-Yh01_default_Scramb.yml"
#"DOL_m015-Xh3-Yh01_default_Scramb.yml"
#"DOL_m015-Xh5-Yh01_default_Scramb.yml"
#"DOL_m015-Xh7-Yh01_default_Scramb.yml"
#"DOL_m025-Xh3-Yh01_default_Scramb.yml"
#"DOL_m025-Xh5-Yh01_default_Scramb.yml"
#"DOL_m025-Xh7-Yh01_default_Scramb.yml"
#"NoDOL_m01-Xh3-Yh01_default_Scramb.yml"
#"NoDOL_m01-Xh5-Yh01_default_Scramb.yml"
#"NoDOL_m01-Xh7-Yh01_default_Scramb.yml"
#"NoDOL_m02-Xh3-Yh01_default_Scramb.yml"
#"NoDOL_m02-Xh5-Yh01_default_Scramb.yml"
#"NoDOL_m02-Xh7-Yh01_default_Scramb.yml"
#"NoDOL_m03-Xh3-Yh01_default_Scramb.yml"
#"NoDOL_m03-Xh5-Yh01_default_Scramb.yml"
#"NoDOL_m03-Xh7-Yh01_default_Scramb.yml"
#"NoDOL_m015-Xh3-Yh01_default_Scramb.yml"
#"NoDOL_m015-Xh5-Yh01_default_Scramb.yml"
#"NoDOL_m015-Xh7-Yh01_default_Scramb.yml"
#"NoDOL_m025-Xh3-Yh01_default_Scramb.yml"
#"NoDOL_m025-Xh5-Yh01_default_Scramb.yml"
#"NoDOL_m025-Xh7-Yh01_default_Scramb.yml"
#
#"DOL_m01-Xh3-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m01-Xh5-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m01-Xh7-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m02-Xh3-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m02-Xh5-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m02-Xh7-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m03-Xh3-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m03-Xh5-Yh01_NoRelatedness_Scramb.yml"
#"DOL_m03-Xh7-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m01-Xh3-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m01-Xh5-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m01-Xh7-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m02-Xh3-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m02-Xh5-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m02-Xh7-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m03-Xh3-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m03-Xh5-Yh01_NoRelatedness_Scramb.yml"
#"NoDOL_m03-Xh7-Yh01_NoRelatedness_Scramb.yml"
#
#"DOL_m01-Xh3-Yh01_Xn0_Scramb.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Scramb.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Scramb.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Scramb.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Scramb.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Scramb.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Scramb.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Scramb.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Scramb.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Scramb.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Scramb.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Scramb.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Scramb.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Scramb.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Scramb.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Scramb.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Scramb.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Scramb.yml"

)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
