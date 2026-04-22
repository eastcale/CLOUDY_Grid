#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=ceastlun@uwyo.edu
#SBATCH --account=gr-astroseismo
#SBATCH --job-name=ngc_sub
#SBATCH --output=ngc_sub.out
#SBATCH --error=ngc_sub.err
#SBATCH --time=70:00:00
#SBATCH --mem=1G

source ~/.bashrc
cd /project/gr-astroseismo/ceastlun/gals/ngc_grid

for hden in 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0
do 
    for upar in -4.0 -3.5 -3.0 -2.5 -2.0 -1.5 -1.0
    do
        echo "H-density=$hden; U=$upar"
        sbatch par_grid.sh $hden $upar
        sleep 0.2
    done
done