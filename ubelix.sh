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
#SBATCH --array=0-71

#### Your shell commands below this line ####

declare -a arr=(

"DOL_m02-Xh3-Yh1_RN.yml"
"DOL_m02-Xh3-Yh006_RN.yml"
"DOL_m02-Xh3-Yh008_RN.yml"
"DOL_m02-Xh3-Yh12_RN.yml"
"DOL_m02-Xh5-Yh1_RN.yml"
"DOL_m02-Xh5-Yh006_RN.yml"
"DOL_m02-Xh5-Yh008_RN.yml"
"DOL_m02-Xh5-Yh12_RN.yml"
"DOL_m02-Xh7-Yh1_RN.yml"
"DOL_m02-Xh7-Yh006_RN.yml"
"DOL_m02-Xh7-Yh008_RN.yml"
"DOL_m02-Xh7-Yh12_RN.yml"
"DOL_m015-Xh3-Yh1_RN.yml"
"DOL_m015-Xh3-Yh006_RN.yml"
"DOL_m015-Xh3-Yh008_RN.yml"
"DOL_m015-Xh3-Yh12_RN.yml"
"DOL_m015-Xh5-Yh1_RN.yml"
"DOL_m015-Xh5-Yh006_RN.yml"
"DOL_m015-Xh5-Yh008_RN.yml"
"DOL_m015-Xh5-Yh12_RN.yml"
"DOL_m015-Xh7-Yh1_RN.yml"
"DOL_m015-Xh7-Yh006_RN.yml"
"DOL_m015-Xh7-Yh008_RN.yml"
"DOL_m015-Xh7-Yh12_RN.yml"
"DOL_m025-Xh3-Yh1_RN.yml"
"DOL_m025-Xh3-Yh006_RN.yml"
"DOL_m025-Xh3-Yh008_RN.yml"
"DOL_m025-Xh3-Yh12_RN.yml"
"DOL_m025-Xh5-Yh1_RN.yml"
"DOL_m025-Xh5-Yh006_RN.yml"
"DOL_m025-Xh5-Yh008_RN.yml"
"DOL_m025-Xh5-Yh12_RN.yml"
"DOL_m025-Xh7-Yh1_RN.yml"
"DOL_m025-Xh7-Yh006_RN.yml"
"DOL_m025-Xh7-Yh008_RN.yml"
"DOL_m025-Xh7-Yh12_RN.yml"
		)

srun ./build/App "parameters/${arr[$SLURM_ARRAY_TASK_ID]}"
