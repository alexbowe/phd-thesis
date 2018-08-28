#!/bin/bash
M=8000
K=64
stdbuf -o 0 time dsk ~/data/readsets-local/chrom14.fa.gz $K -t1 -m $M -c -o ~/data/dsk_runs/chrom14_k${K}_t1_nocount 2>&1 | tee time-dsk-chrom14-k${K}-t1
#stdbuf -o 0 time dsk ~/data/readsets-local/chrom14.fa.gz $K -t1 -m $M -c -o ~/data/dsk_runs/chrom14_k${K}_t1_nocount 2>&1 | tee time-dsk-chrom14-k${K}-t1
