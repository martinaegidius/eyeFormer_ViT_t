#!/bin/bash

### General options
### -- specify queue --
#BSUB -q gpua100
### -- set the job Name --
#BSUB -J CUDA-transformer
### -- ask for number of cores (default: 1) --
#BSUB -n 1
#BSUB -gpu "num=1:mode=exclusive_process"
### -- specify that the cores must be on the same host --
#BSUB -R "span[hosts=1]"
### -- specify that we need 2GB of memory per core/slot --
#BSUB -R "rusage[mem=3GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot --
#BSUB -M 3GB
### -- set walltime limit: hh:mm --
#BSUB -W 24:00
### -- set the email address --
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u gygridd@gmail.com
### -- send notification at start --
#BSUB -B
### -- send notification at completion --
#BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -o HPC_OUT/Output_%J.out
#BSUB -e HPC_OUT/Error_%J.err

# here follow the commands you want to execute
module load python3/3.10.2
source $HOME/bachelroenv/bin/activate
python3 vit_callscript.py 0 >> overfittingExp/bigger_overfit_results_BIGGERDSETS.log

