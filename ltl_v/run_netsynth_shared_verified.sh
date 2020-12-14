#!/bin/bash
#SBATCH --time=01:05:00
#SBATCH --mail-user=akaton20@student.aau.dk
#SBATCH --mail-type=FAIL
#SBATCH --partition=naples
#SBATCH --mem=128000
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

echo "Shared satisfied in netsynth"
for i in 10 20 30 40 50 60 70 80 90 100 200 300 400 500 600 700 800 900 1000
do
	echo "Running Shared_$i satisfied.."
	{ time timeout -k 1s 5m ./netsynth solve ltl/satisfied/Shared_$i.ltl ; } 2> ltl_results/satisfied/Shared/Shared_$i.txt
	echo "Done!"
done
echo "Run done!"
