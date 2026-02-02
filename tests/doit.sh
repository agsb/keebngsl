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

cat z9 | sed -e "s/\(.\{,8\}\)/@\1/g;" > z10

# each group of 8 keys have same touch cost

awk -f bigrs.awk `sed -e 's/ *//g' < z9 ` < z4 | sort -n -k3 -t' '> z21

awk -f trigrs.awk `sed -e 's/ *//g' < z9 ` < z5 | sort -n -k3 -t' '> z31

awk -f select.awk < z21 > z22

grep -E `cat z22 | cut -f 2  -d ' ' | tr  '\n' ' ' | tr ' ' '|' | sed -e 's/.$//' ` z31 > z32

# each group of 8 keys have same touch cost

# @etoanhir@slducbfy@mwpgvkxj@qz

cat z10 | \
        sed -e "s/@/\]\/+\/g; s\/\[/g;" | \
        sed -e "s/\([^;]*;\)\(.*\)/ sed -e \"\2\1\"/; " | \
        sed -e "s/+/1/; s/+/22/; s/+/333/; s/+/4444/; " > z11

sh z11 < z0 > z12


