#!/usr/bin/bash

# agsb@2026
# convert characters to number of touchs
# not counting separator for repeats

# using eficient design, etoa
sed -e " s/[etoanhir]/1/g; s/[slducbfy]/22/g; s/[mwpgvkxj]/333/g; s/[qz]/4444/g;"

