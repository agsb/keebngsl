#!/usr/bin/awk
# agsb@ 2026/02
#
# calculate cumulative frequency 
#
# input frequencies from converted to 'lemma fppm'
#       lemma a word
#       fppm  a frequency ( in parts per million )
#

# prepare
BEGIN {

        # sum of counts
        sum = 0.0
                
        }

# read the file
{

        # skip any comments
        if ($1 == "^#") next;

        # sum all fppms

        sum += 0.0 + $3

        print $1 " " $2 " " $3 " " sum " "

        }

END {


        }


