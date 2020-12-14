#!/bin/bash
#SBATCH --time=2:05:00
#SBATCH --mail-user=akaton20@student.aau.dk
#SBATCH --mail-type=FAIL
#SBATCH --partition=naples
#SBATCH --mem=128000
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

echo "Worst dtapn non satisfied query"
for i in 4 7 10 13 16 19 22 25 28 31
do
	echo "Running Worst_$i non satisfied.."
	let tokens=$i*20
	{ time timeout -k 2s 15m ./verifydtapn-linux64 -k $tokens -o 1 -m 0 Data/satisfied/Worst/Worst_$i.xml Data/satisfied/Worst/Worst_$i.q ; } 2> Results/satisfied/Worst/Worst_$i.txt 
	echo "Done!"
done
echo "Done batch 1"
