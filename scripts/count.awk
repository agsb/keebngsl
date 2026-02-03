#!/usr/bin/awk
# agsb@ 2026
#
# calculate the effort for use numeric layouts
# input: lemma fppm
#       lemma is a word converted to touchs
# 

# prepare
BEGIN {

        # count lines
        lines = 0

        # sum of counts
        sum = 0.0
                
        }

# read the file
{
        lines++
        
        # skip header at first line
        if (lines == 1) next;

        # skip any comments
        if ($1 == "#") next;

        # wise 
        $0 = tolower ($0)

        w = split ($1,is,"")
        
        # sum all fppms

        # absolute sum
        suma += 0.0 + $2/1000000.0

        # weighted sum
        sump += 0.0 + $2/1000000.0 * w

        }

END {
        print " total touchs " sump " in " suma " ppm absolute count "

        }
