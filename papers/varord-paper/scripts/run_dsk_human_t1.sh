#!/bin/bash
stdbuf -o 0 time dsk ~/data/human-file-list 56 -t1 -m 16384 -c -o ~/data/dsk_runs/human_k56_t1_nocount 2>&1 | tee time-dsk-human-t1
