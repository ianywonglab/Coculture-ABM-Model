#!/bin/bash
#SBATCH -J ABM_Simulation_Parameter_Sweep
#SBATCH -t 95:55:00
#SBATCH --array=1-48

# Use '%A' for array-job ID, '%J' for job ID and '%a' for task ID
#SBATCH -e param_sweep_job-%a.err
#SBATCH -o param_sweep_job-%a.out

module load MATLAB/2017b

echo "Starting job $SLURM_ARRAY_TASK_ID on $HOSTNAME"
matlab -nodisplay -nosplash -r "coculture_model($SLURM_ARRAY_TASK_ID); exit"

#module load anaconda/3-5.2.0
#source activate wonglab
#python coculture_viz.py --job $SLURM_ARRAY_TASK_ID
