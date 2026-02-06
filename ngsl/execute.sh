#! /usr/bin/bash

# ae define frequencies

## frequencies
awk -f reduce.awk < $1 > $1.z0

## characters
cat $1.z0 | grep '-' | sort -gr -k 3 -t' '  | tee $1.z1 | awk -f cumulative.awk > $1.z1c

## digrams
cat $1.z0 | grep '=' | sort -gr -k 3 -t' '  | tee $1.z2 | awk -f cumulative.awk > $1.z2c

## trigrams
cat $1.z0 | grep '+' | sort -gr -k 3 -t' '  | tee $1.z3 | awk -f cumulative.awk > $1.z3c

## quadgrams
cat $1.z0 | grep '\^' | sort -gr -k 3 -t' '  | tee $1.z4 | awk -f cumulative.awk > $1.z4c

## percents
cat $1.z0 | grep '%' | sort -gr -k 3 -t' '  | tee $1.z5 | awk -f cumulative.awk > $1.z5c

## character best order
cat $1.z1 | tr -d '\n[:digit:]-. ' | sed 's/\(.\)/\1 /g;' >  $1.z6

## digrams that no exists
cat $1.z0 | grep '~' | sort -k 2 -t' ' > $1.z7

## how many not exist by first character
cat $1.z0 | grep '?' | sort -n -k 3 -t' ' > $1.z8

# prepare for regex
# cat $1.z6 | sed -e 's/ //g; s/\(.\{,8\}\)/@\1/g; ' > $1.z9

# sum frequencies of characters in any order and sort by fppm

cat $1.z6 | sed -e 's/ */ /g; s/^ *//; s/ *$//;' > $1.z9

awk -f bigrams.awk  "`cat $1.z9 `" < $1.z2 | sort -n -k3 -t' '> $1.z20

awk -f trigrams.awk "`cat $1.z9 `" < $1.z3 | sort -n -k3 -t' '> $1.z30

# process the bigrams list by character order and frequency

> $1.z21
for n in `cat $1.z9` ; do
        grep " ${n}" $1.z20 >> $1.z21
done

awk -f filter2.awk < $1.z21 > $1.z22

# process the bigrams list by character order and frequency

cat $1.z22 | tr -d "[:digit:]#.*\n" | \
        sed -e 's/  */ /g; s/^ *//; s/ *$//;' > $1.z10

> $1.z31
for n in `cat $1.z10` ; do
        grep " ${n}" $1.z30 >> $1.z31
done

# case for priority by low counts of 0.0

grep ' 0 ' $1.z31 | uniq -c -s 2 -w 2 | sort -n | \
        tr -s ' ' | cut -f 4 -d ' ' | tr '\n' ' ' | \
        sed -e 's/\(..\). /\1 /g' > $1.z11

# re order
> $1.z31
for n in `cat $1.z11` ; do
        grep " ${n}" $1.z30 >> $1.z31
done

awk -f filter3.awk < $1.z31 > $1.z32


# compare designs

# prepare for substitution
# each group of 8 keys have same touch cost
# each character is replaced by digits as touch cost

# common layout

# replaces
cat $1 | sed -e " s/[adgjmptw]/1/g; s/[behknqux]/22/g; s/[cfilorvy]/333/g; s/[sz]/4444/g;" > $1.z40

# ngsl layout
cat $1.z9 | sed -e "s/ //g; s/\(.\{,8\}\)/@\1/g;" | \
        sed -e "s/@/\]\/+\/g; s\/\[/g;" | \
        sed -e "s/\([^;]*;\)\(.*\)/ sed -e \"\2\1\"/; " | \
        sed -e "s/+/1/; s/+/22/; s/+/333/; s/+/4444/; " > $1.z33

# replaces
cat $1 | sh $1.z33 > $1.z41


# sumarize as ppm

> $1.sum

# full keyboard, one key one touch
echo ": full keyboard " >> $1.sum
awk -f summative.awk < $1 >> $1.sum

# eight keys keyboard common
echo ": common numeric keyboard " >> $1.sum
awk -f summative.awk < $1.z40 >> $1.sum

echo ": design numeric keyboard " >> $1.sum
# eight keys keyboard design
awk -f summative.awk < $1.z41 >> $1.sum


echo "# results " > results
echo "# bigrams " >> results
cat $1.z22 >> results
echo "# trigrams " >> results
cat $1.z32 >> results
echo "# uses " >> results
cat $1.sum >> results
echo "# order " >> results
cat $1.z9  >> results

mv results $1.rst

