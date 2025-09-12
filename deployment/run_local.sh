#!/bin/bash


# Function to generate a unique build folder name
generate_unique_folder() {
  base_name="build"
  folder_name=$base_name
  counter=1

  while [ -d "_bias1._bias1./$folder_name" ]; do
    folder_name="${base_name}_${counter}"
    ((counter++))
  done

  echo $folder_name
}

# Generate a unique build folder name
build_folder=$(generate_unique_folder)

# Create the new build folder
mkdir -p "_bias1._bias1./$build_folder"

# Navigate to the build folder and build the App target
cd "_bias1._bias1./$build_folder"
cmake _bias1._bias1.  # Configure the build system
make App  # Build the App target

# Return to the script directory
cd -



declare -a arr=(

"DOL-NoOblig_m01-Xh3-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m01-Xh5-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m01-Xh7-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m02-Xh3-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m02-Xh5-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m02-Xh7-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m03-Xh3-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m03-Xh5-Yh01-Kh1_Xn0.yml"
"DOL-NoOblig_m03-Xh7-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m01-Xh3-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m01-Xh5-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m01-Xh7-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m02-Xh3-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m02-Xh5-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m02-Xh7-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m03-Xh3-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m03-Xh5-Yh01-Kh1_Xn0.yml"
"DOL-Oblig_m03-Xh7-Yh01-Kh1_Xn0.yml"

"DOL-NoOblig_m01-Xh3-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m01-Xh5-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m01-Xh7-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m02-Xh3-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m02-Xh5-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m02-Xh7-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m03-Xh3-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m03-Xh5-Yh01-Kh4_Xn0.yml"
"DOL-NoOblig_m03-Xh7-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m01-Xh3-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m01-Xh5-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m01-Xh7-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m02-Xh3-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m02-Xh5-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m02-Xh7-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m03-Xh3-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m03-Xh5-Yh01-Kh4_Xn0.yml"
"DOL-Oblig_m03-Xh7-Yh01-Kh4_Xn0.yml"

"DOL-NoOblig_m01-Xh3-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m01-Xh5-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m01-Xh7-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m02-Xh3-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m02-Xh5-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m02-Xh7-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m03-Xh3-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m03-Xh5-Yh01-Kh7_Xn0.yml"
"DOL-NoOblig_m03-Xh7-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m01-Xh3-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m01-Xh5-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m01-Xh7-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m02-Xh3-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m02-Xh5-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m02-Xh7-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m03-Xh3-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m03-Xh5-Yh01-Kh7_Xn0.yml"
"DOL-Oblig_m03-Xh7-Yh01-Kh7_Xn0.yml"

#"DOL_m01-Xh3-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m01-Xh3-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m01-Xh5-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m01-Xh7-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m02-Xh3-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m02-Xh5-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m02-Xh7-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m03-Xh3-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m03-Xh5-Yh01_Xn0_Xo45_bias1.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo10_bias1.yml"
#"DOL_m03-Xh7-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m01-Xh3-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m01-Xh5-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m01-Xh7-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m02-Xh3-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m02-Xh5-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m02-Xh7-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m03-Xh3-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m03-Xh5-Yh01_Xn0_Xo45_bias1.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo10_bias1.yml"
#"NoDOL_m03-Xh7-Yh01_Xn0_Xo45_bias1.yml"

)

for i in "${arr[@]}"; do
  echo $i
  screen -d -S ${i} -m _bias1./build_bias1.sh ${i} $build_folder
done

screen -list

echo "Build executed in folder: $build_folder"