#!/bin/bash
# NOTE: run make_cosmo.sh first
#DATA_DIR=~/data/dsk_runs
INPUT=$1 #$DATA_DIR/chrom14_k56_t1_nocount.solid_kmers_binary
K=$2 #56
LOG_DIR=../logs
OUTPUT_DIR=~/data/ssd/
COSMO_DIR=~/projects/cosmo
BUILD=$COSMO_DIR/cosmo-build
BENCHMARK=$COSMO_DIR/cosmo-benchmark
TIME="/usr/bin/time -v"
BASENAME=${INPUT##*/}
NO_EXT=${BASENAME%.*}
MEM=2048
N=3


if [ $# -lt 1 ]
  then
    echo "Not enough arguments supplied. Please supply file and k value."
    exit
fi

if [ ! $K ]; then
K=$(echo $BASENAME | grep -o "_k.._" | sed s/_//g | sed s/k//)
fi

if [ $K -lt 33 ]; then
    BUILD=${BUILD}32
elif [ $K -lt 65 ]; then
    BUILD=${BUILD}64
else
    echo "K=${K} not supported."
    exit
fi

mkdir -p $LOG_DIR

sudo ./clear_mem.sh
sudo swapoff -a

for (( i=1; i<=$N; i++ ))
do
  LOG=$LOG_DIR/${NO_EXT}_build_m${MEM}_${i}.log
  echo -n "" > $LOG #clear log
  COMMAND="$BUILD $INPUT -k $K -m $MEM -d -o $OUTPUT_DIR"
  echo ">> $COMMAND" >> $LOG
  stdbuf -o 0 $TIME $COMMAND 2>&1 | tee -a $LOG
  sudo ./clear_mem.sh
done

for (( i=1; i<=$N; i++ ))
do
  LOG=$LOG_DIR/${NO_EXT}_build_m${MEM}_varord_${i}.log
  echo -n "" > $LOG #clear log
  COMMAND="$BUILD $INPUT -k $K -m $MEM -dv -o $OUTPUT_DIR"
  echo ">> $COMMAND" >> $LOG
  stdbuf -o 0 $TIME $COMMAND  2>&1 | tee -a $LOG
  sudo ./clear_mem.sh
done

LOG=$LOG_DIR/${NO_EXT}_bench.log
echo -n "" > $LOG
COMMAND="${BENCHMARK} $OUTPUT_DIR/${NO_EXT}.dbg"
echo ">> $COMMAND" >> $LOG
stdbuf -o 0 $TIME $COMMAND 2>&1 | tee $LOG
sudo ./clear_mem.sh

LOG=$LOG_DIR/${NO_EXT}_bench_varord.log
echo -n "" > $LOG
COMMAND="${BENCHMARK}-varord $OUTPUT_DIR/${NO_EXT}.dbg"
echo ">> $COMMAND" >> $LOG
stdbuf -o 0 $TIME $COMMAND 2>&1 | tee $LOG
