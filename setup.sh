#!/bin/bash

# sets up kenlm amd lmplz aliases
# sets up 1b-word corpus aliases

alias lmplz='/u/demorali/bin/x86_64/moses_3.0/bin/lmplz'
alias lmplzbin='/u/demorali/bin/x86_64/moses_3.0/bin/build_binary'
alias 1bword='cat /u/demorali/corpora/1g-word-lm-benchmark-r13output/training-monolingual.tokenized.shuffled/news.en-0000*-of-00100'
alias 1btest='cat /u/demorali/corpora/1g-word-lm-benchmark-r13output/heldout-monolingual.tokenized.shuffled/news.en-00000-of-00100'

