#!/usr/bin/awk
# agsb@ 2026/02

# cumulatives of a numeric 12 keyboard
# input: - lemma fppm
#       lemma is a trigram
#       fppm is a frequency per million
#

BEGIN {
        
       # define the order for characters

        it = ARGV[1]

        # define the ordened sequential array
        n = split (it, is, ":")

        delete ARGV[1]

        }

{
        # skip comments
        if ($1 == "^#") next;

        # define fppm by trigrams
        ws[$2] = $3

        }

END {

        # complement the list with no shows
        # awk does it :)

        # calculate the sums in either order, using groups of 8 keys
        for (i = 1; i < 9; i++) {
        
                for (j = 9; j < 17; j++) {
                       
                       for (k = 17; k < 25; k++) {

                                sum = 0.0
                        
                                w = is[i] is[j] is[k]
                                sum += ws[w] + 0.0

                                w = is[i] is[k] is[j]
                                sum += ws[w] + 0.0

                                w = is[j] is[i] is[k]
                                sum += ws[w] + 0.0
                                
                                w = is[j] is[k] is[i]
                                sum += ws[w] + 0.0
                                
                                w = is[k] is[i] is[j]
                                sum += ws[w] + 0.0
                                
                                w = is[k] is[j] is[i]
                                sum += ws[w] + 0.0
                                
				# use best order as index
                                w = is[i] is[j] is[k]
                                vs[w] = sum
                                }
                        }       
                }


        # lists the trigrams and fppms, mark begin of line with '*'
        for (w in vs) {

                print "* " w " " vs[w] + 0.0 " "

                }

      }
