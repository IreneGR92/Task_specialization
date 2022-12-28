#!/bin/bash

# You must specify a valid email address!
#SBATCH --mail-user=ig17c521@campus.unibe.ch

# Mail on NONE, BEGIN, END, FAIL, REQUEUE, ALL
#SBATCH --mail-type=end,fail

# Job name
#SBATCH --job-name="TaskSpecialization"

# Runtime and memory
#SBATCH --time=96:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH --cpus-per-task=1

# Partition
#SBATCH --partition=epyc2

# For parallel jobs

##SBATCH --nodes=5
##SBATCH --ntasks=5
##SBATCH --ntasks-per-node=1


##SBATCH --output=/path/to/outfile
##SBATCH --error=/path/to/errfile

# For array jobs
# Indicate how many input files you have
#SBATCH --array=0-69 //TODO: Number of runs, remember to change!

#### Your shell commands below this line ####

declare -a arr=(

#   MUTATION MODIFIED  #
"default_bias1-RN-m01.ylm"
"default_bias1-RN-m02.ylm"
"default_bias1-RN-m03.ylm"
"default_bias1-RN-m015.ylm"
"default_bias1-RN-m025.ylm"
"default_bias2-RN-m01.ylm"
"default_bias2-RN-m02.ylm"
"default_bias2-RN-m03.ylm"
"default_bias2-RN-m015.ylm"
"default_bias2-RN-m025.ylm"
"default_bias3-RN-m01.ylm"
"default_bias3-RN-m02.ylm"
"default_bias3-RN-m03.ylm"
"default_bias3-RN-m015.ylm"
"default_bias3-RN-m025.ylm"
"default_bias4-RN-m01.ylm"
"default_bias4-RN-m02.ylm"
"default_bias4-RN-m03.ylm"
"default_bias4-RN-m015.ylm"
"default_bias4-RN-m025.ylm"
"default_bias15-RN-m01.ylm"
"default_bias15-RN-m02.ylm"
"default_bias15-RN-m03.ylm"
"default_bias15-RN-m015.ylm"
"default_bias15-RN-m025.ylm"
"default_bias25-RN-m01.ylm"
"default_bias25-RN-m02.ylm"
"default_bias25-RN-m03.ylm"
"default_bias25-RN-m015.ylm"
"default_bias25-RN-m025.ylm"
"default_bias35-RN-m01.ylm"
"default_bias35-RN-m02.ylm"
"default_bias35-RN-m03.ylm"
"default_bias35-RN-m015.ylm"
"default_bias35-RN-m025.ylm"
"noRelatedness_bias1-RN-m01.ylm"
"noRelatedness_bias1-RN-m02.ylm"
"noRelatedness_bias1-RN-m03.ylm"
"noRelatedness_bias1-RN-m015.ylm"
"noRelatedness_bias1-RN-m025.ylm"
"noRelatedness_bias2-RN-m01.ylm"
"noRelatedness_bias2-RN-m02.ylm"
"noRelatedness_bias2-RN-m03.ylm"
"noRelatedness_bias2-RN-m015.ylm"
"noRelatedness_bias2-RN-m025.ylm"
"noRelatedness_bias3-RN-m01.ylm"
"noRelatedness_bias3-RN-m02.ylm"
"noRelatedness_bias3-RN-m03.ylm"
"noRelatedness_bias3-RN-m015.ylm"
"noRelatedness_bias3-RN-m025.ylm"
"noRelatedness_bias4-RN-m01.ylm"
"noRelatedness_bias4-RN-m02.ylm"
"noRelatedness_bias4-RN-m03.ylm"
"noRelatedness_bias4-RN-m015.ylm"
"noRelatedness_bias4-RN-m025.ylm"
"noRelatedness_bias15-RN-m01.ylm"
"noRelatedness_bias15-RN-m02.ylm"
"noRelatedness_bias15-RN-m03.ylm"
"noRelatedness_bias15-RN-m015.ylm"
"noRelatedness_bias15-RN-m025.ylm"
"noRelatedness_bias25-RN-m01.ylm"
"noRelatedness_bias25-RN-m02.ylm"
"noRelatedness_bias25-RN-m03.ylm"
"noRelatedness_bias25-RN-m015.ylm"
"noRelatedness_bias25-RN-m025.ylm"
"noRelatedness_bias35-RN-m01.ylm"
"noRelatedness_bias35-RN-m02.ylm"
"noRelatedness_bias35-RN-m03.ylm"
"noRelatedness_bias35-RN-m015.ylm"
"noRelatedness_bias35-RN-m025.ylm"

		)

srun ./build/App "parameters/${arr[$SLURM_ARRAY_TASK_ID]}"
