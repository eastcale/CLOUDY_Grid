#!/bin/bash
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=ceastlun@uwyo.edu
#SBATCH --account=gr-astroseismo
#SBATCH --job-name=orII
#SBATCH --output=./orII_outs/orII_%j.out
#SBATCH --error=./orII_outs/orII_%j.err
#SBATCH --time=36:00:00
#SBATCH --cpus-per-task=8
#SBATCH --mem=8G

source ~/.bashrc
cd /project/gr-astroseismo/ceastlun/gals/orion_grid

file=orion_temp.in
newfile=${file%_temp.in}_hden${1}_upar${2}_temp${3}.in

sed -e "s/<<h_density>>/$(printf "%.5f" $1)/g" -e "s/<<u_param>>/$(printf "%.2f" $2)/g" -e "s/<<temp>>/$(printf "%.2f" $3)/g" $file > $newfile
echo "$newfile submitted"

./rn "${newfile%.in}"

echo "Run successful, removing $newfile"
rm $newfile


