#!/usr/bin/awk
# agsb@ 2026/02
# cumulatives of a numeric 12 keyboard
# input: - tri-gram count

BEGIN {
        
        it = ARGV[1] 

        n = split (it, is, "")

        delete ARGV[1]
        }

{
        # skip comments
        if ($1 == "#") next;

        ws[$2] = $3

        }

END {

        # complement the list with no shows
        # awk does it :)

        # calculate the sums in either order
        for (i = 1; i <= 8; i++) {
        
                for (j = 9; j <= 16; j++) {
                       
                       for (k = 17; k <= 24; k++) {

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
                                
                                w = is[i] is[j] is[k]
                                vs[w] = sum
                                }
                        }       
                }

        # lists the ngrams and sums

        for (w in vs) {

                print "* " w " " vs[w] + 0.0 " "

                }

      }
