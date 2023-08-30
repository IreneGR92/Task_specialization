#!/bin/bash

#SBATCH --account=free

# Mail on NONE, BEGIN, END, FAIL, REQUEUE, ALL
#SBATCH --mail-user=ig2500@campus.unibe.ch
#SBATCH --mail-type=end,fail

# Job name
#SBATCH --job-name="TaskSpecialization"

# Runtime and memory
#SBATCH --time=120:00:00
#SBATCH --mem-per-cpu=2G
#SBATCH --cpus-per-task=1


##SBATCH --output=/path/to/outfile
##SBATCH --error=/path/to/errfile

# For array jobs
# Indicate how many input files you have
#SBATCH --array=0-135

#### Your shell commands below this line ####

declare -a arr=(

"DOL_m01-Xh3-Yh008_default_noAge.yml"
"DOL_m01-Xh3-Yh006_default_noAge.yml"
"DOL_m01-Xh5-Yh008_default_noAge.yml"
"DOL_m01-Xh5-Yh006_default_noAge.yml"
"DOL_m01-Xh7-Yh008_default_noAge.yml"
"DOL_m01-Xh7-Yh006_default_noAge.yml"
"DOL_m02-Xh3-Yh008_default_noAge.yml"
"DOL_m02-Xh3-Yh006_default_noAge.yml"
"DOL_m02-Xh5-Yh008_default_noAge.yml"
"DOL_m02-Xh5-Yh006_default_noAge.yml"
"DOL_m02-Xh7-Yh008_default_noAge.yml"
"DOL_m02-Xh7-Yh006_default_noAge.yml"
"DOL_m03-Xh3-Yh008_default_noAge.yml"
"DOL_m03-Xh3-Yh006_default_noAge.yml"
"DOL_m03-Xh5-Yh008_default_noAge.yml"
"DOL_m03-Xh5-Yh006_default_noAge.yml"
"DOL_m03-Xh7-Yh008_default_noAge.yml"
"DOL_m03-Xh7-Yh006_default_noAge.yml"
"NoDOL_m01-Xh3-Yh008_default_noAge.yml"
"NoDOL_m01-Xh3-Yh006_default_noAge.yml"
"NoDOL_m01-Xh5-Yh008_default_noAge.yml"
"NoDOL_m01-Xh5-Yh006_default_noAge.yml"
"NoDOL_m01-Xh7-Yh008_default_noAge.yml"
"NoDOL_m01-Xh7-Yh006_default_noAge.yml"
"NoDOL_m02-Xh3-Yh008_default_noAge.yml"
"NoDOL_m02-Xh3-Yh006_default_noAge.yml"
"NoDOL_m02-Xh5-Yh008_default_noAge.yml"
"NoDOL_m02-Xh5-Yh006_default_noAge.yml"
"NoDOL_m02-Xh7-Yh008_default_noAge.yml"
"NoDOL_m02-Xh7-Yh006_default_noAge.yml"
"NoDOL_m03-Xh3-Yh008_default_noAge.yml"
"NoDOL_m03-Xh3-Yh006_default_noAge.yml"
"NoDOL_m03-Xh5-Yh008_default_noAge.yml"
"NoDOL_m03-Xh5-Yh006_default_noAge.yml"
"NoDOL_m03-Xh7-Yh008_default_noAge.yml"
"NoDOL_m03-Xh7-Yh006_default_noAge.yml"
"DOL_m015-Xh3-Yh008_default_noAge.yml"
"DOL_m015-Xh3-Yh006_default_noAge.yml"
"DOL_m015-Xh5-Yh008_default_noAge.yml"
"DOL_m015-Xh5-Yh006_default_noAge.yml"
"DOL_m015-Xh7-Yh008_default_noAge.yml"
"DOL_m015-Xh7-Yh006_default_noAge.yml"
"DOL_m025-Xh3-Yh008_default_noAge.yml"
"DOL_m025-Xh3-Yh006_default_noAge.yml"
"DOL_m025-Xh5-Yh008_default_noAge.yml"
"DOL_m025-Xh5-Yh006_default_noAge.yml"
"DOL_m025-Xh7-Yh008_default_noAge.yml"
"DOL_m025-Xh7-Yh006_default_noAge.yml"
"NoDOL_m015-Xh3-Yh008_default_noAge.yml"
"NoDOL_m015-Xh3-Yh006_default_noAge.yml"
"NoDOL_m015-Xh5-Yh008_default_noAge.yml"
"NoDOL_m015-Xh5-Yh006_default_noAge.yml"
"NoDOL_m015-Xh7-Yh008_default_noAge.yml"
"NoDOL_m015-Xh7-Yh006_default_noAge.yml"
"NoDOL_m025-Xh3-Yh008_default_noAge.yml"
"NoDOL_m025-Xh3-Yh006_default_noAge.yml"
"NoDOL_m025-Xh5-Yh008_default_noAge.yml"
"NoDOL_m025-Xh5-Yh006_default_noAge.yml"
"NoDOL_m025-Xh7-Yh008_default_noAge.yml"
"NoDOL_m025-Xh7-Yh006_default_noAge.yml"


		)

srun ./build/App "parameters/${arr[$SLURM_ARRAY_TASK_ID]}"
