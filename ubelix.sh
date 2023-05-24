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
#SBATCH --array=0-53

#### Your shell commands below this line ####

declare -a arr=(

"DOL_m015-Xh15-Yh1_default.yml"
"NoDOL_m02-Xh15-Yh1_default.yml"
"NoDOL_m025-Xh15-Yh1_default.yml"
"DOL_m025-Xh15-Yh1_default.yml"
"DOL_m025-Xh5-Yh1_default.yml"
"DOL_m02-Xh15-Yh1_default.yml"
"DOL_m015-Xh3-Yh1_default.yml"
"DOL_m025-Xh3-Yh1_default.yml"
"NoDOL_m02-Xh5-Yh1_default.yml"
"DOL_m02-Xh3-Yh1_default.yml"
"NoDOL_m02-Xh3-Yh1_default.yml"
"NoDOL_m015-Xh3-Yh1_default.yml"
"NoDOL_m015-Xh5-Yh1_default.yml"
"DOL_m02-Xh5-Yh1_default.yml"
"DOL_m015-Xh5-Yh1_default.yml"
"NoDOL_m025-Xh5-Yh1_default.yml"
"NoDOL_m025-Xh3-Yh1_default.yml"
"NoDOL_m015-Xh15-Yh1_default.yml"

"NoDOL_m02-Xh3-Yh1_NoRelatedness.yml"
"NoDOL_m025-Xh3-Yh1_NoRelatedness.yml"
"NoDOL_m015-Xh5-Yh1_NoRelatedness.yml"
"NoDOL_m025-Xh15-Yh1_NoRelatedness.yml"
"DOL_m025-Xh3-Yh1_NoRelatedness.yml"
"DOL_m015-Xh15-Yh1_NoRelatedness.yml"
"DOL_m025-Xh15-Yh1_NoRelatedness.yml"
"NoDOL_m025-Xh5-Yh1_NoRelatedness.yml"
"DOL_m02-Xh5-Yh1_NoRelatedness.yml"
"DOL_m02-Xh15-Yh1_NoRelatedness.yml"
"DOL_m015-Xh5-Yh1_NoRelatedness.yml"
"NoDOL_m015-Xh3-Yh1_NoRelatedness.yml"
"NoDOL_m015-Xh15-Yh1_NoRelatedness.yml"
"NoDOL_m02-Xh15-Yh1_NoRelatedness.yml"
"DOL_m025-Xh5-Yh1_NoRelatedness.yml"
"NoDOL_m02-Xh5-Yh1_NoRelatedness.yml"
"DOL_m015-Xh3-Yh1_NoRelatedness.yml"
"DOL_m02-Xh3-Yh1_NoRelatedness.yml"

"NoDOL-m025-Xh3-Yh1_NoGA.yml"
"DOL-m025-Xh15-Yh1_NoGA.yml"
"DOL-m015-Xh3-Yh1_NoGA.yml"
"DOL-m025-Xh3-Yh1_NoGA.yml"
"DOL-m015-Xh15-Yh1_NoGA.yml"
"NoDOL-m025-Xh5-Yh1_NoGA.yml"
"DOL-m02-Xh5-Yh1_NoGA.yml"
"NoDOL-m025-Xh15-Yh1_NoGA.yml"
"NoDOL-m02-Xh15-Yh1_NoGA.yml"
"NoDOL-m02-Xh5-Yh1_NoGA.yml"
"NoDOL-m02-Xh3-Yh1_NoGA.yml"
"DOL-m02-Xh3-Yh1_NoGA.yml"
"DOL-m025-Xh5-Yh1_NoGA.yml"
"DOL-m02-Xh15-Yh1_NoGA.yml"
"DOL-m015-Xh5-Yh1_NoGA.yml"
"NoDOL-m015-Xh3-Yh1_NoGA.yml"
"NoDOL-m015-Xh5-Yh1_NoGA.yml"
"NoDOL-m015-Xh15-Yh1_NoGA.yml"


		)

srun ./build/App "parameters/${arr[$SLURM_ARRAY_TASK_ID]}"
