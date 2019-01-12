#!/bin/bash
echo "Before:"
free -m
sudo swapoff -a
sudo swapon -a
sync
sudo -s echo "3" > /proc/sys/vm/drop_caches
echo "After:"
free -m
sudo swapoff -a
