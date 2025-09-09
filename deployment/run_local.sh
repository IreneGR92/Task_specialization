#!/bin/bash


# Function to generate a unique build folder name
generate_unique_folder() {
  base_name="build"
  folder_name=$base_name
  counter=1

  while [ -d "../$folder_name" ]; do
    folder_name="${base_name}_${counter}"
    ((counter++))
  done

  echo $folder_name
}

# Generate a unique build folder name
build_folder=$(generate_unique_folder)

# Create the new build folder
mkdir -p "../$build_folder"

# Navigate to the build folder and build the App target
cd "../$build_folder"
cmake ..  # Configure the build system
make App  # Build the App target

# Return to the script directory
cd -



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
  screen -d -S ${i} -m ./build.sh ${i} $build_folder
done

screen -list

echo "Build executed in folder: $build_folder"