#!/bin/bash


declare -a arr=(


# Tobi's PC runs
"DOL_m01-Xh3-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m01-Xh5-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m01-Xh7-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m02-Xh3-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m02-Xh5-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m02-Xh7-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m03-Xh3-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m03-Xh5-Yh01_default_Dispersal05_HalfRel.yml"
"DOL_m03-Xh7-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m01-Xh3-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m01-Xh5-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m01-Xh7-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m02-Xh3-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m02-Xh5-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m02-Xh7-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m03-Xh3-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m03-Xh5-Yh01_default_Dispersal05_HalfRel.yml"
"NoDOL_m03-Xh7-Yh01_default_Dispersal05_HalfRel.yml"

"DOL_m01-Xh3-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m01-Xh5-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m01-Xh7-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m02-Xh3-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m02-Xh5-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m02-Xh7-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m03-Xh3-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m03-Xh5-Yh01_NoRelatedness_Dispersal05.yml"
"DOL_m03-Xh7-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m01-Xh3-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m01-Xh5-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m01-Xh7-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m02-Xh3-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m02-Xh5-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m02-Xh7-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m03-Xh3-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m03-Xh5-Yh01_NoRelatedness_Dispersal05.yml"
"NoDOL_m03-Xh7-Yh01_NoRelatedness_Dispersal05.yml"

"DOL_m01-Xh3-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m01-Xh5-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m01-Xh7-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m02-Xh3-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m02-Xh5-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m02-Xh7-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m03-Xh3-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m03-Xh5-Yh01_Xn0_Dispersal05_HalfRel.yml"
"DOL_m03-Xh7-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Dispersal05_HalfRel.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Dispersal05_HalfRel.yml"


# Iri's PC runs
"DOL_m01-Xh3-Yh01_default_Dispersal05.yml"
"DOL_m01-Xh5-Yh01_default_Dispersal05.yml"
"DOL_m01-Xh7-Yh01_default_Dispersal05.yml"
"NoDOL_m01-Xh3-Yh01_default_Dispersal05.yml"
"NoDOL_m01-Xh5-Yh01_default_Dispersal05.yml"
"NoDOL_m01-Xh7-Yh01_default_Dispersal05.yml"
"DOL_m02-Xh3-Yh01_default_Dispersal05.yml"
"DOL_m02-Xh5-Yh01_default_Dispersal05.yml"
"DOL_m02-Xh7-Yh01_default_Dispersal05.yml"
"NoDOL_m02-Xh3-Yh01_default_Dispersal05.yml"
"NoDOL_m02-Xh5-Yh01_default_Dispersal05.yml"
"NoDOL_m02-Xh7-Yh01_default_Dispersal05.yml"
"DOL_m03-Xh3-Yh01_default_Dispersal05.yml"
"DOL_m03-Xh5-Yh01_default_Dispersal05.yml"
"DOL_m03-Xh7-Yh01_default_Dispersal05.yml"
"NoDOL_m03-Xh3-Yh01_default_Dispersal05.yml"
"NoDOL_m03-Xh5-Yh01_default_Dispersal05.yml"
"NoDOL_m03-Xh7-Yh01_default_Dispersal05.yml"

"DOL_m01-Xh3-Yh01_Xn0_Dispersal05.yml"
"DOL_m01-Xh5-Yh01_Xn0_Dispersal05.yml"
"DOL_m01-Xh7-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m01-Xh3-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m01-Xh5-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m01-Xh7-Yh01_Xn0_Dispersal05.yml"
"DOL_m02-Xh3-Yh01_Xn0_Dispersal05.yml"
"DOL_m02-Xh5-Yh01_Xn0_Dispersal05.yml"
"DOL_m02-Xh7-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m02-Xh3-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m02-Xh5-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m02-Xh7-Yh01_Xn0_Dispersal05.yml"
"DOL_m03-Xh3-Yh01_Xn0_Dispersal05.yml"
"DOL_m03-Xh5-Yh01_Xn0_Dispersal05.yml"
"DOL_m03-Xh7-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m03-Xh3-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m03-Xh5-Yh01_Xn0_Dispersal05.yml"
"NoDOL_m03-Xh7-Yh01_Xn0_Dispersal05.yml"


)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
