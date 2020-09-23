#!/bin/bash

# Performs benchmarks on the kenlm bigram model generator

TIME_OUTPUT='time.csv'
SIZE_OUTPUT='size.csv'
PERFORMANCE_OUTPUT='performance.csv'

# clean csv files
> $TIME_OUTPUT 
> $SIZE_OUTPUT 
> $PERFORMANCE_OUTPUT

# remove models
if [ -f bigram ] || [ -f bigram.arpa ]; then
    rm bigram bigram.arpa
fi

if [ $# -eq 1 ]; then
    ./train.sh $1
elif [ $# -eq 0 ]; then
    for i in {1..9}
    do 
        ./train.sh $i
    done
else
    echo "usage: ./kenlm.sh [number-of-training-slices]"
    echo "if no arguments are given, the default slice count is 9"
    exit 1
fi