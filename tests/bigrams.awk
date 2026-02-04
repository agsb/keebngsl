#!/usr/bin/awk
# agsb@ 2026/02
#
# cumulatives of a numeric 12 keyboard
# input: - lemma fppm
#       lemma is a bigram
#       fppm is a frequency per million
#

BEGIN {
        
        # define the order for characters

        w = ARGV[1] 

        # define the ordened sequential array
        n = split (w, is, " ")

        delete ARGV[1]
        }

{
        # skip comments
        if ($1 == "^#") next;

        # define fppm by bigrams
        ws[$2] = $3

        }

END {

        # complement the list with no shows
        # awk does it :)

        # calculate the sums in either order, using groups of 8 keys
        for (i = 1; i < 9; i++) {
        
                for (j = 9; j < 17; j++) {
                        
                        a = is[i] is[j]

                        b = is[j] is[i]
                        
                        # sum the fppm
                        vs[a] = ws[a] + ws[b] + 0.0 

                        }       
                }

        # lists the bigrams and fppms, mark begin of line with '*'
        for (w in vs) {

                print "* " w " " vs[w] + 0.0 " "

                }

      }

      
