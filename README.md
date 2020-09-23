# ift6285-hw2
This is a homework repo for ift6285.

# Installation
* `kenlm` Python API module (https://github.com/kpu/kenlm)

# Scripts
* `kenlm.sh` runs the benchmark test suite
* `train.sh` runs one individual benchmark test and logs the results
* `source setup.sh` creates aliases for use in the command line
* `query.py` examines a model from kenlm. The model is named 'bigram' and tests against the testing slice of the corpus.

# Results and data
* The `1B-word` corpus is presumed to be on disk at the paths inside `setup.sh`
* `time.csv` lists the training time per corpus slice counts (starting at 1 and increasing by one on each subsequent row)
* `size.csv` lists the disk space taken up by the model per trained corpus slice counts (starting at 1 and increasing by one on each subsequent row)
* `performance.csv` lists the (mean, max, min) perplexities of the model on 1000 test sentences per trained corpus slice counts (starting at 1 and increasing by one on each subsequent row)

# Note
The scripts are meant to be run on DIRO's ens.iro.umontreal.ca, accessible via a proxy jump through arcade.iro.umontreal.ca.
`ssh -J you@arcade.iro.umontreal.ca you@ens.iro.umontreal.ca`
