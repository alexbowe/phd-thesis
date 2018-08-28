#!/bin/bash
DIR=~/data/dsk_runs
EXT=solid_kmers_binary
FILES="ecoli_k28_t1_nocount chrom14_k56_t1_nocount human_k56_t2_nocount parrot_k56_t1_nocount chrom14_k16_t1_nocount chrom14_k32_t1_nocount chrom14_k48_t1_nocount chrom14_k64_t1_nocount"
LOG_DIR=../logs
SWAPPINESS=`cat /proc/sys/vm/swappiness`
sudo sysctl vm.swappiness=0

#./run_experiment.sh ~/data/

mkdir -p $LOG_DIR

for file in $FILES
do
  FILE=$DIR/${file}.$EXT
  ls $FILE -lh > $LOG_DIR/${file}_info.log
  sudo nice -n -20 ./run_experiment.sh $FILE
done

sudo sysctl vm.swappiness=$SWAPPINESS
sudo swapon -a
