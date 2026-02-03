#! /bin/bash

# frequencies
awk -f reduce.awk < $1 > $1.z0

# characters
cat $1.z0 | grep '-' | sort -nr -k 3 -t' '  | tee $1.z1 | awk -f cumulative.awk > $1.z1c

# digrams
cat $1.z0 | grep '=' | sort -nr -k 3 -t' '  | tee $1.z2 | awk -f cumulative.awk > $1.z2c

# trigrams
cat $1.z0 | grep '+' | sort -nr -k 3 -t' '  | tee $1.z3 | awk -f cumulative.awk > $1.z3c

# quadgrams
cat $1.z0 | grep '\^' | sort -nr -k 3 -t' '  | tee $1.z4 | awk -f cumulative.awk > $1.z4c

# percents
cat $1.z0 | grep '%' | sort -nr -k 3 -t' '  | tee $1.z5 | awk -f cumulative.awk > $1.z5c

# digrams that no exists
cat $1.z0 | grep '~' | sort -k 2 -t' ' > $1.z6

# how many no exists by first character
cat $1.z0 | grep '?' | sort -nr -k 3 -t' ' > $1.z7

# select order for characters
# eg: @etoanhir@slducbfy@mwpgvkxj@qz


cat $1.z1 | tr -d '\n[:digit:]-. ' >  $1.z8

# sum frequencies of characters in any order

awk -f bigrams.awk  `sed -e 's/ *//g' < $1.z8 ` < $1.z2 | sort -n -k3 -t' '> $1.z20

awk -f trigrams.awk `sed -e 's/ *//g' < $1.z8 ` < $1.z3 | sort -n -k3 -t' '> $1.z30

# select tuples

# for bigrams
awk -f select.awk < $1.z20 > $1.z21

# for trigrams
# mask for any trigrams with bigrams already defined
# echo "`cat $1.z20 | cut -f 2  -d ' ' | tr  '\n' ' ' | tr ' ' '|' | sed -e 's/.$//' `"

grep -E `cat $1.z20 | cut -f 2  -d ' ' | tr  '\n' ' ' | tr ' ' '|' | sed -e 's/.$//' ` $1.z30 > $1.z31

# compare designs

cat $1 | sed -e " s/[adgjmptw]/1/g; s/[behknqux]/22/g; s/[cfilorvy]/333/g; s/[sz]/4444/g;" > $1.abc

# prepare for substitution
# each group of 8 keys have same touch cost
# each character is replaced by digits as touch cost

cat $1.z8 | sed -e "s/\(.\{,8\}\)/@\1/g;" | tee $1.z9 | \
        sed -e "s/@/\]\/+\/g; s\/\[/g;" | \
        sed -e "s/\([^;]*;\)\(.*\)/ sed -e \"\2\1\"/; " | \
        sed -e "s/+/1/; s/+/22/; s/+/333/; s/+/4444/; " > $1.z11

# replaces
sh $1.z11 < $1 > $1.eto


# sumarize as ppm

> $1.sum

# full keyboard, one key one touch
echo ": full keyboard " >> $1.sum
awk -f summative.awk < $1 >> $1.sum

# eight keys keyboard common
echo ": common numeric keyboard, abc def ghi jkl mno pqrs tuv wxyz " >> $1.sum
awk -f summative.awk < $1.abc >> $1.sum

echo ": design numeric keyboard " >> $1.sum
# eight keys keyboard design
awk -f summative.awk < $1.eto >> $1.sum




