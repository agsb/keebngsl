#!/usr/bin/awk
# agsb@ 2026/02
#
# input: - lemma fppm
#       lemma is a bigram
#       fppm is a frequency per million
#

BEGIN {
        
        # define the order for characters

        w = ARGV[1] 

        delete ARGV[1]

        sum = 0
        }

{
        # skip comments
        if ($1 == "^#") next

        n = split($2, ws, "")

        if ( sub(ws[1], "&", w) == 0) next

        if ( sub(ws[2], "&", w) == 0) next

        if ( sub(ws[3], "&", w) == 0) next

        sub(ws[1], "", w)

        sub(ws[2], "", w)

        sub(ws[3], "", w)

        print "* " $2 " " $3 " "

        sum += 0.0 + $3

        }

END {

        print "# " sum

      }

      
