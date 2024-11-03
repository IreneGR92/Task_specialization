#!/bin/bash
#
srun -A e3b --pty -t 0-02:00 sh build_insomnia.sh

sbatch -A e3b insomnia.sh