#!/bin/bash

# You must specify a valid email address!
#SBATCH --mail-user=ig2500@columbia.edu

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
#SBATCH --array=0-35

#### Your shell commands below this line ####

declare -a arr=(

"DOL_m01-Xh3-Yh01_NoGA_gs3.yml"
"DOL_m01-Xh5-Yh01_NoGA_gs3.yml"
"DOL_m01-Xh7-Yh01_NoGA_gs3.yml"
"DOL_m02-Xh3-Yh01_NoGA_gs3.yml"
"DOL_m02-Xh5-Yh01_NoGA_gs3.yml"
"DOL_m02-Xh7-Yh01_NoGA_gs3.yml"
"DOL_m03-Xh3-Yh01_NoGA_gs3.yml"
"DOL_m03-Xh5-Yh01_NoGA_gs3.yml"
"DOL_m03-Xh7-Yh01_NoGA_gs3.yml"

"DOL_m01-Xh3-Yh01_NoGA_gs7.yml"
"DOL_m01-Xh5-Yh01_NoGA_gs7.yml"
"DOL_m01-Xh7-Yh01_NoGA_gs7.yml"
"DOL_m02-Xh3-Yh01_NoGA_gs7.yml"
"DOL_m02-Xh5-Yh01_NoGA_gs7.yml"
"DOL_m02-Xh7-Yh01_NoGA_gs7.yml"
"DOL_m03-Xh3-Yh01_NoGA_gs7.yml"
"DOL_m03-Xh5-Yh01_NoGA_gs7.yml"
"DOL_m03-Xh7-Yh01_NoGA_gs7.yml"

"DOL_m01-Xh3-Yh01_Xn0_Xo3.yml"
"DOL_m01-Xh5-Yh01_Xn0_Xo3.yml"
"DOL_m01-Xh7-Yh01_Xn0_Xo3.yml"
"DOL_m02-Xh3-Yh01_Xn0_Xo3.yml"
"DOL_m02-Xh5-Yh01_Xn0_Xo3.yml"
"DOL_m02-Xh7-Yh01_Xn0_Xo3.yml"
"DOL_m03-Xh3-Yh01_Xn0_Xo3.yml"
"DOL_m03-Xh5-Yh01_Xn0_Xo3.yml"
"DOL_m03-Xh7-Yh01_Xn0_Xo3.yml"

"DOL_m01-Xh3-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m01-Xh5-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m01-Xh7-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m02-Xh3-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m02-Xh5-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m02-Xh7-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m03-Xh3-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m03-Xh5-Yh01_Xn0_Xo3_FixedDispersal.yml"
"DOL_m03-Xh7-Yh01_Xn0_Xo3_FixedDispersal.yml"

		)

srun ./build/App "parameters/${arr[$SLURM_ARRAY_TASK_ID]}"
