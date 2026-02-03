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
        
        sumw = 0.0
        
        suma = 0.0

        }

# read the file
{
        # skip any comments
        if ($1 == "^#") next;

        # wise 
        $0 = tolower ($0)

        w = split ($1,is,"")
        
        # sum all fppms

        v = $2/1000000.0

        # absolute sum
        suma += 0.0 + v

        # weighted sum
        sumw += 0.0 + v * w

        }

END {
        print " " sumw " " suma " "

        }
