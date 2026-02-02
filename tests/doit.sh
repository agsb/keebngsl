#! /bin/bash

# frequencies
awk -f redux.awk < z0 > z1

# percents
cat z1 | grep '%' | sort -nr -k 3 -t' '  | tee z2 | awk -f cumux.awk > zc2

# letters
cat z1 | grep '-' | sort -nr -k 3 -t' '  | tee z3 | awk -f cumux.awk > zc3

# digrams
cat z1 | grep '=' | sort -nr -k 3 -t' '  | tee z4 | awk -f cumux.awk > zc4

# trigrams
cat z1 | grep '+' | sort -nr -k 3 -t' '  | tee z5 | awk -f cumux.awk > zc5

# quadgrams
cat z1 | grep '\^' | sort -nr -k 3 -t' '  | tee z6 | awk -f cumux.awk > zc6

# digrams that no exists
cat z1 | grep '~' | sort -k 2 -t' ' > z7

# how many no exists by first letter
cat z1 | grep '?' | sort -nr -k 3 -t' ' > z8

# select order for letters

cat z3 | tr -d '\n[:digit:]-. ' >  z9

cat z9 | sed -e "s/\(.\{8\}\)/@\1/g;" > z10

awk -f bigrs.awk `sed -e 's/ *//g' < z9 ` < z4 | sort -n -k3 -t' '> t2

awk -f trigrs.awk `sed -e 's/ *//g' < z9 ` < z5 | sort -n -k3 -t' '> t3

