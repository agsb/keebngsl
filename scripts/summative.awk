#!/usr/bin/awk
# agsb@ 2026
#
# calculate the effort for use numeric layouts
# input: lemma fppm
#       lemma is a word converted to touchs
# 

# prepare
BEGIN {

        # sum of counts
        
        sumc = 0.0

        sumw = 0.0
        
        sumv = 0.0

        }

# read the file
{
        # skip any comments
        if ($1 == "^#") next;

        # wise 
        $0 = tolower ($0)

        # many characters
        w = split ($1,is,"")
        
        # many occurences 
        v = $2

        # absolute sum
        sumv += 0.0 + v

        # weigth sum
        sumw += 0.0 + v * w

        # count words
        sumc++

        }

END {
        print " keystrokes: " sumw " corpus: " sumv " lemmas: " sumc " mean length: " sumw / sumv " mean: " sumw / sumc " "

        }
