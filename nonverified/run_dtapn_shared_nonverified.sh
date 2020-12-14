#!/bin/bash
#SBATCH --time=2:05:00
#SBATCH --mail-user=akaton20@student.aau.dk
#SBATCH --mail-type=FAIL
#SBATCH --partition=naples
#SBATCH --mem=128000
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4

echo "Shared dtapn non satisfied query"
for i in 10 20 30 40 50 60 70 80 90 100
do
	echo "Running Shared_$i non satisfied query.."
	let tokens=$i*20
	{ time timeout -k 2s 15m ./verifydtapn-linux64 -k $tokens -o 1 -m 0 -z Data/satisfied/Shared/Shared_$i.txt Data/satisfied/Shared/Shared_$i.xml Data/satisfied/Shared/Shared_$i.q ; } 2> Results/satisfied/Shared/Shared_$i.txt
	echo "Done!"
done
echo "Done!"
