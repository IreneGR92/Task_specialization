#!/bin/bash


declare -a arr=(

"DOL_m015-Xh3-Yh01_default_RN-DispersalRank.yml"
"DOL_m015-Xh3-Yh01_NoRelatedness_RN-DispersalRank.yml"
"DOL_m015-Xh3-Yh01_Xn0_RN-DispersalRank.yml"
"DOL_m015-Xh5-Yh01_default_RN-DispersalRank.yml"
"DOL_m015-Xh5-Yh01_NoRelatedness_RN-DispersalRank.yml"
"DOL_m015-Xh5-Yh01_Xn0_RN-DispersalRank.yml"
"DOL_m015-Xh7-Yh01_default_RN-DispersalRank.yml"
"DOL_m015-Xh7-Yh01_NoRelatedness_RN-DispersalRank.yml"
"DOL_m015-Xh7-Yh01_Xn0_RN-DispersalRank.yml"
"DOL_m025-Xh3-Yh01_default_RN-DispersalRank.yml"
"DOL_m025-Xh3-Yh01_NoRelatedness_RN-DispersalRank.yml"
"DOL_m025-Xh3-Yh01_Xn0_RN-DispersalRank.yml"
"DOL_m025-Xh5-Yh01_default_RN-DispersalRank.yml"
"DOL_m025-Xh5-Yh01_NoRelatedness_RN-DispersalRank.yml"
"DOL_m025-Xh5-Yh01_Xn0_RN-DispersalRank.yml"
"DOL_m025-Xh7-Yh01_default_RN-DispersalRank.yml"
"DOL_m025-Xh7-Yh01_NoRelatedness_RN-DispersalRank.yml"
"DOL_m025-Xh7-Yh01_Xn0_RN-DispersalRank.yml"
"NoDOL_m015-Xh3-Yh01_default_RN-DispersalRank.yml"
"NoDOL_m015-Xh3-Yh01_NoRelatedness_RN-DispersalRank.yml"
"NoDOL_m015-Xh3-Yh01_Xn0_RN-DispersalRank.yml"
"NoDOL_m015-Xh5-Yh01_default_RN-DispersalRank.yml"
"NoDOL_m015-Xh5-Yh01_NoRelatedness_RN-DispersalRank.yml"
"NoDOL_m015-Xh5-Yh01_Xn0_RN-DispersalRank.yml"
"NoDOL_m015-Xh7-Yh01_default_RN-DispersalRank.yml"
"NoDOL_m015-Xh7-Yh01_NoRelatedness_RN-DispersalRank.yml"
"NoDOL_m015-Xh7-Yh01_Xn0_RN-DispersalRank.yml"
"NoDOL_m025-Xh3-Yh01_default_RN-DispersalRank.yml"
"NoDOL_m025-Xh3-Yh01_NoRelatedness_RN-DispersalRank.yml"
"NoDOL_m025-Xh3-Yh01_Xn0_RN-DispersalRank.yml"
"NoDOL_m025-Xh5-Yh01_default_RN-DispersalRank.yml"
"NoDOL_m025-Xh5-Yh01_NoRelatedness_RN-DispersalRank.yml"
"NoDOL_m025-Xh5-Yh01_Xn0_RN-DispersalRank.yml"
"NoDOL_m025-Xh7-Yh01_default_RN-DispersalRank.yml"
"NoDOL_m025-Xh7-Yh01_NoRelatedness_RN-DispersalRank.yml"
"NoDOL_m025-Xh7-Yh01_Xn0_RN-DispersalRank.yml"

)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m ./build.sh ${i}

done

screen -list
