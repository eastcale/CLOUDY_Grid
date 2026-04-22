#!/bin/bash
#SBATCH --account=gr-astroseismo
#SBATCH --job-name=ngc4151
#SBATCH --output=./ngc_outs/ngc_%j.out
#SBATCH --error=./ngc_outs/ngc_%j.err
#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G

source ~/.bashrc
cd /project/gr-astroseismo/ceastlun/gals/ngc_grid

file=ngc_temp.in
newfile=${file%_temp.in}_hden${1}_upar${2}.in

sed -e "s/<<h_density>>/$(printf "%.5f" $1)/g" -e "s/<<u_param>>/$(printf "%.2f" $2)/g" $file > $newfile
echo "$newfile submitted"

./rn "${newfile%.in}"

echo "Run successful, removing $newfile"
rm $newfile


