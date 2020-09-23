#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: ./train.sh number-of-training-slices"
    exit 1
fi

# get aliases and corpus variables
shopt -s expand_aliases
source setup.sh

# execution variables
TEST_SAMPLE_SIZE=1000
TIME_OUTPUT='time.csv'
SIZE_OUTPUT='size.csv'
PERFORMANCE_OUTPUT='performance.csv'

# train model and put training time to csv
segment=$(slice $1)
cat $segment \
    | lmplz -o 2 -T /tmp -S 80% --arpa bigram.arpa 2>&1 >/dev/null \
    | grep "real" | cut -f 8 | cut -d ':' -f 2 >> $TIME_OUTPUT

# put size to csv
ls -l --size -h bigram.arpa | cut -f 6 -d ' ' >> $SIZE_OUTPUT

# examine model performance after building binary
lmplzbin bigram.arpa bigram 2>/dev/null
python query.py --csv $PERFORMANCE_OUTPUT