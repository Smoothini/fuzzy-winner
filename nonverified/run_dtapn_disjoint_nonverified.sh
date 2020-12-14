#!/bin/bash
#SBATCH --time=2:05:00
#SBATCH --mail-user=akaton20@student.aau.dk
#SBATCH --mail-type=FAIL
#SBATCH --partition=naples
#SBATCH --mem=128000
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

echo "Disjoint dtapn non satisfied query"
for i in 100 200 300 400 500
do
	echo "Running Disjoint_$i non satisfied query.."
	let tokens=$i*20
	{ time timeout -k 2s 15m ./verifydtapn-linux64 -k $tokens -o 1 -m 0 -z Data/satisfied/Disjoint/Disjoint_$i.txt Data/satisfied/Disjoint/Disjoint_$i.xml Data/satisfied/Disjoint/Disjoint_$i.q ; } 2> Results/satisfied/Disjoint/Disjoint_$i.txt
	echo "Done!"
done
echo "Done!"
