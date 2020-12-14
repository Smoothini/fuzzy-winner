#!/bin/bash
#SBATCH --time=02:05:00
#SBATCH --mail-user=akaton20@student.aau.dk
#SBATCH --mail-type=FAIL
#SBATCH --partition=naples
#SBATCH --mem=128000
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

echo "Disjoint satisfied in netsynth"
for i in 10 20 30 40 50 60 70 80 90 100 200 300 400 500 600 700 800 900 1000 2000 3000 4000 5000
do
	echo "Running Disjoint_$i satisfied.."
	{ time timeout -k 1s 15m ./netsynth solve ltl/satisfied/Disjoint_$i.ltl ; } 2> ltl_results/satisfied/Disjoint/Disjoint_$i.txt 
	echo "Done!"
done
echo "Run done!"
