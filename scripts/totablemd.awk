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

        w = ARGV[1] 
        close (ARGV[1])

        }

# read the file
{

        # skip any comments
        if ($1 == "^#") next;


        if (NR == 1) {
                for (i = 1; i < NF+1; i++) {
                        printf (" | id %d ", i)
                        }
                printf " | \n"

                for (i = 1; i < NF+1; i++) {
                        printf (" | --- ")
                        }
                printf " | \n"
                }
        
        for (i = 1; i < NF+1; i++) {
                printf (" | %s", $i)
                }
        printf (" | \n")

        }

END {

        }


