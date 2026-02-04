#!/usr/bin/awk
# agsb@ 2026/02
#
# input: - lemma fppm
#       lemma is a bigram
#       fppm is a frequency per million
#

BEGIN {
        
        sum = 0
        ws = ""

        }

{
        # skip comments
        if ($1 == "^#") next

        n = split($2, w, "")

        if ( sub(w[1], "&", ws) > 0) next

        if ( sub(w[2], "&", ws) > 0) next

        ws = ws $2

        print "* " $2 " " $3 " "

        sum += 0.0 + $3

        }

END {

        print "# " sum

      }

      
