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
#SBATCH --array=0-107

#### Your shell commands below this line ####

declare -a arr=(

"DOL_m01-Xh3-Yh004_default.yml"
"DOL_m01-Xh3-Yh006_default.yml"
"DOL_m01-Xh5-Yh004_default.yml"
"DOL_m01-Xh5-Yh006_default.yml"
"DOL_m01-Xh7-Yh004_default.yml"
"DOL_m01-Xh7-Yh006_default.yml"
"DOL_m02-Xh3-Yh004_default.yml"
"DOL_m02-Xh3-Yh006_default.yml"
"DOL_m02-Xh5-Yh004_default.yml"
"DOL_m02-Xh5-Yh006_default.yml"
"DOL_m02-Xh7-Yh004_default.yml"
"DOL_m02-Xh7-Yh006_default.yml"
"DOL_m03-Xh3-Yh004_default.yml"
"DOL_m03-Xh3-Yh006_default.yml"
"DOL_m03-Xh5-Yh004_default.yml"
"DOL_m03-Xh5-Yh006_default.yml"
"DOL_m03-Xh7-Yh004_default.yml"
"DOL_m03-Xh7-Yh006_default.yml"
"NoDOL_m01-Xh3-Yh004_default.yml"
"NoDOL_m01-Xh3-Yh006_default.yml"
"NoDOL_m01-Xh5-Yh004_default.yml"
"NoDOL_m01-Xh5-Yh006_default.yml"
"NoDOL_m01-Xh7-Yh004_default.yml"
"NoDOL_m01-Xh7-Yh006_default.yml"
"NoDOL_m02-Xh3-Yh004_default.yml"
"NoDOL_m02-Xh3-Yh006_default.yml"
"NoDOL_m02-Xh5-Yh004_default.yml"
"NoDOL_m02-Xh5-Yh006_default.yml"
"NoDOL_m02-Xh7-Yh004_default.yml"
"NoDOL_m02-Xh7-Yh006_default.yml"
"NoDOL_m03-Xh3-Yh004_default.yml"
"NoDOL_m03-Xh3-Yh006_default.yml"
"NoDOL_m03-Xh5-Yh004_default.yml"
"NoDOL_m03-Xh5-Yh006_default.yml"
"NoDOL_m03-Xh7-Yh004_default.yml"
"NoDOL_m03-Xh7-Yh006_default.yml"

"DOL_m01-Xh3-Yh004_NoRelatedness.yml"
"DOL_m01-Xh3-Yh006_NoRelatedness.yml"
"DOL_m01-Xh5-Yh004_NoRelatedness.yml"
"DOL_m01-Xh5-Yh006_NoRelatedness.yml"
"DOL_m01-Xh7-Yh004_NoRelatedness.yml"
"DOL_m01-Xh7-Yh006_NoRelatedness.yml"
"DOL_m02-Xh3-Yh004_NoRelatedness.yml"
"DOL_m02-Xh3-Yh006_NoRelatedness.yml"
"DOL_m02-Xh5-Yh004_NoRelatedness.yml"
"DOL_m02-Xh5-Yh006_NoRelatedness.yml"
"DOL_m02-Xh7-Yh004_NoRelatedness.yml"
"DOL_m02-Xh7-Yh006_NoRelatedness.yml"
"DOL_m03-Xh3-Yh004_NoRelatedness.yml"
"DOL_m03-Xh3-Yh006_NoRelatedness.yml"
"DOL_m03-Xh5-Yh004_NoRelatedness.yml"
"DOL_m03-Xh5-Yh006_NoRelatedness.yml"
"DOL_m03-Xh7-Yh004_NoRelatedness.yml"
"DOL_m03-Xh7-Yh006_NoRelatedness.yml"
"NoDOL_m01-Xh3-Yh004_NoRelatedness.yml"
"NoDOL_m01-Xh3-Yh006_NoRelatedness.yml"
"NoDOL_m01-Xh5-Yh004_NoRelatedness.yml"
"NoDOL_m01-Xh5-Yh006_NoRelatedness.yml"
"NoDOL_m01-Xh7-Yh004_NoRelatedness.yml"
"NoDOL_m01-Xh7-Yh006_NoRelatedness.yml"
"NoDOL_m02-Xh3-Yh004_NoRelatedness.yml"
"NoDOL_m02-Xh3-Yh006_NoRelatedness.yml"
"NoDOL_m02-Xh5-Yh004_NoRelatedness.yml"
"NoDOL_m02-Xh5-Yh006_NoRelatedness.yml"
"NoDOL_m02-Xh7-Yh004_NoRelatedness.yml"
"NoDOL_m02-Xh7-Yh006_NoRelatedness.yml"
"NoDOL_m03-Xh3-Yh004_NoRelatedness.yml"
"NoDOL_m03-Xh3-Yh006_NoRelatedness.yml"
"NoDOL_m03-Xh5-Yh004_NoRelatedness.yml"
"NoDOL_m03-Xh5-Yh006_NoRelatedness.yml"
"NoDOL_m03-Xh7-Yh004_NoRelatedness.yml"
"NoDOL_m03-Xh7-Yh006_NoRelatedness.yml"

"DOL_m01-Xh3-Yh004_NoGA.yml"
"DOL_m01-Xh3-Yh006_NoGA.yml"
"DOL_m01-Xh5-Yh004_NoGA.yml"
"DOL_m01-Xh5-Yh006_NoGA.yml"
"DOL_m01-Xh7-Yh004_NoGA.yml"
"DOL_m01-Xh7-Yh006_NoGA.yml"
"DOL_m02-Xh3-Yh004_NoGA.yml"
"DOL_m02-Xh3-Yh006_NoGA.yml"
"DOL_m02-Xh5-Yh004_NoGA.yml"
"DOL_m02-Xh5-Yh006_NoGA.yml"
"DOL_m02-Xh7-Yh004_NoGA.yml"
"DOL_m02-Xh7-Yh006_NoGA.yml"
"DOL_m03-Xh3-Yh004_NoGA.yml"
"DOL_m03-Xh3-Yh006_NoGA.yml"
"DOL_m03-Xh5-Yh004_NoGA.yml"
"DOL_m03-Xh5-Yh006_NoGA.yml"
"DOL_m03-Xh7-Yh004_NoGA.yml"
"DOL_m03-Xh7-Yh006_NoGA.yml"
"NoDOL_m01-Xh3-Yh004_NoGA.yml"
"NoDOL_m01-Xh3-Yh006_NoGA.yml"
"NoDOL_m01-Xh5-Yh004_NoGA.yml"
"NoDOL_m01-Xh5-Yh006_NoGA.yml"
"NoDOL_m01-Xh7-Yh004_NoGA.yml"
"NoDOL_m01-Xh7-Yh006_NoGA.yml"
"NoDOL_m02-Xh3-Yh004_NoGA.yml"
"NoDOL_m02-Xh3-Yh006_NoGA.yml"
"NoDOL_m02-Xh5-Yh004_NoGA.yml"
"NoDOL_m02-Xh5-Yh006_NoGA.yml"
"NoDOL_m02-Xh7-Yh004_NoGA.yml"
"NoDOL_m02-Xh7-Yh006_NoGA.yml"
"NoDOL_m03-Xh3-Yh004_NoGA.yml"
"NoDOL_m03-Xh3-Yh006_NoGA.yml"
"NoDOL_m03-Xh5-Yh004_NoGA.yml"
"NoDOL_m03-Xh5-Yh006_NoGA.yml"
"NoDOL_m03-Xh7-Yh004_NoGA.yml"
"NoDOL_m03-Xh7-Yh006_NoGA.yml"

"DOL_m01-Xh3-Yh004_Xn0.yml"
"DOL_m01-Xh3-Yh006_Xn0.yml"
"DOL_m01-Xh5-Yh004_Xn0.yml"
"DOL_m01-Xh5-Yh006_Xn0.yml"
"DOL_m01-Xh7-Yh004_Xn0.yml"
"DOL_m01-Xh7-Yh006_Xn0.yml"
"DOL_m02-Xh3-Yh004_Xn0.yml"
"DOL_m02-Xh3-Yh006_Xn0.yml"
"DOL_m02-Xh5-Yh004_Xn0.yml"
"DOL_m02-Xh5-Yh006_Xn0.yml"
"DOL_m02-Xh7-Yh004_Xn0.yml"
"DOL_m02-Xh7-Yh006_Xn0.yml"
"DOL_m03-Xh3-Yh004_Xn0.yml"
"DOL_m03-Xh3-Yh006_Xn0.yml"
"DOL_m03-Xh5-Yh004_Xn0.yml"
"DOL_m03-Xh5-Yh006_Xn0.yml"
"DOL_m03-Xh7-Yh004_Xn0.yml"
"DOL_m03-Xh7-Yh006_Xn0.yml"
"NoDOL_m01-Xh3-Yh004_Xn0.yml"
"NoDOL_m01-Xh3-Yh006_Xn0.yml"
"NoDOL_m01-Xh5-Yh004_Xn0.yml"
"NoDOL_m01-Xh5-Yh006_Xn0.yml"
"NoDOL_m01-Xh7-Yh004_Xn0.yml"
"NoDOL_m01-Xh7-Yh006_Xn0.yml"
"NoDOL_m02-Xh3-Yh004_Xn0.yml"
"NoDOL_m02-Xh3-Yh006_Xn0.yml"
"NoDOL_m02-Xh5-Yh004_Xn0.yml"
"NoDOL_m02-Xh5-Yh006_Xn0.yml"
"NoDOL_m02-Xh7-Yh004_Xn0.yml"
"NoDOL_m02-Xh7-Yh006_Xn0.yml"
"NoDOL_m03-Xh3-Yh004_Xn0.yml"
"NoDOL_m03-Xh3-Yh006_Xn0.yml"
"NoDOL_m03-Xh5-Yh004_Xn0.yml"
"NoDOL_m03-Xh5-Yh006_Xn0.yml"
"NoDOL_m03-Xh7-Yh004_Xn0.yml"
"NoDOL_m03-Xh7-Yh006_Xn0.yml"



		)

srun ./build/App "parameters/${arr[$SLURM_ARRAY_TASK_ID]}"
