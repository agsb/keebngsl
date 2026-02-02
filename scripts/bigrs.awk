#!/usr/bin/awk
# agsb@ 2026/02
# cumulatives of a numeric 12 keyboard
# input: - letter count

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
                        
                        a = is[i] is[j]

                        b = is[j] is[i]
                        
                        vs[a] = ws[a] + ws[b] + 0.0 

                        }       
                }

        # lists the digrams and sums

        for (w in vs) {

                print "* " w " " vs[w] + 0.0 " "

                }

      }
