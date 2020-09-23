#!/bin/bash

# Performs benchmarks on the kenlm bigram model generator

TIME_OUTPUT='time.csv'
SIZE_OUTPUT='size.csv'
PERFORMANCE_OUTPUT='performance.csv'

# clean csv files
rm $TIME_OUTPUT $SIZE_OUTPUT $PERFORMANCE_OUTPUT
# remove models
rm bigram bigram.arpa

if [ $# -eq 1 ]; then
    ./train.sh $1
elif [ $# -eq 0 ]; then
    ./train.sh 9
else
    echo "usage: ./kenlm.sh [number-of-training-slices]"
    echo "if no arguments are given, the default slice count is 9"
    exit 1
fi