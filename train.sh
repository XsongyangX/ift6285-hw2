#!/bin/bash

if [ $# -ne 1 ]; then
    echo "usage: ./train.sh number-of-training-slices"
    exit 1
fi

# get aliases and corpus variables
source setup.sh

# execution variables
TEST_SAMPLE_SIZE=1000
TIME_OUTPUT='time.csv'
SIZE_OUTPUT='size.csv'
PERFORMANCE_OUTPUT='performance.csv'

# cat from slice 1 to given number
feed=""
i=0
for slice in $corpus
do
    if [[ $i == $1 ]]; then
        break
    fi
    feed="$feed$(cat $slice)"
    ((i=i+1))
done

# train model and put training time to csv
echo $feed \
    | lmplz -o 2 -T /tmp -S 80% --arpa bigram.arpa 2>&1 >/dev/null \
    | grep "real" | cut -f 8 | cut -d ':' -f 2 >> $TIME_OUTPUT

# put size to csv
du bigram.arpa | cut -f 1 >> $SIZE_OUTPUT

# examine model performance after building binary
lmplzbin bigram.arpa bigram 2>/dev/null
python query.py --csv $PERFORMANCE_OUTPUT